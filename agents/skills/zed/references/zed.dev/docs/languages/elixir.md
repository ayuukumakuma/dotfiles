---
title: "Elixir | Elixir"
source_url: "https://zed.dev/docs/languages/elixir"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Elixir](https://zed.dev/docs/languages/elixir.html#elixir)

Elixir support is available through the [Elixir extension](https://github.com/zed-extensions/elixir).

* Tree-sitter:
  + [elixir-lang/tree-sitter-elixir](https://github.com/elixir-lang/tree-sitter-elixir)
  + [phoenixframework/tree-sitter-heex](https://github.com/phoenixframework/tree-sitter-heex)
* Language servers:
  + [elixir-lang/expert](https://github.com/elixir-lang/expert)
  + [elixir-lsp/elixir-ls](https://github.com/elixir-lsp/elixir-ls)
  + [elixir-tools/next-ls](https://github.com/elixir-tools/next-ls)
  + [lexical-lsp/lexical](https://github.com/lexical-lsp/lexical)

## [Choosing a language server](https://zed.dev/docs/languages/elixir.html#choosing-a-language-server)

The Elixir extension offers language server support for `expert`, `elixir-ls`, `next-ls`, and `lexical`.

`elixir-ls` is enabled by default.

### [Expert](https://zed.dev/docs/languages/elixir.html#expert)

Configure language servers in Settings (`cmd-,|ctrl-,`) under Languages > Elixir, or add to your settings file:

```
  "languages": {
    "Elixir": {
      "language_servers": ["expert", "!elixir-ls", "!next-ls", "!lexical", "..."]
    },
    "HEEX": {
      "language_servers": ["expert", "!elixir-ls", "!next-ls", "!lexical", "..."]
    }
  }
```

### [Next LS](https://zed.dev/docs/languages/elixir.html#next-ls)

Configure language servers in Settings (`cmd-,|ctrl-,`) under Languages > Elixir, or add to your settings file:

```
  "languages": {
    "Elixir": {
      "language_servers": ["next-ls", "!expert", "!elixir-ls", "!lexical", "..."]
    },
    "HEEX": {
      "language_servers": ["next-ls", "!expert", "!elixir-ls", "!lexical", "..."]
    }
  }
```

### [Lexical](https://zed.dev/docs/languages/elixir.html#lexical)

Configure language servers in Settings (`cmd-,|ctrl-,`) under Languages > Elixir, or add to your settings file:

```
  "languages": {
    "Elixir": {
      "language_servers": ["lexical", "!expert", "!elixir-ls", "!next-ls", "..."]
    },
    "HEEX": {
      "language_servers": ["lexical", "!expert", "!elixir-ls", "!next-ls", "..."]
    }
  }
```

## [Setting up `elixir-ls`](https://zed.dev/docs/languages/elixir.html#setting-up-elixir-ls)

1. Install `elixir`:

```
brew install elixir
```

2. Install `elixir-ls`:

```
brew install elixir-ls
```

3. Restart Zed

> If `elixir-ls` is not running in an elixir project, check the error log via the command palette action `zed: open log`. If you find an error message mentioning: `invalid LSP message header "Shall I install Hex? (if running non-interactively, use \"mix local.hex --force\") [Yn]`, you might need to install [`Hex`](https://hex.pm). You run `elixir-ls` from the command line and accept the prompt to install `Hex`.

### [Formatting with Mix](https://zed.dev/docs/languages/elixir.html#formatting-with-mix)

If you prefer to format your code with [Mix](https://hexdocs.pm/mix/Mix.html), configure it as an external formatter. Formatting will occur on file save.

Configure formatting in Settings (`cmd-,|ctrl-,`) under Languages > Elixir, or add to your settings file:

```
{
  "languages": {
    "Elixir": {
      "format_on_save": "on",
      "formatter": {
        "external": {
          "command": "mix",
          "arguments": ["format", "--stdin-filename", "{buffer_path}", "-"]
        }
      }
    }
  }
}
```

### [Additional workspace configuration options](https://zed.dev/docs/languages/elixir.html#additional-workspace-configuration-options)

You can pass additional elixir-ls workspace configuration options via `lsp` settings in your settings file ([how to edit](https://zed.dev/docs/configuring-zed.html#settings-files)).

The following example disables dialyzer:

```
  "lsp": {
    "elixir-ls": {
      "settings": {
        "dialyzerEnabled": false
      }
    }
  }
```

See [ElixirLS configuration settings](https://github.com/elixir-lsp/elixir-ls#elixirls-configuration-settings) for more options.

### [HEEx](https://zed.dev/docs/languages/elixir.html#heex)

Zed also supports HEEx templates. HEEx is a mix of [EEx](https://hexdocs.pm/eex/1.12.3/EEx.html) (Embedded Elixir) and HTML, and is used in Phoenix LiveView applications.

* Tree-sitter: [phoenixframework/tree-sitter-heex](https://github.com/phoenixframework/tree-sitter-heex)

#### [Using the Tailwind CSS Language Server with HEEx](https://zed.dev/docs/languages/elixir.html#using-the-tailwind-css-language-server-with-heex)

To get all features (autocomplete, linting, and hover docs) from the [Tailwind CSS language server](https://github.com/tailwindlabs/tailwindcss-intellisense/tree/HEAD/packages/tailwindcss-language-server#readme) in HEEx files, add the following to your settings file ([how to edit](https://zed.dev/docs/configuring-zed.html#settings-files)):

```
{
  "lsp": {
    "tailwindcss-language-server": {
      "settings": {
        "includeLanguages": {
          "phoenix-heex": "html"
        },
        "experimental": {
          "classRegex": ["class=\"([^\"]*)\"", "class='([^']*)'"]
        }
      }
    }
  }
}
```

With these settings, you will get completions for Tailwind CSS classes in HEEx template files. Examples:

```
<%!-- Standard class attribute --%>
<div class="flex items-center <completion here>">
  <p class="text-lg font-bold <completion here>">Hello World</p>
</div>

<%!-- With Elixir expression --%>
<div class={"flex #{@custom_class} <completion here>"}>
  Content
</div>

<%!-- With Phoenix function --%>
<div class={class_list(["flex", "items-center", "<completion here>"])}>
  Content
</div>
```

[Docker](https://zed.dev/docs/languages/docker.html "Docker")
[Elm](https://zed.dev/docs/languages/elm.html "Elm")
