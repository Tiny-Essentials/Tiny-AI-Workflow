**Disclaimer:** *The information provided herein is speculative and should not be treated as absolute fact.*

### Suno AI Generative Mechanics

It appears that Suno generates music by applying internal data that is not directly accessible to the user. This data contains specific parameters for the generated music, such as the BPM (Beats Per Minute) for each section of a track, which may reflect how the MIDI data for each part of the soundtrack is applied.

Furthermore, there may be other connections, such as the application of specific lyrics or scripts to individual sections of a track. These are likely used to improve the generative coherence of the AI with the rest of the project components.

### MIDI-First Workflow

It is theorized that the data stored on Suno's servers may include MIDI data derived from the background/reference music to enhance the generative quality of the audio during the AI's processing phase. 

This suggests a sequential two-step generation process:
1. **MIDI Generation:** The AI first generates the MIDI structure for the music being processed.
2. **Audio Rendering:** The AI then generates the high-definition audio based on that underlying MIDI foundation.

### Generative Configuration Modes

The AI offers three distinct generative modes:

*   **Fixed Mode:** Designed to generate tracks with minimal modifications while preserving the original melody of the reference track.
*   **Classic Mode:** Attempts to create new content inspired by the reference track, allowing for a higher degree of musical customization.
*   **Smart Mode:** Automatically detects and selects the most appropriate configuration (Fixed or Classic) to be applied autonomously.

### Technical Constraints

*   **Fixed Mode:** This mode typically fails when attempting to edit very long tracks; however, it consistently allows for the editing of very short musical segments.
*   **Classic Mode:** This mode requires a minimum amount of reference music to draw inspiration from (typically between 2 and 5 seconds). It also allows for an optional "custom context window" of 8, 16, 32, or 64 beats.