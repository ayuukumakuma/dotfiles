---
title: "TypeScript | TypeScript"
source_url: "https://zed.dev/docs/languages/typescript"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [TypeScript](https://zed.dev/docs/languages/typescript.html#typescript)

TypeScript and TSX support are available natively in Zed.

* Tree-sitter: [tree-sitter/tree-sitter-typescript](https://github.com/tree-sitter/tree-sitter-typescript)
* Language Server: [yioneko/vtsls](https://github.com/yioneko/vtsls)
* Alternate Language Server: [typescript-language-server/typescript-language-server](https://github.com/typescript-language-server/typescript-language-server)
* Debug Adapter: [vscode-js-debug](https://github.com/microsoft/vscode-js-debug)

## [Language servers](https://zed.dev/docs/languages/typescript.html#language-servers)

By default Zed uses [vtsls](https://github.com/yioneko/vtsls) for TypeScript, TSX, and JavaScript files.
Configure language servers in Settings (`cmd-,|ctrl-,`) under Languages > TypeScript/TSX/JavaScript, or add to your settings file:

```
{
  "languages": {
    "TypeScript": {
      "language_servers": ["typescript-language-server", "!vtsls", "..."]
    },
    "TSX": {
      "language_servers": ["typescript-language-server", "!vtsls", "..."]
    },
    "JavaScript": {
      "language_servers": ["typescript-language-server", "!vtsls", "..."]
    }
  }
}
```

Prettier will also be used for TypeScript files by default. To disable this, configure in Settings (`cmd-,|ctrl-,`) under Languages > TypeScript, or add to your settings file:

```
{
  "languages": {
    "TypeScript": {
      "prettier": { "allowed": false }
    }
    //...
  }
}
```

## [Using the Tailwind CSS Language Server with TypeScript](https://zed.dev/docs/languages/typescript.html#using-the-tailwind-css-language-server-with-typescript)

To get all the features (autocomplete, linting, etc.) from the [Tailwind CSS language server](https://github.com/tailwindlabs/tailwindcss-intellisense/tree/HEAD/packages/tailwindcss-language-server#readme) in vanilla TypeScript files (`.ts`), you can customize the `classRegex` field under it in your `settings.json`:

```
{
  "lsp": {
    "tailwindcss-language-server": {
      "settings": {
        "experimental": {
          "classRegex": [
            "\\.className\\s*[+]?=\\s*['\"](https://zed.dev/docs/languages/[^'\"]*)['\"]",
            "\\.setAttributeNS\\(.*,\\s*['\"]class['\"],\\s*['\"](https://zed.dev/docs/languages/[^'\"]*)['\"]",
            "\\.setAttribute\\(['\"]class['\"],\\s*['\"](https://zed.dev/docs/languages/[^'\"]*)['\"]",
            "\\.classList\\.add\\(['\"](https://zed.dev/docs/languages/[^'\"]*)['\"]",
            "\\.classList\\.remove\\(['\"](https://zed.dev/docs/languages/[^'\"]*)['\"]",
            "\\.classList\\.toggle\\(['\"](https://zed.dev/docs/languages/[^'\"]*)['\"]",
            "\\.classList\\.contains\\(['\"](https://zed.dev/docs/languages/[^'\"]*)['\"]",
            "\\.classList\\.replace\\(\\s*['\"](https://zed.dev/docs/languages/[^'\"]*)['\"]",
            "\\.classList\\.replace\\([^,)]+,\\s*['\"](https://zed.dev/docs/languages/[^'\"]*)['\"]"
          ]
        }
      }
    }
  }
}
```

## [Large projects](https://zed.dev/docs/languages/typescript.html#large-projects)

`vtsls` may run out of memory on very large projects. We default the limit to 8092 (8 GiB) vs. the default of 3072 but this may not be sufficient for you:

```
{
  "lsp": {
    "vtsls": {
      "settings": {
        // For TypeScript:
        "typescript": { "tsserver": { "maxTsServerMemory": 16184 } },
        // For JavaScript:
        "javascript": { "tsserver": { "maxTsServerMemory": 16184 } }
      }
    }
  }
}
```

## [Inlay Hints](https://zed.dev/docs/languages/typescript.html#inlay-hints)

Zed sets the following initialization options to make the language server send back inlay hints (that is, when Zed has inlay hints enabled in the settings).

You can override these settings in your Zed `settings.json` when using `typescript-language-server`:

```
{
  "lsp": {
    "typescript-language-server": {
      "initialization_options": {
        "preferences": {
          "includeInlayParameterNameHints": "all",
          "includeInlayParameterNameHintsWhenArgumentMatchesName": true,
          "includeInlayFunctionParameterTypeHints": true,
          "includeInlayVariableTypeHints": true,
          "includeInlayVariableTypeHintsWhenTypeMatchesName": true,
          "includeInlayPropertyDeclarationTypeHints": true,
          "includeInlayFunctionLikeReturnTypeHints": true,
          "includeInlayEnumMemberValueHints": true
        }
      }
    }
  }
}
```

See [typescript-language-server inlayhints documentation](https://github.com/typescript-language-server/typescript-language-server?tab=readme-ov-file#inlay-hints-textdocumentinlayhint) for more information.

When using `vtsls`:

```
{
  "lsp": {
    "vtsls": {
      "settings": {
        // For JavaScript:
        "javascript": {
          "inlayHints": {
            "parameterNames": {
              "enabled": "all",
              "suppressWhenArgumentMatchesName": false
            },
            "parameterTypes": {
              "enabled": true
            },
            "variableTypes": {
              "enabled": true,
              "suppressWhenTypeMatchesName": true
            },
            "propertyDeclarationTypes": {
              "enabled": true
            },
            "functionLikeReturnTypes": {
              "enabled": true
            },
            "enumMemberValues": {
              "enabled": true
            }
          }
        },
        // For TypeScript:
        "typescript": {
          "inlayHints": {
            "parameterNames": {
              "enabled": "all",
              "suppressWhenArgumentMatchesName": false
            },
            "parameterTypes": {
              "enabled": true
            },
            "variableTypes": {
              "enabled": true,
              "suppressWhenTypeMatchesName": true
            },
            "propertyDeclarationTypes": {
              "enabled": true
            },
            "functionLikeReturnTypes": {
              "enabled": true
            },
            "enumMemberValues": {
              "enabled": true
            }
          }
        }
      }
    }
  }
}
```

## [Debugging](https://zed.dev/docs/languages/typescript.html#debugging)

Zed supports debugging TypeScript code out of the box with `vscode-js-debug`.
The following can be debugged without writing additional configuration:

* Tasks from `package.json`
* Tests written using several popular frameworks (Jest, Mocha, Vitest, Jasmine, Bun, Node)

Run `debugger: start` (`f4|f4`) to see a contextual list of these predefined debug tasks.

> **Note:** Bun test is automatically detected when `@types/bun` is present in `package.json`.

> **Note:** Node test is automatically detected when `@types/node` is present in `package.json` (requires Node.js 20+).

As for all languages, configurations from `.vscode/launch.json` are also available for debugging in Zed.

If your use-case isn't covered by any of these, you can take full control by adding debug configurations to `.zed/debug.json`. See below for example configurations.

### [Configuring JavaScript debug tasks](https://zed.dev/docs/languages/typescript.html#configuring-javascript-debug-tasks)

JavaScript debugging is more complicated than other languages because there are two different environments: Node.js and the browser. `vscode-js-debug` exposes a `type` field, that you can use to specify the environment, either `node` or `chrome`.

* [vscode-js-debug configuration documentation](https://github.com/microsoft/vscode-js-debug/blob/main/OPTIONS.md)

### [Attach debugger to a server running in web browser (`npx serve`)](https://zed.dev/docs/languages/typescript.html#attach-debugger-to-a-server-running-in-web-browser-npx-serve)

Given an externally-ran web server (e.g., with `npx serve` or `npx live-server`) one can attach to it and open it with a browser.

```
[
  {
    "label": "Launch Chrome (TypeScript)",
    "adapter": "JavaScript",
    "type": "chrome",
    "request": "launch",
    "url": "http://localhost:5500",
    "program": "$ZED_FILE",
    "webRoot": "${ZED_WORKTREE_ROOT}",
    "build": {
      "command": "npx",
      "args": ["tsc"]
    },
    "skipFiles": ["<node_internals>/**"]
  }
]
```

## [See also](https://zed.dev/docs/languages/typescript.html#see-also)

* [Zed Yarn documentation](https://zed.dev/docs/languages/yarn.html) for a walkthrough of configuring your project to use Yarn.
* [Zed Deno documentation](https://zed.dev/docs/languages/deno.html)

[TOML](https://zed.dev/docs/languages/toml.html "TOML")
[Uiua](https://zed.dev/docs/languages/uiua.html "Uiua")
