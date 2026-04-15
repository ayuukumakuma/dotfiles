---
title: "a-bar documentation • Jean Tinland"
source_url: "https://www.jeantinland.com/toolbox/a-bar/documentation/configuration/index"
fetched_at: "2026-03-11T23:36:53.277705+00:00"
---



[Docs](https://www.jeantinland.com/toolbox/a-bar/documentation/index.html)

* [Introduction](https://www.jeantinland.com/toolbox/a-bar/documentation/introduction/index.html)
* [Features](https://www.jeantinland.com/toolbox/a-bar/documentation/features/index.html)
* [Installation](https://www.jeantinland.com/toolbox/a-bar/documentation/installation/index.html)
* [Configuration](https://www.jeantinland.com/toolbox/a-bar/documentation/configuration/index.html)
* [Layout builder](https://www.jeantinland.com/toolbox/a-bar/documentation/layout-builder/index.html)
* [Automation](https://www.jeantinland.com/toolbox/a-bar/documentation/automation/index.html)
* [Widgets](https://www.jeantinland.com/toolbox/a-bar/documentation/widgets/index.html)
* [Spaces (yabai)](https://www.jeantinland.com/toolbox/a-bar/documentation/spaces/index.html)
* [Process (yabai)](https://www.jeantinland.com/toolbox/a-bar/documentation/process/index.html)
* [Spaces (AeroSpace)](https://www.jeantinland.com/toolbox/a-bar/documentation/aerospace-spaces/index.html)
* [Process (AeroSpace)](https://www.jeantinland.com/toolbox/a-bar/documentation/aerospace-process/index.html)
* [Battery](https://www.jeantinland.com/toolbox/a-bar/documentation/battery/index.html)
* [Weather](https://www.jeantinland.com/toolbox/a-bar/documentation/weather/index.html)
* [Date](https://www.jeantinland.com/toolbox/a-bar/documentation/date/index.html)
* [Time](https://www.jeantinland.com/toolbox/a-bar/documentation/time/index.html)
* [Wi‑Fi](https://www.jeantinland.com/toolbox/a-bar/documentation/wifi/index.html)
* [Sound](https://www.jeantinland.com/toolbox/a-bar/documentation/sound/index.html)
* [Microphone](https://www.jeantinland.com/toolbox/a-bar/documentation/microphone/index.html)
* [Keyboard](https://www.jeantinland.com/toolbox/a-bar/documentation/keyboard/index.html)
* [GitHub](https://www.jeantinland.com/toolbox/a-bar/documentation/github/index.html)
* [Hacker News](https://www.jeantinland.com/toolbox/a-bar/documentation/hacker-news/index.html)
* [CPU](https://www.jeantinland.com/toolbox/a-bar/documentation/cpu/index.html)
* [Memory](https://www.jeantinland.com/toolbox/a-bar/documentation/memory/index.html)
* [GPU](https://www.jeantinland.com/toolbox/a-bar/documentation/gpu/index.html)
* [Network stats](https://www.jeantinland.com/toolbox/a-bar/documentation/network-stats/index.html)
* [Disk activity](https://www.jeantinland.com/toolbox/a-bar/documentation/disk-activity/index.html)
* [Storage](https://www.jeantinland.com/toolbox/a-bar/documentation/storage/index.html)
* [Custom widgets](https://www.jeantinland.com/toolbox/a-bar/documentation/custom-widgets/index.html)
* [Settings](https://www.jeantinland.com/toolbox/a-bar/documentation/settings/index.html)
* [General settings](https://www.jeantinland.com/toolbox/a-bar/documentation/general-settings/index.html)
* [Appearance settings](https://www.jeantinland.com/toolbox/a-bar/documentation/appearance-settings/index.html)
* [Layout settings](https://www.jeantinland.com/toolbox/a-bar/documentation/layout-settings/index.html)

# Configuration

> Published on Wed, Feb 4, 2026> Updated on Wed, Feb 4, 2026

*a-bar* stores settings in two places:

* A JSON config file at `~/.a-barrc`
* UserDefaults (for fast load and backup)

When *a-bar* starts, it loads settings, validates them, and merges invalid or missing values with defaults. Saving from the app will update both UserDefaults and `~/.a-barrc`.

### Launch at login [#](https://www.jeantinland.com/toolbox/a-bar/documentation/configuration/index.html#launch-at-login)

You can enable **Launch at login** in the **General** tab. On macOS 13+, this uses the system service registration APIs.

### Window manager [#](https://www.jeantinland.com/toolbox/a-bar/documentation/configuration/index.html#window-manager)

*a-bar* supports both **yabai** and **AeroSpace**. You can choose which window manager to use in the **General** settings tab. Yabai is selected by default. Switching window managers will stop the current integration and start the new one automatically.

### yabai path [#](https://www.jeantinland.com/toolbox/a-bar/documentation/configuration/index.html#yabai-path)

If you use yabai, set the absolute path to the binary in **General**. The default is:

`/opt/homebrew/bin/yabai`

### AeroSpace path [#](https://www.jeantinland.com/toolbox/a-bar/documentation/configuration/index.html#aerospace-path)

If you use AeroSpace, set the absolute path to the binary in **General**. The default is:

`/opt/homebrew/bin/aerospace`

Something is wrong in this documentation? Please open an issue on GitHub in [a-bar repo](https://github.com/Jean-Tinland/a-bar/issues/new).

[InstallationPrevious article](https://www.jeantinland.com/toolbox/a-bar/documentation/installation/index.html)[Layout builderNext article](https://www.jeantinland.com/toolbox/a-bar/documentation/layout-builder/index.html)

Toggle documentation menu

[Docs](https://www.jeantinland.com/toolbox/a-bar/documentation/index.html)

* [Introduction](https://www.jeantinland.com/toolbox/a-bar/documentation/introduction/index.html)
* [Features](https://www.jeantinland.com/toolbox/a-bar/documentation/features/index.html)
* [Installation](https://www.jeantinland.com/toolbox/a-bar/documentation/installation/index.html)
* [Configuration](https://www.jeantinland.com/toolbox/a-bar/documentation/configuration/index.html)
* [Layout builder](https://www.jeantinland.com/toolbox/a-bar/documentation/layout-builder/index.html)
* [Automation](https://www.jeantinland.com/toolbox/a-bar/documentation/automation/index.html)
* [Widgets](https://www.jeantinland.com/toolbox/a-bar/documentation/widgets/index.html)
* [Spaces (yabai)](https://www.jeantinland.com/toolbox/a-bar/documentation/spaces/index.html)
* [Process (yabai)](https://www.jeantinland.com/toolbox/a-bar/documentation/process/index.html)
* [Spaces (AeroSpace)](https://www.jeantinland.com/toolbox/a-bar/documentation/aerospace-spaces/index.html)
* [Process (AeroSpace)](https://www.jeantinland.com/toolbox/a-bar/documentation/aerospace-process/index.html)
* [Battery](https://www.jeantinland.com/toolbox/a-bar/documentation/battery/index.html)
* [Weather](https://www.jeantinland.com/toolbox/a-bar/documentation/weather/index.html)
* [Date](https://www.jeantinland.com/toolbox/a-bar/documentation/date/index.html)
* [Time](https://www.jeantinland.com/toolbox/a-bar/documentation/time/index.html)
* [Wi‑Fi](https://www.jeantinland.com/toolbox/a-bar/documentation/wifi/index.html)
* [Sound](https://www.jeantinland.com/toolbox/a-bar/documentation/sound/index.html)
* [Microphone](https://www.jeantinland.com/toolbox/a-bar/documentation/microphone/index.html)
* [Keyboard](https://www.jeantinland.com/toolbox/a-bar/documentation/keyboard/index.html)
* [GitHub](https://www.jeantinland.com/toolbox/a-bar/documentation/github/index.html)
* [Hacker News](https://www.jeantinland.com/toolbox/a-bar/documentation/hacker-news/index.html)
* [CPU](https://www.jeantinland.com/toolbox/a-bar/documentation/cpu/index.html)
* [Memory](https://www.jeantinland.com/toolbox/a-bar/documentation/memory/index.html)
* [GPU](https://www.jeantinland.com/toolbox/a-bar/documentation/gpu/index.html)
* [Network stats](https://www.jeantinland.com/toolbox/a-bar/documentation/network-stats/index.html)
* [Disk activity](https://www.jeantinland.com/toolbox/a-bar/documentation/disk-activity/index.html)
* [Storage](https://www.jeantinland.com/toolbox/a-bar/documentation/storage/index.html)
* [Custom widgets](https://www.jeantinland.com/toolbox/a-bar/documentation/custom-widgets/index.html)
* [Settings](https://www.jeantinland.com/toolbox/a-bar/documentation/settings/index.html)
* [General settings](https://www.jeantinland.com/toolbox/a-bar/documentation/general-settings/index.html)
* [Appearance settings](https://www.jeantinland.com/toolbox/a-bar/documentation/appearance-settings/index.html)
* [Layout settings](https://www.jeantinland.com/toolbox/a-bar/documentation/layout-settings/index.html)
