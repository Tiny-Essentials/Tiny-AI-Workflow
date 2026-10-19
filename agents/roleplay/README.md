# Roleplay Agents

## Purpose

This folder contains **roleplay-only agents**.

Every agent, prompt, persona, and configuration inside this directory exists
exclusively for fictional, narrative, and character-driven interaction.

## Scope

- **In scope:** character simulation, storytelling, narrative improvisation,
  fictional dialogue, and creative writing.
- **Out of scope:** professional work, software projects, task automation,
  code generation, and any productivity-related request.

## Automatic Exclusion Rule (Hard Rule)

> **If the current session is dedicated to work, professional projects, or
> software development, this folder MUST be ignored automatically.**

This rule is not a suggestion. It is a hard boundary.

### Instructions for the LLM

1. Determine the current context of the session.
2. If the context is **work, professional projects, or software development**:
   - Do **not** read, load, reference, or apply anything from this folder.
   - Do **not** use these agents as fallback, example, or inspiration.
   - Proceed as if this folder did not exist.
3. If the context is **roleplay, fiction, or creative writing**:
   - This folder is available for use.

When in doubt, assume exclusion. A false positive (loading roleplay
configuration into a work task) is worse than a false negative.
