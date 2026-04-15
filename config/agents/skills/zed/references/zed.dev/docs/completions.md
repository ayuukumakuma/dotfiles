---
title: "Code Completions | Code Completions - Zed"
source_url: "https://zed.dev/docs/completions"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Completions](https://zed.dev/docs/completions.html#completions)

Zed supports two sources for completions:

1. "Code Completions" provided by Language Servers (LSPs) automatically installed by Zed or via [Zed Language Extensions](https://zed.dev/docs/languages.html).
2. "Edit Predictions" provided by Zed's own Zeta model or by external providers like [GitHub Copilot](https://zed.dev/docs/completions.html#github-copilot).

## [Language Server Code Completions](https://zed.dev/docs/completions.html#code-completions)

When there is an appropriate language server available, Zed will provide completions of variable names, functions, and other symbols in the current file. You can disable these by adding the following to your Zed `settings.json` file:

```
"show_completions_on_input": false
```

You can manually trigger completions with `ctrl-space` or by triggering the `editor::ShowCompletions` action from the command palette.

> Note: Using `ctrl-space` in Zed requires disabling the macOS global shortcut.
> Open **System Settings** > **Keyboard** > **Keyboard Shortcut**s >
> **Input Sources** and uncheck **Select the previous input source**.

For more information, see:

* [Configuring Supported Languages](https://zed.dev/docs/configuring-languages.html)
* [List of Zed Supported Languages](https://zed.dev/docs/languages.html)

## [Edit Predictions](https://zed.dev/docs/completions.html#edit-predictions)

Zed has built-in support for predicting multiple edits at a time [via Zeta](https://huggingface.co/zed-industries/zeta), Zed's open-source and open-data model.
Edit predictions appear as you type, and most of the time, you can accept them by pressing `tab`.

See the [edit predictions documentation](https://zed.dev/docs/ai/edit-prediction.html) for more information on how to setup and configure Zed's edit predictions.

[Editing Code](https://zed.dev/docs/editing-code.html "Editing Code")
[Snippets](https://zed.dev/docs/snippets.html "Snippets")
