---
title: "PowerShell | PowerShell"
source_url: "https://zed.dev/docs/languages/powershell"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [PowerShell](https://zed.dev/docs/languages/powershell.html#powershell)

PowerShell language support in Zed is provided by the community-maintained [Zed PowerShell extension](https://github.com/wingyplus/zed-powershell). Please report issues to: [github.com/wingyplus/zed-powershell/issues](https://github.com/wingyplus/zed-powershell/issues)

* Tree-sitter: [airbus-cert/tree-sitter-powershell](https://github.com/airbus-cert/tree-sitter-powershell)
* Language Server: [PowerShell/PowerShellEditorServices](https://github.com/PowerShell/PowerShellEditorServices)

## [Setup](https://zed.dev/docs/languages/powershell.html#setup)

### [Install PowerShell 7+](https://zed.dev/docs/languages/powershell.html#powershell-install)

* macOS: `brew install powershell/tap/powershell`
* Alpine: [Installing PowerShell on Alpine Linux](https://learn.microsoft.com/en-us/powershell/scripting/install/install-alpine)
* Debian: [Install PowerShell on Debian Linux](https://learn.microsoft.com/en-us/powershell/scripting/install/install-debian)
* RedHat: [Install PowerShell on RHEL](https://learn.microsoft.com/en-us/powershell/scripting/install/install-rhel)
* Ubuntu: [Install PowerShell on RHEL](https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu)
* Windows: [Install PowerShell on Windows](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows)

The Zed PowerShell extension will default to the `pwsh` executable found in your path.

### [Install PowerShell Editor Services (Optional)](https://zed.dev/docs/languages/powershell.html#powershell-editor-services)

The Zed PowerShell extensions will attempt to download [PowerShell Editor Services](https://github.com/PowerShell/PowerShellEditorServices) automatically.

If want to use a specific binary, you can specify in your that in your Zed settings.json:

```
  "lsp": {
    "powershell-es": {
      "binary": {
        "path": "/path/to/PowerShellEditorServices"
      }
    }
  }
```

[PHP](https://zed.dev/docs/languages/php.html "PHP")
[Prisma](https://zed.dev/docs/languages/prisma.html "Prisma")
