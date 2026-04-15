---
title: "Luau | Luau"
source_url: "https://zed.dev/docs/languages/luau"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Luau](https://zed.dev/docs/languages/luau.html#luau)

[Luau](https://luau.org/) is a fast, small, safe, gradually typed, embeddable scripting language derived from Lua. Luau was developed by Roblox and is available under the MIT license.

Luau language support in Zed is provided by the community-maintained [Luau extension](https://github.com/4teapo/zed-luau).
Report issues to: <https://github.com/4teapo/zed-luau/issues>

* Tree-sitter: [4teapo/tree-sitter-luau](https://github.com/4teapo/tree-sitter-luau)
* Language Server: [JohnnyMorganz/luau-lsp](https://github.com/JohnnyMorganz/luau-lsp)

## [Configuration](https://zed.dev/docs/languages/luau.html#configuration)

Configuration instructions are available in the [Luau Zed Extension README](https://github.com/4teapo/zed-luau).

## [Formatting](https://zed.dev/docs/languages/luau.html#formatting)

To support automatically formatting your code, you can use [JohnnyMorganz/StyLua](https://github.com/JohnnyMorganz/StyLua), a Lua code formatter.

Install with:

```
# macOS via Homebrew
brew install stylua
# Or via Cargo
cargo install stylua --features lua52,lua53,lua54,luau
```

Configure formatting in Settings (`cmd-,|ctrl-,`) under Languages > Luau, or add to your settings file:

```
  "languages": {
    "Luau": {
      "formatter": {
        "external": {
          "command": "stylua",
          "arguments": ["-"]
        }
      }
    }
  }
```

[Lua](https://zed.dev/docs/languages/lua.html "Lua")
[Makefile](https://zed.dev/docs/languages/makefile.html "Makefile")
