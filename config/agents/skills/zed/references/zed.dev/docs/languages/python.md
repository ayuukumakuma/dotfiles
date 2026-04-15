---
title: "Python | Python"
source_url: "https://zed.dev/docs/languages/python"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [How to Set Up Python in Zed](https://zed.dev/docs/languages/python.html#how-to-set-up-python-in-zed)

Python support is available natively in Zed.

* Tree-sitter: [tree-sitter-python](https://github.com/zed-industries/tree-sitter-python)
* Language Servers:
  + [DetachHead/basedpyright](https://github.com/DetachHead/basedpyright)
  + [astral-sh/ruff](https://github.com/astral-sh/ruff)
  + [astral-sh/ty](https://github.com/astral-sh/ty)
  + [microsoft/pyright](https://github.com/microsoft/pyright)
  + [python-lsp/python-lsp-server](https://github.com/python-lsp/python-lsp-server) (PyLSP)
* Debug Adapter: [debugpy](https://github.com/microsoft/debugpy)

## [Install Python](https://zed.dev/docs/languages/python.html#install-python)

You'll need both Zed and Python installed before you can begin.

### [Step 1: Install Python](https://zed.dev/docs/languages/python.html#step-1-install-python)

Zed does not bundle a Python runtime, so you’ll need to install one yourself.
Choose one of the following options:

* uv (recommended)

```
curl -LsSf https://astral.sh/uv/install.sh | sh
```

To learn more, visit [Astral’s installation guide](https://docs.astral.sh/uv/getting-started/installation/).

* Homebrew:

```
brew install python
```

* Python.org installer: Download the latest version from [python.org/downloads](https://python.org/downloads).

### [Step 2: Verify Python Installation](https://zed.dev/docs/languages/python.html#step-2-verify-python-installation)

Confirm Python is installed and available in your shell:

```
python3 --version
```

You should see an output like `Python 3.x.x`.

## [Open Your First Python Project in Zed](https://zed.dev/docs/languages/python.html#open-your-first-python-project-in-zed)

Once Zed and Python are installed, open a folder containing Python code to start working.

### [Step 1: Launch Zed with a Python Project](https://zed.dev/docs/languages/python.html#step-1-launch-zed-with-a-python-project)

Open Zed.
From the menu bar, choose File > Open Folder, or launch from the terminal:

```
zed path/to/your/project
```

Zed will recognize `.py` files automatically using its native tree-sitter-python parser, with no plugins or manual setup required.

### [Step 2: Use the Integrated Terminal (Optional)](https://zed.dev/docs/languages/python.html#step-2-use-the-integrated-terminal-optional)

Zed includes an integrated terminal, accessible from the bottom panel. If Zed detects that your project is using a [virtual environment](https://zed.dev/docs/languages/python.html#virtual-environments), it will be activated automatically in newly-created terminals. You can configure this behavior with the [`detect_venv`](https://zed.dev/docs/reference/all-settings.html#terminal-detect_venv) setting.

## [Configure Python Language Servers in Zed](https://zed.dev/docs/languages/python.html#configure-python-language-servers-in-zed)

Zed provides several Python language servers out of the box. By default, [basedpyright](https://github.com/DetachHead/basedpyright) is the primary language server, and [Ruff](https://github.com/astral-sh/ruff) is used for formatting and linting.

Other built-in language servers are:

* [ty](https://docs.astral.sh/ty/)—Up-and-coming language server from Astral, built for speed.
* [Pyright](https://github.com/microsoft/pyright)—The basis for basedpyright.
* [PyLSP](https://github.com/python-lsp/python-lsp-server)—A plugin-based language server that integrates with tools like `pycodestyle`, `autopep8`, and `yapf`.

These are disabled by default, but can be enabled in your settings.

Configure language servers in Settings (`cmd-,|ctrl-,`) under Languages > Python, or add to your settings file:

```
{
  "languages": {
    "Python": {
      "language_servers": [
        // Disable basedpyright and enable ty, and include all
        // other registered language servers (ruff, pylsp, pyright).
        "ty",
        "!basedpyright",
        "..."
      ]
    }
  }
}
```

See: [Working with Language Servers](https://zed.dev/docs/configuring-languages.html#working-with-language-servers) for more information about how to enable and disable language servers.

### [Basedpyright](https://zed.dev/docs/languages/python.html#basedpyright)

[basedpyright](https://docs.basedpyright.com/latest/) is the primary Python language server in Zed beginning with Zed v0.204.0. It provides core language server functionality like navigation (go to definition/find all references) and type checking. Compared to Pyright, it adds support for additional language server features (like inlay hints) and checking rules.

Note that while basedpyright in isolation defaults to the `recommended` [type-checking mode](https://docs.basedpyright.com/latest/benefits-over-pyright/better-defaults/#typecheckingmode), Zed configures it to use the less-strict `standard` mode by default, which matches the behavior of Pyright. You can set the type-checking mode for your project using the `typeCheckingMode` setting in `pyrightconfig.json` or `pyproject.toml`, which will override Zed's default. Read on more for more details about how to configure basedpyright.

#### [Basedpyright Configuration](https://zed.dev/docs/languages/python.html#basedpyright-configuration)

basedpyright reads configuration options from two different kinds of sources:

* Language server settings ("workspace configuration"), which must be configured per-editor (using `settings.json` in Zed's case) but apply to all projects opened in that editor
* Configuration files (`pyrightconfig.json`, `pyproject.toml`), which are editor-independent but specific to the project where they are placed

As a rule of thumb, options that are only relevant when using basedpyright from an editor must be set in language server settings, and options that are relevant even if you're running it [as a command-line tool](https://docs.basedpyright.com/latest/configuration/command-line/) must be set in configuration files. Settings related to inlay hints are examples of the first category, and the [diagnostic category](https://docs.basedpyright.com/latest/configuration/config-files/#diagnostic-categories) settings are examples of the second category.

Examples of both kinds of configuration are provided below. Refer to the basedpyright documentation on [language server settings](https://docs.basedpyright.com/latest/configuration/language-server-settings/) and [configuration files](https://docs.basedpyright.com/latest/configuration/config-files/) for comprehensive lists of available options.

##### [Language server settings](https://zed.dev/docs/languages/python.html#language-server-settings)

Language server settings for basedpyright in Zed can be set in the `lsp` section of your `settings.json`.

For example, to:

* diagnose all files in the workspace instead of the only open files default
* disable inlay hints on function arguments

You can use the following configuration:

```
{
  "lsp": {
    "basedpyright": {
      "settings": {
        "basedpyright.analysis": {
          "diagnosticMode": "workspace",
          "inlayHints": {
            "callArgumentNames": false
          }
        }
      }
    }
  }
}
```

##### [Configuration files](https://zed.dev/docs/languages/python.html#configuration-files)

basedpyright reads project-specific configuration from the `pyrightconfig.json` configuration file and from the `[tool.basedpyright]` and `[tool.pyright]` sections of `pyproject.toml` manifests. `pyrightconfig.json` overrides `pyproject.toml` if configuration is present in both places.

Here's an example `pyrightconfig.json` file that configures basedpyright to use the `strict` type-checking mode and not to issue diagnostics for any files in `__pycache__` directories:

```
{
  "typeCheckingMode": "strict",
  "ignore": ["**/__pycache__"]
}
```

### [PyLSP](https://zed.dev/docs/languages/python.html#pylsp)

[python-lsp-server](https://github.com/python-lsp/python-lsp-server/), more commonly known as PyLSP, by default integrates with a number of external tools (autopep8, mccabe, pycodestyle, yapf) while others are optional and must be explicitly enabled and configured (flake8, pylint).

See [Python Language Server Configuration](https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md) for more.

## [Virtual Environments](https://zed.dev/docs/languages/python.html#virtual-environments)

[Virtual environments](https://docs.python.org/3/library/venv.html) are a useful tool for fixing a Python version and set of dependencies for a specific project, in a way that's isolated from other projects on the same machine. Zed has built-in support for discovering, configuring, and activating virtual environments, based on the language-agnostic concept of a [toolchain](https://zed.dev/docs/toolchains.html).

Note that if you have a global Python installation, it is also counted as a toolchain for Zed's purposes.

### [Create a Virtual Environment](https://zed.dev/docs/languages/python.html#create-a-virtual-environment)

If your project doesn't have a virtual environment set up already, you can create one as follows:

```
python3 -m venv .venv
```

Alternatively, if you're using `uv`, running `uv sync` will create a virtual environment the first time you run it.

### [How Zed Uses Python Toolchains](https://zed.dev/docs/languages/python.html#how-zed-uses-python-toolchains)

Zed uses the selected Python toolchain for your project in the following ways:

* Built-in language servers will be automatically configured with the path to the toolchain's Python interpreter and, if applicable, virtual environment. This is important so that they can resolve dependencies. (Note that language servers provided by extensions can't be automatically configured like this currently.)
* Python tasks (such as pytest tests) will be run using the toolchain's Python interpreter.
* If the toolchain is a virtual environment, the environment's activation script will be run automatically when you launch a new shell in Zed's integrated terminal, giving you convenient access to the selected Python interpreter and dependency set.
* If a built-in language server is installed in the active virtual environment, that binary will be used instead of Zed's private automatically-installed binary. This also applies to debugpy.

### [Selecting a Toolchain](https://zed.dev/docs/languages/python.html#selecting-a-toolchain)

For most projects, Zed will automatically select the right Python toolchain. In complex projects with multiple virtual environments, it might be necessary to override this selection. You can use the [toolchain selector](https://zed.dev/docs/toolchains.html#selecting-toolchains) to pick a toolchain from the list discovered by Zed, or [specify the path to a toolchain manually](https://zed.dev/docs/toolchains.html#adding-toolchains-manually) if it's not on the list.

## [Code Formatting & Linting](https://zed.dev/docs/languages/python.html#code-formatting--linting)

Zed uses [Ruff](https://github.com/astral-sh/ruff) for formatting and linting Python code. Specifically, it runs Ruff as an LSP server using the `ruff server` subcommand.

### [Configuring Formatting](https://zed.dev/docs/languages/python.html#configuring-formatting)

Formatting in Zed follows a two-phase pipeline: first, code actions on format (`code_actions_on_format`) are executed, followed by the configured formatter.

Configure formatting in Settings (`cmd-,|ctrl-,`) under Languages > Python, or add to your settings file:

```
{
  "languages": {
    "Python": {
      "code_actions_on_format": {
        "source.organizeImports.ruff": true
      },
      "formatter": {
        "language_server": {
          "name": "ruff"
        }
      }
    }
  }
}
```

These two phases are independent. For example, if you prefer [Black](https://github.com/psf/black) for code formatting, but want to keep Ruff's import sorting, you only need to change the formatter phase.

Configure in Settings (`cmd-,|ctrl-,`) under Languages > Python, or add to your settings file:

```
{
  "languages": {
    "Python": {
      "code_actions_on_format": {
        // Phase 1: Ruff still handles organize imports
        "source.organizeImports.ruff": true
      },
      "formatter": {
        // Phase 2: Black handles formatting
        "external": {
          "command": "black",
          "arguments": ["--stdin-filename", "{buffer_path}", "-"]
        }
      }
    }
  }
}
```

To completely switch to another tool and prevent Ruff from modifying your code at all, you must explicitly set `source.organizeImports.ruff` to false in the `code_actions_on_format` section, in addition to changing the formatter.

To prevent any formatting actions when you save, you can disable format-on-save for Python files.

Configure in Settings (`cmd-,|ctrl-,`) under Languages > Python, or add to your settings file:

```
{
  "languages": {
    "Python": {
      "format_on_save": "off"
    }
  }
}
```

### [Configuring Ruff](https://zed.dev/docs/languages/python.html#configuring-ruff)

Like basedpyright, Ruff reads options from both Zed's language server settings and configuration files (`ruff.toml`) when used in Zed. Unlike basedpyright, *all* options can be configured in either of these locations, so the choice of where to put your Ruff configuration comes down to whether you want it to be shared between projects but specific to Zed (in which case you should use language server settings), or specific to one project but common to all Ruff invocations (in which case you should use `ruff.toml`).

Here's an example of using language server settings in Zed's `settings.json` to disable all Ruff lints in Zed (while still using Ruff as a formatter):

```
{
  "lsp": {
    "ruff": {
      "initialization_options": {
        "settings": {
          "exclude": ["*"]
        }
      }
    }
  }
}
```

And here's an example `ruff.toml` with linting and formatting options, adapted from the Ruff documentation:

```
[lint]
# Avoid enforcing line-length violations (`E501`)
ignore = ["E501"]

[format]
# Use single quotes when formatting.
quote-style = "single"
```

For more details, refer to the Ruff documentation about [configuration files](https://docs.astral.sh/ruff/configuration/) and [language server settings](https://docs.astral.sh/ruff/editors/settings/), and the [list of options](https://docs.astral.sh/ruff/settings/).

### [Embedded Language Highlighting](https://zed.dev/docs/languages/python.html#embedded-language-highlighting)

Zed supports syntax highlighting for code embedded in Python strings by adding a comment with the language name.

```
# sql
query = "SELECT * FROM users"

#sql
query = """
    SELECT *
    FROM users
"""

result = func( #sql
    "SELECT * FROM users"
)
```

## [Debugging](https://zed.dev/docs/languages/python.html#debugging)

Zed supports Python debugging through the `debugpy` adapter. You can start with no configuration or define custom launch profiles in `.zed/debug.json`.

### [Start Debugging with No Setup](https://zed.dev/docs/languages/python.html#start-debugging-with-no-setup)

Zed can automatically detect debuggable Python entry points. Press F4 (or run debugger: start from the Command Palette) to see available options for your current project.
This works for:

* Python scripts
* Modules
* pytest tests

Zed uses `debugpy` under the hood, but no manual adapter configuration is required.

### [Define Custom Debug Configurations](https://zed.dev/docs/languages/python.html#define-custom-debug-configurations)

For reusable setups, create a `.zed/debug.json` file in your project root. This gives you more control over how Zed runs and debugs your code.

* [debugpy configuration documentation](https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings#launchattach-settings)

#### [Debug Active File](https://zed.dev/docs/languages/python.html#debug-active-file)

```
[
  {
    "label": "Python Active File",
    "adapter": "Debugpy",
    "program": "$ZED_FILE",
    "request": "launch"
  }
]
```

This runs the file currently open in the editor.

#### [Debug a Flask App](https://zed.dev/docs/languages/python.html#debug-a-flask-app)

For projects using Flask, you can define a full launch configuration:

```
.venv/
app/
  init.py
  main.py
  routes.py
templates/
  index.html
static/
  style.css
requirements.txt
```

…the following configuration can be used:

```
[
  {
    "label": "Python: Flask",
    "adapter": "Debugpy",
    "request": "launch",
    "module": "app",
    "cwd": "$ZED_WORKTREE_ROOT",
    "env": {
      "FLASK_APP": "app",
      "FLASK_DEBUG": "1"
    },
    "args": [
      "run",
      "--reload", // Enables Flask reloader that watches for file changes
      "--debugger" // Enables Flask debugger
    ],
    "autoReload": {
      "enable": true
    },
    "jinja": true,
    "justMyCode": true
  }
]
```

These can be combined to tailor the experience for web servers, test runners, or custom scripts.

## [Troubleshooting](https://zed.dev/docs/languages/python.html#troubleshooting)

Issues with Python in Zed typically involve virtual environments, language servers, or tooling configuration.

### [Resolve Language Server Startup Issues](https://zed.dev/docs/languages/python.html#resolve-language-server-startup-issues)

If a language server isn't responding or features like diagnostics or autocomplete aren't available:

* Check your Zed log (using the `zed: open log` action) for errors related to the language server you're trying to use. This is where you're likely to find useful information if the language server failed to start up at all.
* Use the language server logs view to understand the lifecycle of the affected language server. You can access this view using the `dev: open language server logs` action, or by clicking the lightning bolt icon in the status bar and selecting your language server. The most useful pieces of data in this view are:
  + "Server Logs", which shows any errors printed by the language server
  + "Server Info", which shows details about how the language server was started
* Verify your `settings.json` or `pyrightconfig.json` is syntactically correct.
* Restart Zed to reinitialize language server connections, or try restarting the language server using the `editor: restart language server`

If the language server is failing to resolve imports, and you're using a virtual environment, make sure that the right environment is chosen in the selector. You can use "Server Info" view to confirm which virtual environment Zed is sending to the language server—look for the `* Configuration` section at the end.

[PureScript](https://zed.dev/docs/languages/purescript.html "PureScript")
[R](https://zed.dev/docs/languages/r.html "R")
