---
title: "Windows | Zed on Windows"
source_url: "https://zed.dev/docs/windows"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Zed on Windows](https://zed.dev/docs/windows.html#zed-on-windows)

## [Installing Zed](https://zed.dev/docs/windows.html#installing-zed)

Get the latest stable builds via [the download page](https://zed.dev/download). If you want to download our preview build, you can find it on its [releases page](https://zed.dev/releases/preview). After the first manual installation, Zed will periodically check for install updates.

You can also build zed from source, see [these docs](https://zed.dev/docs/development/windows.html) for instructions.

### [Package managers](https://zed.dev/docs/windows.html#package-managers)

Additionally, you can install Zed using winget:

```
winget install -e --id ZedIndustries.Zed
```

## [Uninstall](https://zed.dev/docs/windows.html#uninstall)

* Installed via installer: Use `Settings` → `Apps` → `Installed apps`, search for Zed, and click Uninstall.
* Built from source: Remove the build output directory you created (e.g., your target/install folder).

Your settings and extensions live in your user profile. When uninstalling, you can choose to keep or remove them.

## [Remote Development (SSH)](https://zed.dev/docs/windows.html#remote-development-ssh)

Zed supports remote development on Windows through both SSH and WSL. You can connect to remote servers via SSH or work with files inside WSL distributions directly from Zed.

For detailed instructions on setting up and using remote development features, including SSH configuration, WSL setup, and troubleshooting, see the [Remote Development documentation](https://zed.dev/docs/remote-development.html).

## [Troubleshooting](https://zed.dev/docs/windows.html#troubleshooting)

### [Zed fails to start or shows a blank window](https://zed.dev/docs/windows.html#zed-fails-to-start-or-shows-a-blank-window)

* Check that your hardware and operating system version are compatible with Zed. See our [installation guide](https://zed.dev/docs/installation.html) for more information.
* Update your GPU drivers from your GPU vendor (Intel/AMD/NVIDIA/Qualcomm).
* Ensure hardware acceleration is enabled in Windows and not blocked by third‑party software.
* Try launching Zed with no extensions or custom settings to isolate conflicts.

### [Terminal issues](https://zed.dev/docs/windows.html#terminal-issues)

If activation scripts don’t run, update to the latest version and verify your shell profile files are not exiting early. For Git operations, confirm Git Bash or PowerShell is available and on PATH.

### [SSH remoting problems](https://zed.dev/docs/windows.html#ssh-remoting-problems)

When prompted for credentials, use the graphical askpass dialog. If it doesn’t appear, check for credential manager conflicts and that GUI prompts aren’t blocked by your terminal.

### [Graphics issues](https://zed.dev/docs/windows.html#graphics-issues)

#### [Zed fails to open / degraded performance](https://zed.dev/docs/windows.html#zed-fails-to-open--degraded-performance)

Zed requires a DirectX 11 compatible GPU to run. If Zed fails to open, your GPU may not meet the minimum requirements.

To check if your GPU supports DirectX 11, run the following command:

```
dxdiag
```

This will open the DirectX Diagnostic Tool, which shows the DirectX version your GPU supports under `System` → `System Information` → `DirectX Version`.

If you're running Zed inside a virtual machine, it will use the emulated adapter provided by your VM. While Zed will work in this environment, performance may be degraded.

[macOS](https://zed.dev/docs/macos.html "macOS")
[Linux](https://zed.dev/docs/linux.html "Linux")
