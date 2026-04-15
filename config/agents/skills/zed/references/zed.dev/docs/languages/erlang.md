---
title: "Erlang | Erlang"
source_url: "https://zed.dev/docs/languages/erlang"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Erlang](https://zed.dev/docs/languages/erlang.html#erlang)

Erlang support is available through the [Erlang extension](https://github.com/zed-extensions/erlang).

* Tree-sitter: [WhatsApp/tree-sitter-erlang](https://github.com/WhatsApp/tree-sitter-erlang)
* Language Servers:
  + [erlang-ls/erlang\_ls](https://github.com/erlang-ls/erlang_ls)
  + [WhatsApp/erlang-language-platform](https://github.com/WhatsApp/erlang-language-platform)

## [Choosing a language server](https://zed.dev/docs/languages/erlang.html#choosing-a-language-server)

The Erlang extension offers language server support for `erlang_ls` and `erlang-language-platform`.

`erlang_ls` is enabled by default.

Configure language servers in Settings (`cmd-,|ctrl-,`) under Languages > Erlang, or add to your settings file:

```
{
  "languages": {
    "Erlang": {
      "language_servers": ["elp", "!erlang-ls", "..."]
    }
  }
}
```

## [See also:](https://zed.dev/docs/languages/erlang.html#see-also)

* [Elixir](https://zed.dev/docs/languages/elixir.html)
* [Gleam](https://zed.dev/docs/languages/gleam.html)

[Emmet](https://zed.dev/docs/languages/emmet.html "Emmet")
[Fish](https://zed.dev/docs/languages/fish.html "Fish")
