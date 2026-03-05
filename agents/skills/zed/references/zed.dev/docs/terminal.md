---
title: "Terminal | Built-in Terminal - Zed"
source_url: "https://zed.dev/docs/terminal"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Terminal](https://zed.dev/docs/terminal.html#terminal)

Zed includes a built-in terminal emulator that supports multiple terminal instances, custom shells, and deep integration with the editor.

## [Opening Terminals](https://zed.dev/docs/terminal.html#opening-terminals)

| Action | macOS | Linux/Windows |
| --- | --- | --- |
| Toggle terminal panel | `` Ctrl+` `` | `` Ctrl+` `` |
| Open new terminal | `Ctrl+~` | `Ctrl+~` |
| Open terminal in center | Command palette | Command palette |

You can also open a terminal from the command palette with `terminal panel: toggle` or `workspace: new terminal`.

### [Terminal Panel vs Center Terminal](https://zed.dev/docs/terminal.html#terminal-panel-vs-center-terminal)

Terminals can open in two locations:

* **Terminal Panel** — Docked at the bottom (default), left, or right of the workspace. Toggle with `` Ctrl+` ``.
* **Center Pane** — Opens as a regular tab alongside your files. Use `workspace: new center terminal` from the command palette.

## [Working with Multiple Terminals](https://zed.dev/docs/terminal.html#working-with-multiple-terminals)

Create additional terminals with `Cmd+N` (macOS) or `Ctrl+N` (Linux/Windows) while focused in the terminal panel. Each terminal appears as a tab in the panel.

Split terminals horizontally with `Cmd+D` (macOS) or `Ctrl+Shift+5` (Linux/Windows).

## [Configuring the Shell](https://zed.dev/docs/terminal.html#configuring-the-shell)

By default, Zed uses your system's default shell (from `/etc/passwd` on Unix systems). To use a different shell:

```
{
  "terminal": {
    "shell": {
      "program": "/bin/zsh"
    }
  }
}
```

To pass arguments to your shell:

```
{
  "terminal": {
    "shell": {
      "with_arguments": {
        "program": "/bin/bash",
        "args": ["--login"]
      }
    }
  }
}
```

## [Working Directory](https://zed.dev/docs/terminal.html#working-directory)

Control where new terminals start:

| Value | Behavior |
| --- | --- |
| `"current_file_directory"` | Uses the current file's directory, falling back to the project directory, then the first project in the workspace |
| `"current_project_directory"` | Uses the current file's project directory (default) |
| `"first_project_directory"` | Uses the first project in your workspace |
| `"always_home"` | Always starts in your home directory |
| `{ "always": { "directory": "~/projects" } }` | Always starts in a specific directory |

```
{
  "terminal": {
    "working_directory": "first_project_directory"
  }
}
```

## [Environment Variables](https://zed.dev/docs/terminal.html#environment-variables)

Add environment variables to all terminal sessions:

```
{
  "terminal": {
    "env": {
      "EDITOR": "zed --wait",
      "MY_VAR": "value"
    }
  }
}
```

> **Tip:** Use `:` to separate multiple values in a single variable: `"PATH": "/custom/path:$PATH"`

### [Python Virtual Environment Detection](https://zed.dev/docs/terminal.html#python-virtual-environment-detection)

Zed can automatically activate Python virtual environments when opening a terminal. By default, it searches for `.env`, `env`, `.venv`, and `venv` directories:

```
{
  "terminal": {
    "detect_venv": {
      "on": {
        "directories": [".venv", "venv"],
        "activate_script": "default"
      }
    }
  }
}
```

The `activate_script` option supports `"default"`, `"csh"`, `"fish"`, and `"nushell"`.

To disable virtual environment detection:

```
{
  "terminal": {
    "detect_venv": "off"
  }
}
```

## [Fonts and Appearance](https://zed.dev/docs/terminal.html#fonts-and-appearance)

The terminal can use different fonts from the editor:

```
{
  "terminal": {
    "font_family": "JetBrains Mono",
    "font_size": 14,
    "font_features": {
      "calt": false
    },
    "line_height": "comfortable"
  }
}
```

Line height options:

* `"comfortable"` — 1.618 ratio, good for reading (default)
* `"standard"` — 1.3 ratio, better for TUI applications with box-drawing characters
* `{ "custom": 1.5 }` — Custom ratio

### [Cursor](https://zed.dev/docs/terminal.html#cursor)

Configure cursor appearance:

```
{
  "terminal": {
    "cursor_shape": "bar",
    "blinking": "on"
  }
}
```

Cursor shapes: `"block"`, `"bar"`, `"underline"`, `"hollow"`

Blinking options: `"off"`, `"terminal_controlled"` (default), `"on"`

### [Minimum Contrast](https://zed.dev/docs/terminal.html#minimum-contrast)

Zed adjusts terminal colors to maintain readability. The default value of `45` ensures text remains visible. Set to `0` to disable contrast adjustment and use exact theme colors:

```
{
  "terminal": {
    "minimum_contrast": 0
  }
}
```

## [Scrolling](https://zed.dev/docs/terminal.html#scrolling)

Navigate terminal history with these keybindings:

| Action | macOS | Linux/Windows |
| --- | --- | --- |
| Scroll page up | `Shift+PageUp` or `Cmd+Up` | `Shift+PageUp` |
| Scroll page down | `Shift+PageDown` or `Cmd+Down` | `Shift+PageDown` |
| Scroll line up | `Shift+Up` | `Shift+Up` |
| Scroll line down | `Shift+Down` | `Shift+Down` |
| Scroll to top | `Shift+Home` or `Cmd+Home` | `Shift+Home` |
| Scroll to bottom | `Shift+End` or `Cmd+End` | `Shift+End` |

Adjust scroll speed with:

```
{
  "terminal": {
    "scroll_multiplier": 3.0
  }
}
```

## [Copy and Paste](https://zed.dev/docs/terminal.html#copy-and-paste)

| Action | macOS | Linux/Windows |
| --- | --- | --- |
| Copy | `Cmd+C` | `Ctrl+Shift+C` |
| Paste | `Cmd+V` | `Ctrl+Shift+V` |

### [Copy on Select](https://zed.dev/docs/terminal.html#copy-on-select)

Automatically copy selected text to the clipboard:

```
{
  "terminal": {
    "copy_on_select": true
  }
}
```

### [Keep Selection After Copy](https://zed.dev/docs/terminal.html#keep-selection-after-copy)

By default, text stays selected after copying. To clear the selection:

```
{
  "terminal": {
    "keep_selection_on_copy": false
  }
}
```

## [Search](https://zed.dev/docs/terminal.html#search)

Search terminal content with `Cmd+F` (macOS) or `Ctrl+Shift+F` (Linux/Windows). This opens the same search bar used in the editor.

## [Vi Mode](https://zed.dev/docs/terminal.html#vi-mode)

Toggle vi-style navigation in the terminal with `Ctrl+Shift+Space`. This allows you to navigate and select text using vi keybindings.

## [Clear Terminal](https://zed.dev/docs/terminal.html#clear-terminal)

Clear the terminal screen:

* macOS: `Cmd+K`
* Linux/Windows: `Ctrl+Shift+L`

## [Option as Meta (macOS)](https://zed.dev/docs/terminal.html#option-as-meta-macos)

For Emacs users or applications that use Meta key combinations, enable Option as Meta:

```
{
  "terminal": {
    "option_as_meta": true
  }
}
```

This reinterprets the Option key as Meta, allowing sequences like `Alt+X` to work correctly.

## [Alternate Scroll Mode](https://zed.dev/docs/terminal.html#alternate-scroll-mode)

When enabled, mouse scroll events are converted to arrow key presses in applications like `vim` or `less`:

```
{
  "terminal": {
    "alternate_scroll": "on"
  }
}
```

## [Path Hyperlinks](https://zed.dev/docs/terminal.html#path-hyperlinks)

Zed detects file paths in terminal output and makes them clickable. `Cmd+Click` (macOS) or `Ctrl+Click` (Linux/Windows) opens the file in Zed, jumping to the line number if one is detected.

Common formats recognized:

* `src/main.rs:42` — Opens at line 42
* `src/main.rs:42:10` — Opens at line 42, column 10
* `File "script.py", line 10` — Python tracebacks

## [Panel Configuration](https://zed.dev/docs/terminal.html#panel-configuration)

### [Dock Position](https://zed.dev/docs/terminal.html#dock-position)

```
{
  "terminal": {
    "dock": "bottom"
  }
}
```

Options: `"bottom"` (default), `"left"`, `"right"`

### [Default Size](https://zed.dev/docs/terminal.html#default-size)

```
{
  "terminal": {
    "default_width": 640,
    "default_height": 320
  }
}
```

### [Terminal Button](https://zed.dev/docs/terminal.html#terminal-button)

Hide the terminal button in the status bar:

```
{
  "terminal": {
    "button": false
  }
}
```

### [Toolbar](https://zed.dev/docs/terminal.html#toolbar)

Show the terminal title in a breadcrumb toolbar:

```
{
  "terminal": {
    "toolbar": {
      "breadcrumbs": true
    }
  }
}
```

The title can be set by your shell using the escape sequence `\e]2;Title\007`.

## [Integration with Tasks](https://zed.dev/docs/terminal.html#integration-with-tasks)

The terminal integrates with Zed's [task system](https://zed.dev/docs/tasks.html). When you run a task, it executes in the terminal. Rerun the last task from a terminal with:

* macOS: `Cmd+Alt+R`
* Linux/Windows: `Ctrl+Shift+R` or `Alt+T`

## [AI Assistance](https://zed.dev/docs/terminal.html#ai-assistance)

Get help with terminal commands using the [Inline Assistant](https://zed.dev/docs/ai/inline-assistant.html):

* macOS: `Ctrl+Enter`
* Linux/Windows: `Ctrl+Enter` or `Ctrl+I`

This opens the Inline Assistant to help explain errors, suggest commands, or troubleshoot issues. AI agents in the [Agent Panel](https://zed.dev/docs/ai/agent-panel.html) can also run terminal commands as part of their workflow.

## [Sending Text and Keystrokes](https://zed.dev/docs/terminal.html#sending-text-and-keystrokes)

For advanced keybinding customization, you can send raw text or keystrokes to the terminal:

```
{
  "context": "Terminal",
  "bindings": {
    "alt-left": ["terminal::SendText", "\u001bb"],
    "ctrl-c": ["terminal::SendKeystroke", "ctrl-c"]
  }
}
```

## [All Terminal Settings](https://zed.dev/docs/terminal.html#all-terminal-settings)

For the complete list of terminal settings, see the [Terminal section in All Settings](https://zed.dev/docs/reference/all-settings.html#terminal).

## [What's Next](https://zed.dev/docs/terminal.html#whats-next)

* [Tasks](https://zed.dev/docs/tasks.html) — Run commands and scripts from Zed
* [REPL](https://zed.dev/docs/repl.html) — Interactive code execution
* [CLI Reference](https://zed.dev/docs/reference/cli.html) — Command-line interface for opening files in Zed

[Running & Testing](https://zed.dev/docs/running-testing.html "Running & Testing")
[Tasks](https://zed.dev/docs/tasks.html "Tasks")
