# OpenWebUI Optimized Chat Configuration

This repository contains my personal configuration suggestions for **OpenWebUI**. 

## 🎯 Objective
The goal of this configuration is to achieve the **perfect balance between a high-utility interface and maximum performance**. 

By disabling certain "auto-generation" features, we reduce the extra processing load (tokens and computation) required by the AI. This results in **faster response times** and lower latency, without sacrificing the essential features needed for a professional programming workflow.

## 🛠️ Recommended Settings

To replicate my interface, navigate to your OpenWebUI settings and apply the following values:

| Setting | Value | Purpose / Benefit |
| :--- | :--- | :--- |
| **Enable Message Queue** | `Enabled` | Ensures smooth message delivery. |
| **Chat Direction** | `Auto` | Adapts to your language direction. |
| **Chat Bubble UI** | `Enabled` | Provides better visual separation between messages. |
| **Fade Effect for Streaming Text** | `Enabled` | Makes real-time text streaming easier to read. |
| **Render Markdown (User & Assistant)** | `Enabled` | **Essential** for reading code and formatted text. |
| **Title Auto-Generation** | `Enabled` | Keeps your chat history organized automatically. |
| **Follow-Up Auto-Generation** | `Disabled` | **Reduces AI overhead for faster responses.** |
| **Chat Tags Auto-Generation** | `Disabled` | **Reduces AI overhead for faster responses.** |
| **Insert Suggestion Prompt to Input** | `Enabled` | Quick access to prompts without extra AI cost. |
| **Regenerate Menu** | `Enabled` | Allows quick iteration on responses. |
| **Render Markdown in Previews** | `Enabled` | Ensures consistency in previews. |
| **Scroll On Branch Change** | `Enabled` | Improves navigation during multi-model chats. |
| **Show Files on Terminal Select** | `Enabled` | Useful for technical/coding workflows. |
| **Stylized PDF Export** | `Enabled` | Better documentation output. |
| **Floating Quick Actions** | `Managed` | Customizes your workflow efficiency. |

## 🧩 Artifacts Configuration

For users performing manual **render tests** or requiring high-speed code execution previews, these settings optimize the sandbox environment.

| Setting | Value | Purpose / Benefit |
| :--- | :--- | :--- |
| **Detect Artifacts Automatically** | `Disabled` | **Minimizes latency.** Prevents the AI from constantly scanning responses, which is ideal when you are manually triggering or testing renders. |
| **iframe Sandbox Allow Same Origin** | `Enabled` | **Ensures functionality.** Allows rendered components to access the same origin, which is necessary for complex web previews. |
| **iframe Sandbox Allow Forms** | `Enabled` | **Enables interaction.** Allows the use of interactive elements (like buttons and inputs) within the rendered artifact. |

## 🚀 Why these settings?

Most users enable every "Auto-Generation" feature available. However, every time the AI generates a "Follow-up question" or a "Chat Tag," it consumes extra processing time and resources. 

**My philosophy:** If the feature doesn't directly help you solve the problem at hand, it should be disabled to keep the AI focused on your primary prompt. This makes your workspace leaner, faster, and more professional.
