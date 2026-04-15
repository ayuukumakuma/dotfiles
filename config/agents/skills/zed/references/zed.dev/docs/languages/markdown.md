---
title: "Markdown | Markdown"
source_url: "https://zed.dev/docs/languages/markdown"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Markdown](https://zed.dev/docs/languages/markdown.html#markdown)

Markdown support is available natively in Zed.

* Tree-sitter: [tree-sitter-markdown](https://github.com/tree-sitter-grammars/tree-sitter-markdown)
* Language Server: N/A

## [Syntax Highlighting Code Blocks](https://zed.dev/docs/languages/markdown.html#syntax-highlighting-code-blocks)

Zed supports language-specific syntax highlighting of markdown code blocks by leveraging [tree-sitter language grammars](https://zed.dev/docs/extensions/languages.html#grammar). All [Zed supported languages](https://zed.dev/docs/languages.html), including those provided by official or community extensions, are available for use in markdown code blocks. All you need to do is provide a language name after the opening ```` ``` ```` code fence like so:

```
```python
import functools as ft

@ft.lru_cache(maxsize=500)
def fib(n):
    return n if n < 2 else fib(n - 1) + fib(n - 2)
```
```

## [Configuration](https://zed.dev/docs/languages/markdown.html#configuration)

### [Format](https://zed.dev/docs/languages/markdown.html#format)

Zed supports using Prettier to automatically re-format Markdown documents. You can trigger this manually via the `editor: format` action or via the `cmd-shift-i|ctrl-shift-i` keyboard shortcut. Alternately, you can enable format on save.

Configure formatting in Settings (`cmd-,|ctrl-,`) under Languages > Markdown, or add to your settings file:

```
  "languages": {
    "Markdown": {
      "format_on_save": "on"
    }
  },
```

### [List Continuation](https://zed.dev/docs/languages/markdown.html#list-continuation)

Zed automatically continues lists when you press Enter at the end of a list item. Supported list types:

* Unordered lists (`-`, `*`, or `+` markers)
* Ordered lists (numbers are auto-incremented)
* Task lists (`- [ ]` and `- [x]`)

Pressing Enter on an empty list item removes the marker and exits the list.

To disable this behavior, configure in Settings (`cmd-,|ctrl-,`) under Languages > Markdown, or add to your settings file:

```
  "languages": {
    "Markdown": {
      "extend_list_on_newline": false
    }
  },
```

### [List Indentation](https://zed.dev/docs/languages/markdown.html#list-indentation)

Zed indents list items when you press Tab while the cursor is on a line containing only a list marker. This allows you to quickly create nested lists.

To disable this behavior, configure in Settings (`cmd-,|ctrl-,`) under Languages > Markdown, or add to your settings file:

```
  "languages": {
    "Markdown": {
      "indent_list_on_tab": false
    }
  },
```

### [Trailing Whitespace](https://zed.dev/docs/languages/markdown.html#trailing-whitespace)

By default Zed will remove trailing whitespace on save. If you rely on invisible trailing whitespace being converted to `<br />` in Markdown files you can disable this behavior.

Configure in Settings (`cmd-,|ctrl-,`) under Languages > Markdown, or add to your settings file:

```
  "languages": {
    "Markdown": {
      "remove_trailing_whitespace_on_save": false
    }
  },
```

[Makefile](https://zed.dev/docs/languages/makefile.html "Makefile")
[Nim](https://zed.dev/docs/languages/nim.html "Nim")
