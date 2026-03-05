---
title: "Helm | Helm"
source_url: "https://zed.dev/docs/languages/helm"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Helm](https://zed.dev/docs/languages/helm.html#helm)

Support for Helm in Zed is provided by the community-maintained [Helm extension](https://github.com/cabrinha/helm.zed).

* Tree-sitter: [tree-sitter-go-template](https://github.com/ngalaiko/tree-sitter-go-template/tree/master)
* Language Server: [mrjosh/helm-ls](https://github.com/mrjosh/helm-ls)

## [Setup](https://zed.dev/docs/languages/helm.html#setup)

Enable Helm language for Helm files by editing your `.zed/settings.json` and adding:

```
  "file_types": {
    "Helm": [
      "**/templates/**/*.tpl",
      "**/templates/**/*.yaml",
      "**/templates/**/*.yml",
      "**/helmfile.d/**/*.yaml",
      "**/helmfile.d/**/*.yml",
      "**/values*.yaml"
    ]
  }
```

This will also mark values.yaml files as the type helm, since helm-ls supports this.

[Haskell](https://zed.dev/docs/languages/haskell.html "Haskell")
[HTML](https://zed.dev/docs/languages/html.html "HTML")
