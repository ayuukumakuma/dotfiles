---
title: "Nim | Nim"
source_url: "https://zed.dev/docs/languages/nim"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Nim](https://zed.dev/docs/languages/nim.html#nim)

Nim language support in Zed is provided by the community-maintained [Nim extension](https://github.com/foxoman/zed-nim).
Report issues to: <https://github.com/foxoman/zed-nim/issues>

* Tree-sitter: [alaviss/tree-sitter-nim](https://github.com/alaviss/tree-sitter-nim)
* Language Server: [nim-lang/langserver](https://github.com/nim-lang/langserver)

## [Formatting](https://zed.dev/docs/languages/nim.html#formatting)

To use [arnetheduck/nph](https://github.com/arnetheduck/nph) as a formatter, follow the [nph installation instructions](https://github.com/arnetheduck/nph?tab=readme-ov-file#installation).

Configure formatting in Settings (`cmd-,|ctrl-,`) under Languages > Nim, or add to your settings file:

```
  "languages": {
    "Nim": {
      "formatter": {
        "external": {
          "command": "nph",
          "arguments": ["-"]
        }
      }
    }
  }
```

[Markdown](https://zed.dev/docs/languages/markdown.html "Markdown")
[OCaml](https://zed.dev/docs/languages/ocaml.html "OCaml")
