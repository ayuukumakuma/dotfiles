---
title: "Tailwind CSS | Tailwind CSS"
source_url: "https://zed.dev/docs/languages/tailwindcss"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Tailwind CSS](https://zed.dev/docs/languages/tailwindcss.html#tailwind-css)

Zed has built-in support for Tailwind CSS autocomplete, linting, and hover previews.

* Language Server: [tailwindlabs/tailwindcss-intellisense](https://github.com/tailwindlabs/tailwindcss-intellisense)

Languages which can be used with Tailwind CSS in Zed:

* [Astro](https://zed.dev/docs/languages/astro.html#using-the-tailwind-css-language-server-with-astro)
* [CSS](https://zed.dev/docs/languages/css.html)
* [ERB](https://zed.dev/docs/languages/ruby.html#using-the-tailwind-css-language-server-with-ruby)
* [Gleam](https://zed.dev/docs/languages/gleam.html)
* [HEEx](https://zed.dev/docs/languages/elixir.html#using-the-tailwind-css-language-server-with-heex)
* [HTML](https://zed.dev/docs/languages/html.html#using-the-tailwind-css-language-server-with-html)
* [TypeScript](https://zed.dev/docs/languages/typescript.html#using-the-tailwind-css-language-server-with-typescript)
* [JavaScript](https://zed.dev/docs/languages/javascript.html#using-the-tailwind-css-language-server-with-javascript)
* [PHP](https://zed.dev/docs/languages/php.html#using-the-tailwind-css-language-server-with-php)
* [Svelte](https://zed.dev/docs/languages/svelte.html#using-the-tailwind-css-language-server-with-svelte)
* [Vue](https://zed.dev/docs/languages/vue.html#using-the-tailwind-css-language-server-with-vue)

## [Configuration](https://zed.dev/docs/languages/tailwindcss.html#configuration)

If by default the language server isn't enough to make Tailwind work for a given language, you can configure the language server settings and add them to the `lsp` section of your `settings.json`:

```
{
  "lsp": {
    "tailwindcss-language-server": {
      "settings": {
        "classFunctions": ["cva", "cx"],
        "experimental": {
          "classRegex": ["[cls|className]\\s\\:\\=\\s\"([^\"]*)"]
        }
      }
    }
  }
}
```

Refer to [the Tailwind CSS language server settings docs](https://github.com/tailwindlabs/tailwindcss-intellisense?tab=readme-ov-file#extension-settings) for more information.

### [Using Tailwind CSS Mode in CSS Files](https://zed.dev/docs/languages/tailwindcss.html#using-tailwind-css-mode-in-css-files)

Zed includes support for the Tailwind CSS language mode, which provides full CSS IntelliSense support even when using Tailwind-specific at-rules like `@apply`, `@layer`, and `@theme`.
Configure language servers in Settings (`cmd-,|ctrl-,`) under Languages > CSS, or add to your settings file:

```
{
  "languages": {
    "CSS": {
      "language_servers": [
        "tailwindcss-intellisense-css",
        "!vscode-css-language-server",
        "..."
      ]
    }
  }
}
```

The `tailwindcss-intellisense-css` language server serves as an alternative to the default CSS language server, maintaining all standard CSS IntelliSense features while adding support for Tailwind-specific syntax.

### [Prettier Plugin](https://zed.dev/docs/languages/tailwindcss.html#prettier-plugin)

Zed supports Prettier out of the box, which means that if you have the [Tailwind CSS Prettier plugin](https://github.com/tailwindlabs/prettier-plugin-tailwindcss) installed, adding it to your Prettier configuration will make it work automatically:

```
// .prettierrc
{
  "plugins": ["prettier-plugin-tailwindcss"]
}
```

[Swift](https://zed.dev/docs/languages/swift.html "Swift")
[Terraform](https://zed.dev/docs/languages/terraform.html "Terraform")
