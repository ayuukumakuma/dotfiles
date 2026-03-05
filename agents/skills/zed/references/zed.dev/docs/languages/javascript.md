---
title: "JavaScript | JavaScript"
source_url: "https://zed.dev/docs/languages/javascript"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [JavaScript](https://zed.dev/docs/languages/javascript.html#javascript)

JavaScript support is available natively in Zed.

* Tree-sitter: [tree-sitter/tree-sitter-javascript](https://github.com/tree-sitter/tree-sitter-javascript)
* Language Server: [yioneko/vtsls](https://github.com/yioneko/vtsls)
* Alternate Language Server: [typescript-language-server/typescript-language-server](https://github.com/typescript-language-server/typescript-language-server)
* Debug Adapter: [vscode-js-debug](https://github.com/microsoft/vscode-js-debug)

## [Code formatting](https://zed.dev/docs/languages/javascript.html#code-formatting)

Formatting on save is enabled by default for JavaScript, using TypeScript's built-in code formatting.
But many JavaScript projects use other command-line code-formatting tools, such as [Prettier](https://prettier.io/).
You can use one of these tools by specifying an *external* code formatter for JavaScript in your settings.
See [the configuration docs](https://zed.dev/docs/reference/all-settings.html) for more information.

For example, if you have Prettier installed and on your `PATH`, you can use it to format JavaScript files.

Configure formatting in Settings (`cmd-,|ctrl-,`) under Languages > JavaScript, or add to your settings file:

```
{
  "languages": {
    "JavaScript": {
      "formatter": {
        "external": {
          "command": "prettier",
          "arguments": ["--stdin-filepath", "{buffer_path}"]
        }
      }
    }
  }
}
```

## [JSX](https://zed.dev/docs/languages/javascript.html#jsx)

Zed supports JSX syntax highlighting out of the box.

In JSX strings, the [`tailwindcss-language-server`](https://zed.dev/docs/languages/tailwindcss.html) is used to provide autocompletion for Tailwind CSS classes.

## [JSDoc](https://zed.dev/docs/languages/javascript.html#jsdoc)

Zed supports JSDoc syntax in JavaScript and TypeScript comments that match the JSDoc syntax.
Zed uses [tree-sitter/tree-sitter-jsdoc](https://github.com/tree-sitter/tree-sitter-jsdoc) for parsing and highlighting JSDoc.

## [ESLint](https://zed.dev/docs/languages/javascript.html#eslint)

You can configure Zed to format code using `eslint --fix` by running the ESLint code action when formatting.

Configure code actions on format in Settings (`cmd-,|ctrl-,`) under Languages > JavaScript, or add to your settings file:

```
{
  "languages": {
    "JavaScript": {
      "code_actions_on_format": {
        "source.fixAll.eslint": true
      }
    }
  }
}
```

You can also only execute a single ESLint rule when using `fixAll`:

```
{
  "languages": {
    "JavaScript": {
      "code_actions_on_format": {
        "source.fixAll.eslint": true
      }
    }
  },
  "lsp": {
    "eslint": {
      "settings": {
        "codeActionOnSave": {
          "rules": ["import/order"]
        }
      }
    }
  }
}
```

> **Note:** the other formatter you have configured will still run, after ESLint.
> So if your language server or Prettier configuration don't format according to
> ESLint's rules, then they will overwrite what ESLint fixed and you end up with
> errors.

If you **only** want to run ESLint on save, you can configure code actions as the formatter.

Configure in Settings (`cmd-,|ctrl-,`) under Languages > JavaScript, or add to your settings file:

```
{
  "languages": {
    "JavaScript": {
      "formatter": [],
      "code_actions_on_format": {
        "source.fixAll.eslint": true
      }
    }
  }
}
```

### [Configure ESLint's `nodePath`:](https://zed.dev/docs/languages/javascript.html#configure-eslints-nodepath)

You can configure ESLint's `nodePath` setting:

```
{
  "lsp": {
    "eslint": {
      "settings": {
        "nodePath": ".yarn/sdks"
      }
    }
  }
}
```

### [Configure ESLint's `problems`:](https://zed.dev/docs/languages/javascript.html#configure-eslints-problems)

You can configure ESLint's `problems` setting.

For example, here's how to set `problems.shortenToSingleLine`:

```
{
  "lsp": {
    "eslint": {
      "settings": {
        "problems": {
          "shortenToSingleLine": true
        }
      }
    }
  }
}
```

### [Configure ESLint's `rulesCustomizations`:](https://zed.dev/docs/languages/javascript.html#configure-eslints-rulescustomizations)

You can configure ESLint's `rulesCustomizations` setting:

```
{
  "lsp": {
    "eslint": {
      "settings": {
        "rulesCustomizations": [
          // set all eslint errors/warnings to show as warnings
          { "rule": "*", "severity": "warn" }
        ]
      }
    }
  }
}
```

### [Configure ESLint's `workingDirectory`:](https://zed.dev/docs/languages/javascript.html#configure-eslints-workingdirectory)

You can configure ESLint's `workingDirectory` setting:

```
{
  "lsp": {
    "eslint": {
      "settings": {
        "workingDirectory": {
          "mode": "auto"
        }
      }
    }
  }
}
```

## [Using the Tailwind CSS Language Server with JavaScript](https://zed.dev/docs/languages/javascript.html#using-the-tailwind-css-language-server-with-javascript)

To get all the features (autocomplete, linting, etc.) from the [Tailwind CSS language server](https://github.com/tailwindlabs/tailwindcss-intellisense/tree/HEAD/packages/tailwindcss-language-server#readme) in vanilla JavaScript files (`.js`), you can customize the `classRegex` field under it in your `settings.json`:

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

## [Debugging](https://zed.dev/docs/languages/javascript.html#debugging)

Zed supports debugging JavaScript code out of the box with `vscode-js-debug`.
The following can be debugged without writing additional configuration:

* Tasks from `package.json`
* Tests written using several popular frameworks (Jest, Mocha, Vitest, Jasmine, Bun, Node)

Run `debugger: start` (`f4|f4`) to see a contextual list of these predefined debug tasks.

> **Note:** Bun test is automatically detected when `@types/bun` is present in `package.json`.

> **Note:** Node test is automatically detected when `@types/node` is present in `package.json` (requires Node.js 20+).

As for all languages, configurations from `.vscode/launch.json` are also available for debugging in Zed.

If your use-case isn't covered by any of these, you can take full control by adding debug configurations to `.zed/debug.json`. See below for example configurations.

### [Configuring JavaScript debug tasks](https://zed.dev/docs/languages/javascript.html#configuring-javascript-debug-tasks)

JavaScript debugging is more complicated than other languages because there are two different environments: Node.js and the browser. `vscode-js-debug` exposes a `type` field, that you can use to specify the environment, either `node` or `chrome`.

* [vscode-js-debug configuration documentation](https://github.com/microsoft/vscode-js-debug/blob/main/OPTIONS.md)

### [Debug the current file with Node](https://zed.dev/docs/languages/javascript.html#debug-the-current-file-with-node)

```
[
  {
    "adapter": "JavaScript",
    "label": "Debug JS file",
    "type": "node",
    "request": "launch",
    "program": "$ZED_FILE",
    "skipFiles": ["<node_internals>/**"]
  }
]
```

### [Launch a web app in Chrome](https://zed.dev/docs/languages/javascript.html#launch-a-web-app-in-chrome)

```
[
  {
    "adapter": "JavaScript",
    "label": "Debug app in Chrome",
    "type": "chrome",
    "request": "launch",
    "file": "$ZED_WORKTREE_ROOT/index.html",
    "webRoot": "$ZED_WORKTREE_ROOT",
    "console": "integratedTerminal",
    "skipFiles": ["<node_internals>/**"]
  }
]
```

## [See also](https://zed.dev/docs/languages/javascript.html#see-also)

* [Yarn documentation](https://zed.dev/docs/languages/yarn.html) for a walkthrough of configuring your project to use Yarn.
* [TypeScript documentation](https://zed.dev/docs/languages/typescript.html)

[Java](https://zed.dev/docs/languages/java.html "Java")
[Julia](https://zed.dev/docs/languages/julia.html "Julia")
