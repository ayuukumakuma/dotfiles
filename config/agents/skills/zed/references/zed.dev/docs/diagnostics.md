---
title: "Diagnostics & Quick Fixes | Diagnostics - Errors and Warnings in Zed"
source_url: "https://zed.dev/docs/diagnostics"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Diagnostics](https://zed.dev/docs/diagnostics.html#diagnostics)

Zed gets its diagnostics from the language servers and supports both push and pull variants of the LSP which makes it compatible with all existing language servers.

# [Regular diagnostics](https://zed.dev/docs/diagnostics.html#regular-diagnostics)

By default, Zed displays all diagnostics as underlined text in the editor and the scrollbar.

Editor diagnostics could be filtered with the

```
"diagnostics_max_severity": null
```

editor setting (possible values: `"off"`, `"error"`, `"warning"`, `"info"`, `"hint"`, `null` (default, all diagnostics)).

The scrollbar ones are configured with the

```
"scrollbar": {
  "diagnostics": "all",
}
```

configuration (possible values: `"none"`, `"error"`, `"warning"`, `"information"`, `"all"` (default))

The diagnostics could be hovered to display a tooltip with full, rendered diagnostic message.
Or, `editor::GoToDiagnostic` and `editor::GoToPreviousDiagnostic` could be used to navigate between diagnostics in the editor, showing a popover for the currently active diagnostic.

# [Inline diagnostics (Error lens)](https://zed.dev/docs/diagnostics.html#inline-diagnostics-error-lens)

Zed supports showing diagnostic as lens to the right of the code.
This is disabled by default, but can either be temporarily turned on (or off) using the editor menu, or permanently, using the

```
"diagnostics": {
  "inline": {
    "enabled": true,
    "max_severity": null, // same values as the `diagnostics_max_severity` from the editor settings
  }
}
```

# [Other UI places](https://zed.dev/docs/diagnostics.html#other-ui-places)

## [Project Panel](https://zed.dev/docs/diagnostics.html#project-panel)

Project panel can have its entries coloured based on the severity of the diagnostics in the file.

To configure, use

```
"project_panel": {
  "show_diagnostics": "all",
}
```

configuration (possible values: `"off"`, `"errors"`, `"all"` (default))

## [Editor tabs](https://zed.dev/docs/diagnostics.html#editor-tabs)

Similar to the project panel, editor tabs can be colorized with the

```
"tabs": {
  "show_diagnostics": "off",
}
```

configuration (possible values: `"off"` (default), `"errors"`, `"all"`)

[Snippets](https://zed.dev/docs/snippets.html "Snippets")
[Multibuffers](https://zed.dev/docs/multibuffers.html "Multibuffers")
