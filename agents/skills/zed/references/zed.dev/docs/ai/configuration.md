---
title: "Configuration | Configure AI in Zed - Providers, Models, and Settings"
source_url: "https://zed.dev/docs/ai/configuration"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Configuration](https://zed.dev/docs/ai/configuration.html#configuration)

You can configure multiple dimensions of AI usage in Zed:

1. Which LLM providers you can use
   * Zed's hosted models, which require [authentication](https://zed.dev/docs/authentication.html) and [subscription](https://zed.dev/docs/ai/subscription.html)
   * [Using your own API keys](https://zed.dev/docs/ai/llm-providers.html), which do not require the above
   * Using [external agents like Claude Agent](https://zed.dev/docs/ai/external-agents.html), which also do not require the above
2. [Model parameters and usage](https://zed.dev/docs/ai/agent-settings.html#model-settings)
3. [Interactions with the Agent Panel](https://zed.dev/docs/ai/agent-settings.html#agent-panel-settings)

## [Turning AI Off Entirely](https://zed.dev/docs/ai/configuration.html#turning-ai-off-entirely)

To disable all AI features, add the following to your settings file ([how to edit](https://zed.dev/docs/configuring-zed.html#settings-files)):

```
{
  "disable_ai": true
}
```

See [this blog post](https://zed.dev/blog/disable-ai-features) for further context on this option.

[Model Context Protocol](https://zed.dev/docs/ai/mcp.html "Model Context Protocol")
[LLM Providers](https://zed.dev/docs/ai/llm-providers.html "LLM Providers")
