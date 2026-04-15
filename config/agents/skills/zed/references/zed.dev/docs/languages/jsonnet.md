---
title: "Jsonnet | Jsonnet"
source_url: "https://zed.dev/docs/languages/jsonnet"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Jsonnet](https://zed.dev/docs/languages/jsonnet.html#jsonnet)

Jsonnet language support in Zed is provided by the community-maintained [Jsonnet extension](https://github.com/narqo/zed-jsonnet).

* Tree-sitter: [sourcegraph/tree-sitter-jsonnet](https://github.com/sourcegraph/tree-sitter-jsonnet)
* Language Server: [grafana/jsonnet-language-server](https://github.com/grafana/jsonnet-language-server)

## [Configuration](https://zed.dev/docs/languages/jsonnet.html#configuration)

Workspace configuration options can be passed to the language server via the `lsp` settings of the `settings.json`.

The following example configures `jsonnet-language-server` to resolve [tanka](https://tanka.dev) import paths:

```
{
  "lsp": {
    "jsonnet-language-server": {
      "settings": {
        "resolve_paths_with_tanka": true
      }
    }
  }
}
```

[JSON](https://zed.dev/docs/languages/json.html "JSON")
[Kotlin](https://zed.dev/docs/languages/kotlin.html "Kotlin")
