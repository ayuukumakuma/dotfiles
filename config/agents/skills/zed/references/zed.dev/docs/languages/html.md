---
title: "HTML | HTML"
source_url: "https://zed.dev/docs/languages/html"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [HTML](https://zed.dev/docs/languages/html.html#html)

HTML support is available through the [HTML extension](https://github.com/zed-industries/zed/tree/main/extensions/html).

* Tree-sitter: [tree-sitter/tree-sitter-html](https://github.com/tree-sitter/tree-sitter-html)
* Language Server: [microsoft/vscode-html-languageservice](https://github.com/microsoft/vscode-html-languageservice)

This extension is automatically installed, but if you do not want to use it, you can add the following to your settings:

```
{
  "auto_install_extensions": {
    "html": false
  }
}
```

## [Formatting](https://zed.dev/docs/languages/html.html#formatting)

By default Zed uses [Prettier](https://prettier.io/) for formatting HTML.

Configure formatting in Settings (`cmd-,|ctrl-,`) under Languages > HTML, or add to your settings file:

```
  "languages": {
    "HTML": {
      "format_on_save": "off",
    }
  }
```

You can still trigger formatting manually with `cmd-shift-i|ctrl-shift-i` or by opening the [command palette](https://zed.dev/docs/getting-started.html#command-palette) (`cmd-shift-p|ctrl-shift-p`) and selecting "Format Document".

### [LSP Formatting](https://zed.dev/docs/languages/html.html#lsp-formatting)

To use the `vscode-html-language-server` language server auto-formatting instead of Prettier, configure the formatter in Settings (`cmd-,|ctrl-,`) under Languages > HTML, or add to your settings file:

```
  "languages": {
    "HTML": {
      "formatter": "language_server",
    }
  }
```

You can customize various [formatting options](https://code.visualstudio.com/docs/languages/html#_formatting) for `vscode-html-language-server` via your Zed `settings.json`:

```
  "lsp": {
    "vscode-html-language-server": {
      "settings": {
        "html": {
          "format": {
            // Indent under <html> and <head> (default: false)
            "indentInnerHtml": true,
            // Disable formatting inside <svg> or <script>
            "contentUnformatted": "svg,script",
            // Add an extra newline before <div> and <p>
            "extraLiners": "div,p"
          }
        }
      }
    }
  }
```

## [Using the Tailwind CSS Language Server with HTML](https://zed.dev/docs/languages/html.html#using-the-tailwind-css-language-server-with-html)

To get all the features (autocomplete, linting, etc.) from the [Tailwind CSS language server](https://github.com/tailwindlabs/tailwindcss-intellisense/tree/HEAD/packages/tailwindcss-language-server#readme) in HTML files, you need to configure the language server so that it knows about where to look for CSS classes by adding the following to your `settings.json`:

```
{
  "lsp": {
    "tailwindcss-language-server": {
      "settings": {
        "experimental": {
          "classRegex": ["class=\"([^\"]*)\""]
        }
      }
    }
  }
}
```

With these settings, you will get completions for Tailwind CSS classes in HTML `class` attributes. Examples:

```
<div class="flex items-center <completion here>">
  <p class="text-lg font-bold <completion here>">Hello World</p>
</div>
```

## [See also](https://zed.dev/docs/languages/html.html#see-also)

* [CSS](https://zed.dev/docs/languages/css.html)
* [JavaScript](https://zed.dev/docs/languages/javascript.html)
* [TypeScript](https://zed.dev/docs/languages/typescript.html)

[Helm](https://zed.dev/docs/languages/helm.html "Helm")
[Java](https://zed.dev/docs/languages/java.html "Java")
