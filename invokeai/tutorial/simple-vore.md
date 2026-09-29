# Vore Image Workflow — Two-Pass Composition Guide

A technical workflow for composing two characters at radically different scales
inside a single coherent image, using InvokeAI (or any Stable Diffusion frontend
with img2img, inpainting and canvas support).

---

## Scope

This document describes a **fictional, non-sexual character art** technique.
The problem being solved is purely technical: how to render two subjects whose
relative scale is too extreme for a single diffusion pass to handle correctly.

---

## 1. The Core Idea

Diffusion models have no concept of absolute scale. They only understand
proportions and composition. If you ask for "a giant character and a tiny
character" in one pass, the model will:

- Shrink the small character into an unreadable smudge, or
- Ignore the scale entirely and draw two normal characters, or
- Merge both into a single malformed subject.

**The solution is to never ask for two scales at once.**

Instead:

1. Generate the scene with the predator only (or with a placeholder prey).
2. Crop the region where the prey should be.
3. Upscale that crop until it is large enough to be rendered as a
   **normal-sized character**.
4. Let the model redraw the prey at that size.
5. Shrink the result back down and composite it into the original image.

The prey is always generated at 1:1 scale. The illusion of scale is created
entirely by the final downscale.

---

## 2. Requirements

| Item | Notes |
| --- | --- |
| InvokeAI | Any recent version. ComfyUI or A1111 also work. |
| A checkpoint | **Tested only on YiffyMix v64.** The same file must be used in every pass. |
| A VAE | Keep it consistent. A VAE mismatch causes a visible color shift. |
| Image editor | GIMP, Krita or Photoshop, for the final composite. |
| VRAM | 8 GB is enough. See the VRAM section below. |

### VRAM note

You do **not** need to upscale to the maximum your GPU can survive.
You need the crop to be large enough that the prey occupies roughly
**512–1024 px** on its longest side *after* upscaling. Beyond that,
you are only burning time.

> **Tested configuration:** This entire workflow was validated exclusively on the
> **YiffyMix v64** checkpoint.

---

## 3. Step 1 — Generate the Base Image

Create the full scene with the predator and the environment.

- The prey **may** be present in the prompt, but it does not need to be
  detailed. Heavy glitches, melted anatomy and artifacts are acceptable here.
  You are only using this pass to establish **composition and lighting**.
- If you prefer, generate the predator alone and add the prey later.

**Save the following before moving on.** You will need all of them:

- The seed
- The full positive and negative prompts
- The checkpoint, VAE and any LoRAs
- The sampler, scheduler, steps and CFG scale

> **Why:** Every subsequent pass must match these values. A different seed or
> sampler changes the lighting and the noise pattern, and the seam becomes
> impossible to hide.

---

## 4. Step 2 — Crop the Prey Region

Open the base image in an image editor.

1. Select the area where the prey will be visible.
2. Include **generous margin** around the prey — at least 30% of the
   subject's width on every side. The model needs surrounding context to
   understand the lighting and the ground plane.
3. Crop and save as a separate file.

Do not crop tightly. A tight crop forces the model to invent context,
which breaks background coherence.

---

## 5. Step 3 — Upscale the Crop

Send the crop to the **Resize** tab in InvokeAI.

- Set the target resolution so the prey will occupy 512–1024 px on its
  longest side.
- Use a **multiplier** that produces a clean integer or half-integer scale
  where possible. This reduces resampling artifacts.
- Upscaling method: **Lanczos** or **Nearest** for the base resize.
  Avoid bicubic here; it softens edges that the model will then over-sharpen.

### Why upscale at all?

Because you are about to ask the model to draw a full character. If you
ask it to draw a character in a 64x64 pixel region, you get 64x64 pixels
of information. The upscale gives the model enough pixels to work with.

### 5.1 Optional — Recover a low-quality prey during upscale

If the prey is **already present** in the base image but at low quality
(blurry, glitched, or too small to read), you can fix it during this same
upscale step instead of waiting for Step 4. InvokeAI's upscaler exposes two
controls that make this possible: Creativity and structure.

#### Suggested starting values

| Goal | Creativity | Structure |
| --- | --- | --- |
| Clean up a blurry prey, keep pose | Low | High |
| Redraw the prey's details, keep pose | Medium | High |
| Redraw the prey and its pose | High | Low |

> **Why this works:** the prey is already in the correct position and
> lighting, so the model only has to add detail, not invent composition.
> This is faster and more coherent than generating the prey from scratch in
> Step 4. If the result is good enough, you can skip directly to the merge
> in Step 7.

---

## 6. Step 4 — Redraw the Prey

This is the most delicate step. Send the upscaled crop to **img2img**
(Resize) or, preferably, to the **Unified Canvas** with the crop as the
base layer.

### 6.1 Prompting

