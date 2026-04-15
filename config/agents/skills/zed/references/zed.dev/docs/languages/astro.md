---
title: "Astro | Astro"
source_url: "https://zed.dev/docs/languages/astro"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Astro](https://zed.dev/docs/languages/astro.html#astro)

Astro support is available through the [Astro extension](https://github.com/zed-extensions/astro).

* Tree-sitter: [virchau13/tree-sitter-astro](https://github.com/virchau13/tree-sitter-astro)
* Language Server: [withastro/language-tools](https://github.com/withastro/astro/tree/main/packages/language-tools/language-server)

## [Using the Tailwind CSS Language Server with Astro](https://zed.dev/docs/languages/astro.html#using-the-tailwind-css-language-server-with-astro)

To get all the features (autocomplete, linting, etc.) from the [Tailwind CSS language server](https://github.com/tailwindlabs/tailwindcss-intellisense/tree/HEAD/packages/tailwindcss-language-server#readme) in Astro files, you need to configure the language server so that it knows about where to look for CSS classes by adding the following to your `settings.json`:

```
{
  "lsp": {
    "tailwindcss-language-server": {
      "settings": {
        "includeLanguages": {
          "astro": "html"
        },
        "experimental": {
          "classRegex": [
            "class=\"([^\"]*)\"",
            "class='([^']*)'",
            "class:list=\"{([^}]*)}\"",
            "class:list='{([^}]*)}'"
          ]
        }
      }
    }
  }
}
```

With these settings, you will get completions for Tailwind CSS classes in Astro template files. Examples:

```
---
const active = true;
---

<!-- Standard class attribute -->
<div class="flex items-center <completion here>">
  <p class="text-lg font-bold <completion here>">Hello World</p>
</div>

<!-- class:list directive -->
<div class:list={["flex", "items-center", "<completion here>"]}>
  Content
</div>

<!-- Conditional classes -->
<div class:list={{ "flex <completion here>": active, "hidden <completion here>": !active }}>
  Content
</div>
```

[AsciiDoc](https://zed.dev/docs/languages/asciidoc.html "AsciiDoc")
[Bash](https://zed.dev/docs/languages/bash.html "Bash")
