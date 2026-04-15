---
title: "IDE Integration | The Unified Toolchain for the Web"
source_url: "https://viteplus.dev/guide/ide-integration"
fetched_at: "2026-03-31T02:50:28.336963+00:00"
---



# IDE Integration [​](https://viteplus.dev/guide/ide-integration.html#ide-integration)

Vite+ supports VS Code through the [Vite Plus Extension Pack](https://marketplace.visualstudio.com/items?itemName=VoidZero.vite-plus-extension-pack) and the VS Code settings that `vp create` and `vp migrate` can automatically write into your project.

## VS Code [​](https://viteplus.dev/guide/ide-integration.html#vs-code)

For the best VS Code experience with Vite+, install the [Vite Plus Extension Pack](https://marketplace.visualstudio.com/items?itemName=VoidZero.vite-plus-extension-pack). It currently includes:

* `Oxc` for formatting and linting via `vp check`
* `Vitest` for test runs via `vp test`

When you create or migrate a project, Vite+ prompts whether you want editor config written for VS Code. You can also manually set up the VS Code config:

`.vscode/extensions.json`

json

```
{
  "recommendations": ["VoidZero.vite-plus-extension-pack"]
}
```

`.vscode/settings.json`

json

```
{
  "editor.defaultFormatter": "oxc.oxc-vscode",
  "oxc.fmt.configPath": "./vite.config.ts",
  "editor.formatOnSave": true,
  "editor.formatOnSaveMode": "file",
  "editor.codeActionsOnSave": {
    "source.fixAll.oxc": "explicit"
  }
}
```

This gives the project a shared default formatter and enables Oxc-powered fix actions on save. Setting `oxc.fmt.configPath` to `./vite.config.ts` keeps editor format-on-save aligned with the `fmt` block in your Vite+ config. Vite+ uses `formatOnSaveMode: "file"` because Oxfmt does not support partial formatting.