Use the **exact same prompts** from Step 1, then append the prey
description. Do not rewrite the scene prompt.

```text
# Positive prompt template
<quality tags>, <style tags>,
<original scene prompt from Step 1>,
<predator description>, <predator pose>,
<pray description>, <prey pose>, <prey expression>,
<lighting>, <environment>

# Negative prompt template
<original negative prompt from Step 1>,
<additional negatives if needed>
```

### 6.2 Critical settings

| Setting | Value | Reason |
| --- | --- | --- |
| Seed | Same as Step 1 | Preserves the noise pattern and lighting |
| Sampler | Same as Step 1 | Any change shifts the color grading |
| CFG Scale | Same as Step 1 | Different CFG = different contrast |
| Denoising | 0.45 – 0.65 | See below |
| ControlNet | Optional | See section 6.3 |

### 6.3 Denoising: the trade-off

This is the central tension of the entire workflow.

- **Too low (below 0.40):** The model refuses to draw the prey. You get
  a blurry ghost of the original background.
- **Too high (above 0.70):** The model redraws everything, including the
  background, and the merge will not line up.

Start at **0.55** and adjust in increments of 0.05.

### 6.4 ControlNet (recommended)

To keep the composition while still allowing the prey to be drawn, use a
ControlNet with a **low weight**:

| ControlNet | Weight | Effect |
| --- | --- | --- |
| Depth | 0.4 – 0.6 | Preserves 3D layout and ground plane |
| Canny / Lineart | 0.3 – 0.5 | Preserves hard edges of the environment |
| Tile | 0.5 | Preserves color and texture |

Lower weight = more creative freedom = more risk of a broken merge.
Higher weight = safer merge = the prey may not appear.

### 6.5 What you are aiming for

- The prey is fully rendered, sharp and readable.
- The background is **as close to the original crop as possible**.
- Colors, contrast and noise grain match the original.

If the background drifted, lower the denoising strength and try again.

---

## 7. Step 5 — Merge

1. Open the original base image in your image editor.
2. Import the Step 4 result as a new layer.
3. Scale it down until the prey reaches the intended final size.
4. Align it with the original crop position.
5. Set the layer blend mode to **Normal** and the opacity to 100%.

At this point, the background should line up almost perfectly. If it does
not, the problem is in Step 4 — go back and lower the denoising strength.

### 7.1 Blending the seam

1. Add a layer mask to the pasted layer.
2. Paint with a soft brush to hide the hard rectangular edges.
3. Pay attention to areas of high-frequency detail: hair, fur, grass, gravel.
   These hide seams well. Flat walls and skies do not.

### 7.2 Final pass (optional but recommended)

Export the merged image and run it through a final **img2img pass** at a
very low denoising strength (0.15 – 0.25).

- This unifies the grain, the color grading and the sharpness across the
  whole image.
- It is the difference between "good composite" and "single render".
- Do not exceed 0.30 or you will lose the prey again.

---

## 8. Parameter Cheat Sheet

| Parameter | Step 1 | Step 4 | Step 7.2 |
| --- | --- | --- | --- |
| Seed | Fixed | Same as Step 1 | Random |
| Checkpoint | Model A | Model A | Model A |
| VAE | VAE A | VAE A | VAE A |
| Denoising | 1.0 | 0.45 – 0.65 | 0.15 – 0.25 |
| CFG | Same | Same | Same |
| Steps | Same | Same | Same |
| ControlNet | — | Depth 0.5 | — |

---

## 9. Troubleshooting

| Symptom | Likely cause | Fix |
| --- | --- | --- |
| Visible rectangle seam | Background drifted in Step 4 | Lower denoising by 0.05 |
| Color shift at the seam | VAE or checkpoint mismatch | Verify all passes use the same files |
| Prey looks blurry | Crop was too small | Increase the upscale factor in Step 3 |
| Prey is malformed | Denoising too high | Lower by 0.05 and retry |
| Prey does not appear | Denoising too low | Raise by 0.05, or lower ControlNet weight |
| Background is a different image | Denoising too high | Lower it. This is the most common error. |
| Grain mismatch | Post-processing or upscaler applied unevenly | Do the final pass in section 7.2 |

---

## 10. Summary

```text
[1] Base image          -> full scene, prey optional
        |
        +-- save seed, prompt, model, VAE
        |
[2] Crop prey region   -> generous margin
        |
[3] Upscale crop       -> prey at 512-1024 px
        |
[4] Img2img + ControlNet -> same seed, denoise 0.45-0.65
        |
[5] Downscale + composite -> soft mask, blend seam
        |
[6] Final low-denoise pass -> unify grain and grading
        |
      DONE
```

The entire technique rests on one principle: **never ask the model to
render two scales at once.** Render both subjects at 1:1, then let the
compositing software handle the scale difference.
