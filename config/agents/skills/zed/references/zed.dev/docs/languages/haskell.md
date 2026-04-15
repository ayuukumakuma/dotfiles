---
title: "Haskell | Haskell"
source_url: "https://zed.dev/docs/languages/haskell"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Haskell](https://zed.dev/docs/languages/haskell.html#haskell)

Haskell support is available through the [Haskell extension](https://github.com/zed-extensions/haskell).

* Tree-sitter: [tree-sitter-haskell](https://github.com/tree-sitter/tree-sitter-haskell)
* Language Server: [haskell-language-server](https://github.com/haskell/haskell-language-server)

## [Installing HLS](https://zed.dev/docs/languages/haskell.html#installing-hls)

Recommended method to [install haskell-language-server](https://haskell-language-server.readthedocs.io/en/latest/installation.html) (HLS) is via [ghcup](https://www.haskell.org/ghcup/install/) (`curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh` ):

```
ghcup install hls
which haskell-language-server-wrapper
```

## [Configuring HLS](https://zed.dev/docs/languages/haskell.html#configuring-hls)

If you need to configure haskell-language-server (hls) you can add configuration options to your Zed settings.json:

```
{
  "lsp": {
    "hls": {
      "initialization_options": {
        "haskell": {
          "formattingProvider": "fourmolu"
        }
      }
    }
  }
}
```

See the official [configuring haskell-language-server](https://haskell-language-server.readthedocs.io/en/latest/configuration.html) docs for more options.

If you would like to use a specific hls binary, or perhaps use [static-ls](https://github.com/josephsumabat/static-ls) as a drop-in replacement instead, you can specify the binary path and arguments:

```
{
  "lsp": {
    "hls": {
      "binary": {
        "path": "static-ls",
        "arguments": ["--experimentalFeatures"]
      }
    }
  }
}
```

[Groovy](https://zed.dev/docs/languages/groovy.html "Groovy")
[Helm](https://zed.dev/docs/languages/helm.html "Helm")
