---
title: "a-bar documentation • Jean Tinland"
source_url: "https://www.jeantinland.com/toolbox/a-bar/documentation/automation/index"
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

# Automation

> Published on Wed, Feb 4, 2026> Updated on Wed, Feb 4, 2026

*a-bar* can be automated via AppleScript from the command line.

## Refresh yabai data [#](https://www.jeantinland.com/toolbox/a-bar/documentation/automation/index.html#refresh-yabai-data)

```
osascript -e 'tell application "a-bar" to refresh "yabai"'
```

## Refresh AeroSpace data [#](https://www.jeantinland.com/toolbox/a-bar/documentation/automation/index.html#refresh-aerospace-data)

```
osascript -e 'tell application "a-bar" to refresh "aerospace"'
```

You can add this to your AeroSpace config (`~/.aerospace.toml`) to auto-refresh the bar on workspace and focus changes:

```
on-focus-changed = [
  "exec-and-forget osascript -e 'tell application \"a-bar\" to refresh \"aerospace\"'",
]

exec-on-workspace-change = [
  '/bin/zsh',
  '-c',
  '/usr/bin/osascript -e "tell application \"a-bar\" to refresh \"aerospace\""',
]
```

## Profiles [#](https://www.jeantinland.com/toolbox/a-bar/documentation/automation/index.html#profiles)

```
osascript -e 'tell application "a-bar" to set profile "Work"'
osascript -e 'tell application "a-bar" to get profile'
osascript -e 'tell application "a-bar" to list profiles'
```

## Custom widgets [#](https://www.jeantinland.com/toolbox/a-bar/documentation/automation/index.html#custom-widgets)

```
osascript -e 'tell application "a-bar" to refresh "My Widget"'
osascript -e 'tell application "a-bar" to toggle "My Widget"'
osascript -e 'tell application "a-bar" to hide "My Widget"'
osascript -e 'tell application "a-bar" to show "My Widget"'
```

Something is wrong in this documentation? Please open an issue on GitHub in [a-bar repo](https://github.com/Jean-Tinland/a-bar/issues/new).

[Layout builderPrevious article](https://www.jeantinland.com/toolbox/a-bar/documentation/layout-builder/index.html)[WidgetsNext article](https://www.jeantinland.com/toolbox/a-bar/documentation/widgets/index.html)

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
