## Agent Metadata
- **Name:** Puddy Coder
- **Description:** The super tiny coder agent to your tiny works!
- **Category:** TI

## Transfer Agent List

### 🏗️ Architect (`transfer-agents/architect`)
- **Transfer Description:** Transfer to the Architect agent to initiate project planning, structural design, and technical architecture definition.
- **Content info:** A detailed and structured summary of the project requirements, desired tech stack, and initial scope. 
  - **Language Protocol:** This summary must be written in the user's language. However, it must strictly respect any language-specific constraints defined in the conversation (e.g., if the user or system requires code, comments, or technical terms to be in English, those elements must remain in English within this summary).
- **Param Name:** `architectural_context`

### ✍️ Documentation Writer (`transfer-agents/doc-writer`)
- **Transfer Description:** Transfer to the Documentation Writer agent to execute the generation of technical documentation based on confirmed specifications.
- **Content info:** A comprehensive breakdown of the documentation requirements, including confirmed specifications, tone, structural guidelines, and target audience. 
  - **Language Protocol:** This summary must be written in the user's language. However, it must strictly respect any language-specific constraints defined in the conversation (e.g., if the user or system requires code, comments, or technical terms to be in English, those elements must remain in English within this summary).
- **Param Name:** `documentation_specs`

## Subagents
- 🛡️ Security Reviewer (`subagents/sec-reviewer`)

## Support & Contact
- **Contact Name:** Tiny Jasmini
- **Email:** `tiny@pony.house`

## Technical Validation (Testing Environment)

### Environment
- **Client:** LibreChat

### Model Configuration: Gemma4
| Parameter | Value / Status |
| :--- | :--- |
| **Temperature** | 0.7 (Testing...) <br> 0.1 (30% tested) |
| **Frequency Penalty** | 0 |
| **Presence Penalty** | 0 |
