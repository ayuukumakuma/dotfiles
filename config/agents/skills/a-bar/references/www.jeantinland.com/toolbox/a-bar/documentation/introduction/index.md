---
title: "a-bar documentation • Jean Tinland"
source_url: "https://www.jeantinland.com/toolbox/a-bar/documentation/introduction/index"
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

# Introduction

> Published on Wed, Feb 4, 2026> Updated on Sat, Feb 14, 2026

*a-bar* is a native macOS menu bar replacement inspired by *simple-bar*. It is built with Swift and SwiftUI and runs as a standalone app (no Übersicht required).

It focuses on performance, stability, and extensibility, while keeping the workflow-oriented experience of a customizable bar that surfaces your spaces, windows, and system status.

*a-bar* supports both [yabai](https://github.com/koekeishiya/yabai) and [AeroSpace](https://github.com/nikitabobko/AeroSpace) as window managers. You can switch between them in the **General** settings.

This documentation walks you through installation, configuration, layout building, widgets, and settings so you can tailor *a-bar* to your workflow.

**Note of caution:** Even in v1.x.x, a-bar stays in early development. Expect bugs and missing features. Feedback and contributions are welcome!

**About signing and notarization:** a-bar is currently not signed or notarized. **This means that you will need to bypass macOS security to run it, and you may see warnings about the app being from an unidentified developer**. I'm not planning to notarize the app as it would cost around $100/year.

Something is wrong in this documentation? Please open an issue on GitHub in [a-bar repo](https://github.com/Jean-Tinland/a-bar/issues/new).

[FeaturesNext article](https://www.jeantinland.com/toolbox/a-bar/documentation/features/index.html)

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
