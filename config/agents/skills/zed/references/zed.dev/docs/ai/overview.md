---
title: "Overview | AI Code Editor Documentation - Zed"
source_url: "https://zed.dev/docs/ai/overview"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [AI](https://zed.dev/docs/ai/overview.html#ai)

Zed is an open-source AI code editor. AI runs throughout the editing experience: agents that read and write your code, inline transformations, code completions on every keystroke, and conversations with models in any buffer.

## [How Zed approaches AI](https://zed.dev/docs/ai/overview.html#how-zed-approaches-ai)

Zed's AI features run inside a native, GPU-accelerated application built in Rust. There is no Electron layer between you and the model output.

* **Open source.** The editor and all AI features are [open source](https://github.com/zed-industries/zed). You can read how AI is implemented, how data flows to providers, and how tool calls execute.
* **Multi-model.** Use Zed's hosted models or [bring your own API keys](https://zed.dev/docs/ai/llm-providers.html) from Anthropic, OpenAI, Google, Ollama, and 8+ other providers. Run local models, connect to cloud APIs, or mix both. Switch models per task.
* **External agents.** Run Claude Agent, Gemini CLI, Codex, and other CLI-based agents directly in Zed through the [Agent Client Protocol](https://zed.dev/acp). See [External Agents](https://zed.dev/docs/ai/external-agents.html).
* **Privacy by default.** AI data sharing is opt-in. When you use your own API keys, Zed maintains zero-data retention agreements with providers. See [Privacy and Security](https://zed.dev/docs/ai/privacy-and-security.html).

## [Agentic editing](https://zed.dev/docs/ai/overview.html#agentic-editing)

The [Agent Panel](https://zed.dev/docs/ai/agent-panel.html) is where you work with AI agents. Agents can read files, edit code, run terminal commands, search the web, and access diagnostics through [built-in tools](https://zed.dev/docs/ai/tools.html).

You can extend agents with additional tools through [MCP servers](https://zed.dev/docs/ai/mcp.html), control what they can access with [tool permissions](https://zed.dev/docs/ai/tool-permissions.html), and shape their behavior with [rules](https://zed.dev/docs/ai/rules.html).

The [Inline Assistant](https://zed.dev/docs/ai/inline-assistant.html) works differently: select code or a terminal command, describe what you want, and the model rewrites the selection in place. It works with multiple cursors.

## [Code completions](https://zed.dev/docs/ai/overview.html#code-completions)

[Edit Prediction](https://zed.dev/docs/ai/edit-prediction.html) provides AI code completions on every keystroke. Each keypress sends a request to the prediction provider, which returns single or multi-line suggestions you accept with `tab`.

The default provider is Zeta, Zed's open-source model trained on open data. You can also use GitHub Copilot, or Codestral.

## [Text threads](https://zed.dev/docs/ai/overview.html#text-threads)

[Text Threads](https://zed.dev/docs/ai/text-threads.html) are conversations with models inside any buffer. They work like a regular editor with your keybindings, multiple cursors, and standard editing features. Content is organized into message blocks with roles (You, Assistant, System).

## [Getting started](https://zed.dev/docs/ai/overview.html#getting-started)

* [Configuration](https://zed.dev/docs/ai/configuration.html): Connect to Anthropic, OpenAI, Ollama, Google AI, or other LLM providers.
* [External Agents](https://zed.dev/docs/ai/external-agents.html): Run Claude Agent, Codex, Aider, or other external agents inside Zed.
* [Subscription](https://zed.dev/docs/ai/subscription.html): Zed's hosted models and billing.
* [Privacy and Security](https://zed.dev/docs/ai/privacy-and-security.html): How Zed handles data when using AI features.

New to Zed? Start with [Getting Started](https://zed.dev/docs/getting-started.html), then come back here to set up AI. For a higher-level overview, see [zed.dev/ai](https://zed.dev/ai).

[Troubleshooting](https://zed.dev/docs/troubleshooting.html "Troubleshooting")
[Agent Panel](https://zed.dev/docs/ai/agent-panel.html "Agent Panel")
