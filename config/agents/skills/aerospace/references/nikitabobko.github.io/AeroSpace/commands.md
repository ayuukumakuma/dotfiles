---
title: "AeroSpace Commands"
source_url: "https://nikitabobko.github.io/AeroSpace/commands"
fetched_at: "2026-04-27T00:17:19.984035+00:00"
---

# AeroSpace Commands

Table of Contents

* [1\. balance-sizes](#balance-sizes)
* [2\. close](#close)
* [3\. close-all-windows-but-current](#close-all-windows-but-current)
* [4\. enable](#enable)
* [5\. exec-and-forget](#exec-and-forget)
* [6\. flatten-workspace-tree](#flatten-workspace-tree)
* [7\. focus](#focus)
* [8\. focus-back-and-forth](#focus-back-and-forth)
* [9\. focus-monitor](#focus-monitor)
* [10\. fullscreen](#fullscreen)
* [11\. join-with](#join-with)
* [12\. layout](#layout)
* [13\. macos-native-fullscreen](#macos-native-fullscreen)
* [14\. macos-native-minimize](#macos-native-minimize)
* [15\. mode](#mode)
* [16\. move](#move)
* [17\. move-mouse](#move-mouse)
* [18\. move-node-to-monitor](#move-node-to-monitor)
* [19\. move-node-to-workspace](#move-node-to-workspace)
* [20\. move-workspace-to-monitor](#move-workspace-to-monitor)
* [21\. reload-config](#reload-config)
* [22\. resize](#resize)
* [23\. split](#split)
* [24\. swap](#swap)
* [25\. summon-workspace](#summon-workspace)
* [26\. trigger-binding](#trigger-binding)
* [27\. volume](#volume)
* [28\. workspace](#workspace)
* [29\. workspace-back-and-forth](#workspace-back-and-forth)
* [30\. Query commands](#query-commands)
   * [30.1\. config](#config)
   * [30.2\. debug-windows](#debug-windows)
   * [30.3\. list-apps](#list-apps)
   * [30.4\. list-exec-env-vars](#list-exec-env-vars)
   * [30.5\. list-modes](#list-modes)
   * [30.6\. list-monitors](#list-monitors)
   * [30.7\. list-windows](#list-windows)
   * [30.8\. list-workspaces](#list-workspaces)

AeroSpace is an i3-like tiling window manager for macOS

**Project homepage**: <https://github.com/nikitabobko/AeroSpace>



* [AeroSpace Guide](guide)
* [AeroSpace Commands](#)
* [AeroSpace Goodies](goodies)

Commands documentation is also available as manpages.

## [](#balance-sizes)[1\. balance-sizes](#balance-sizes)

balance-sizes [-h|--help] [--workspace <workspace>]

Balance sizes of all windows in the current workspace

**OPTIONS**

\-h, --help

Print help

\--workspace <workspace>

Act on the specified workspace instead of the focused workspace

## [](#close)[2\. close](#close)

close [-h|--help] [--quit-if-last-window] [--window-id <window-id>]

Close the focused window

Normally, you don’t need to use this command, because macOS offers its own `cmd+w` binding. You might want to use the command from CLI for scripting purposes

**OPTIONS**

\-h, --help

Print help

\--quit-if-last-window

Quit the app instead of closing if it’s the last window of the app

\--window-id <window-id>

Act on the specified window instead of the focused window

## [](#close-all-windows-but-current)[3\. close-all-windows-but-current](#close-all-windows-but-current)

close-all-windows-but-current [-h|--help] [--quit-if-last-window]

On the focused workspace, close all windows but current

**OPTIONS**

\-h, --help

Print help

\--quit-if-last-window

Quit the apps instead of closing them if it’s their last window

## [](#enable)[4\. enable](#enable)

enable [-h|--help] toggle
enable [-h|--help] on [--fail-if-noop]
enable [-h|--help] off [--fail-if-noop]

Temporarily disable window management

When you disable AeroSpace, windows from currently invisible workspaces will be placed to the visible area of the screen

Key events are not intercepted when AeroSpace is disabled

**OPTIONS**

\-h, --help

Print help

\--fail-if-noop

Exit with non-zero exit code if already in the requested mode

## [](#exec-and-forget)[5\. exec-and-forget](#exec-and-forget)

exec-and-forget <bash-script>

Run `/bin/bash -c '<bash-script>'`, and don’t wait for the command termination. Stdout, stderr and exit code are ignored.

For example, you can use this command to launch applications:

```
alt-enter = 'exec-and-forget open -n /System/Applications/Utilities/Terminal.app'
```

`<bash-script>` is passed "as is" to bash without any transformations and escaping. `<bash-script>` is treated as suffix of the TOML string, it’s not even an argument in classic CLI sense

* The command is available in config
* The command is **NOT** available in CLI

## [](#flatten-workspace-tree)[6\. flatten-workspace-tree](#flatten-workspace-tree)

flatten-workspace-tree [-h|--help] [--workspace <workspace>]

Flatten the tree of the focused workspace

The command is useful when you messed up with your layout, and it’s easier to "reset" it and start again.

**OPTIONS**

\-h, --help

Print help

\--workspace <workspace>

Act on the specified workspace instead of the focused workspace

## [](#focus)[7\. focus](#focus)

focus [-h|--help] [--ignore-floating]
      [--boundaries <boundary>] [--boundaries-action <action>]
      (left|down|up|right)
focus [-h|--help] [--ignore-floating]
      [--boundaries <boundary>] [--boundaries-action <action>]
      (dfs-next|dfs-prev)
focus [-h|--help] --window-id <window-id>
focus [-h|--help] --dfs-index <dfs-index>

Set focus to a window.

Contrary to i3, `focus` command doesn’t have a separate argument to focus floating windows. From `focus` command perspective, floating windows are part of [the tree](guide#tree). The floating window parent container is determined as the smallest tiling container that contains the center of the floating window. The technique eliminates the need for an additional binding for floating windows. This behavior can be disabled with `--ignore-floating` flag.

`focus child|parent` isn’t supported because the necessity of this operation is under the question.<https://github.com/nikitabobko/AeroSpace/issues/5>

**OPTIONS**

\-h, --help

Print help

\--boundaries <boundary>

Defines focus boundaries.
`<boundary>` possible values: `(workspace|all-monitors-outer-frame)`.
The default is: `workspace`

\--boundaries-action <action>

Defines the behavior when requested to cross the `<boundary>`.
`<action>` possible values: `(stop|fail|wrap-around-the-workspace|wrap-around-all-monitors)`.
The default is: `stop`

\--window-id <window-id>

Focus the window with specified `<window-id>`

\--dfs-index <dfs-index>

Focus window by its index, based on a depth-first search (DFS) of the window within the workspace tree. Index is 0-based.

\--ignore-floating

Don’t perceive floating windows as part of the tree. It may be useful for more reliable scripting.

**ARGUMENTS**

(left|down|up|right)

Set focus to the nearest window in the given direction.

(dfs-next|dfs-prev)

Set focus to the window before or after the current window in the depth-first order (top-to-bottom and left-to-right) of windows in the current workspace tree. In this mode, `--boundaries` must be `workspace` (the default) and `--boundaries-action` can be set to one of `(stop|fail|wrap-around-the-workspace)`.

## [](#focus-back-and-forth)[8\. focus-back-and-forth](#focus-back-and-forth)

focus-back-and-forth [-h|--help]

Switch between the current and previously focused elements back and forth. The element is either a window or an empty workspace.

AeroSpace stores only one previously focused window in history, which means that if you close the previous window,`focus-back-and-forth` has no window to switch focus to. In that case, the command will exit with non-zero exit code.

That’s why it may be preferred to combine `focus-back-and-forth` with `workspace-back-and-forth`:

aerospace focus-back-and-forth || aerospace workspace-back-and-forth

Also see: [workspace-back-and-forth](#workspace-back-and-forth)

## [](#focus-monitor)[9\. focus-monitor](#focus-monitor)

focus-monitor [-h|--help] [--wrap-around] (left|down|up|right)
focus-monitor [-h|--help] [--wrap-around] (next|prev)
focus-monitor [-h|--help] <monitor-pattern>...

Focus monitor by relative direction, by order, or by pattern

**OPTIONS**

\-h, --help

Print help

\--wrap-around

Make it possible to wrap around focus

**ARGUMENTS**

(left|down|up|right)

Focus monitor in direction relative to the focused monitor

(next|prev)

Focus next|prev monitor in order they appear in tray icon

<monitor-pattern>…​

Find the first matching monitor and focus it. Multiple monitor patterns is useful for different monitor configurations. Monitor patterns follow the same format as in `workspace-to-monitor-force-assignment` config option

## [](#fullscreen)[10\. fullscreen](#fullscreen)

fullscreen [-h|--help]     [--window-id <window-id>] [--no-outer-gaps]
fullscreen [-h|--help] on  [--window-id <window-id>] [--no-outer-gaps] [--fail-if-noop]
fullscreen [-h|--help] off [--window-id <window-id>] [--fail-if-noop]

Toggle the fullscreen mode for the focused window

Switching to a different tiling window within the same workspace while the current focused window is in fullscreen mode results in the fullscreen window exiting fullscreen mode.

**OPTIONS**

\-h, --help

Print help

\--no-outer-gaps

Remove the outer gaps when in fullscreen mode

\--fail-if-noop

Exit with non-zero exit code if already fullscreen or already not fullscreen

\--window-id <window-id>

Act on the specified window instead of the focused window

**ARGUMENTS**

on, off

`on` means enter fullscreen mode. `off` means exit fullscreen mode. Toggle between the two if not specified

## [](#join-with)[11\. join-with](#join-with)

join-with [-h|--help] [--window-id <window-id>] (left|down|up|right)

Put the focused window and the nearest node in the specified direction under a common parent container

**EXAMPLES**

Given this layout

h_tiles
├── window 1
├── window 2 (focused)
└── window 3

`join-with right` will result in the following layout

h_tiles
├── window 1
└── v_tiles
    ├── window 2 (focused)
    └── window 3

| Note | join-with is a high-level replacement for i3’s [split command](https://i3wm.org/docs/userguide.html#%5Fsplitting%5Fcontainers). There is an observation that the only reason why you might want to split a node is to put several windows under a common "umbrella" parent. Unlike split, join-with can be used with [enable-normalization-flatten-containers](guide#normalization) |
| ---- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |

**OPTIONS**

\-h, --help

Print help

\--window-id <window-id>

Act on the specified window instead of the focused window

## [](#layout)[12\. layout](#layout)

layout [-h|--help] [--window-id <window-id>]
       (h_tiles|v_tiles|h_accordion|v_accordion|tiles|accordion|horizontal|vertical|tiling|floating)...

Change layout of the focused window to the given layout

If several arguments are supplied then finds the first argument that doesn’t describe the currently active layout, and applies the layout.

* Change both tiling layout and orientation in one go: `h_tiles|v_tiles|h_accordion|v_accordion`
* Change tiling layout but preserve orientation: `tiles|accordion`
* Change orientation but preserve layout: `horizontal|vertical`
* Toggle floating/tiling mode: `tiling|floating`

**OPTIONS**

\-h, --help

Print help

\--window-id <window-id>

Act on the specified window instead of the focused window

**EXAMPLES**

* Toggle between `floating` and `tiling` layouts (order of args doesn’t matter):
`aerospace layout floating tiling`
* Toggle orientation (order of args doesn’t matter):
`aerospace layout horizontal vertical`
* Toggle between `tiles` and `accordion` layouts (order of args doesn’t matter):
`aerospace layout tiles accordion`
* Switch to `tiles` layout. Toggle the layout orientation if already in `tiles` layout:
`aerospace layout tiles horizontal vertical`

## [](#macos-native-fullscreen)[13\. macos-native-fullscreen](#macos-native-fullscreen)

macos-native-fullscreen [-h|--help] [--window-id <window-id>]
macos-native-fullscreen [-h|--help] [--window-id <window-id>] [--fail-if-noop] on
macos-native-fullscreen [-h|--help] [--window-id <window-id>] [--fail-if-noop] off

Toggle macOS fullscreen for the focused window

**OPTIONS**

\-h, --help

Print help

\--fail-if-noop

Exit with non-zero exit code if already fullscreen or already not fullscreen

\--window-id <window-id>

Act on the specified window instead of the focused window

**ARGUMENTS**

on, off

`on` means enter fullscreen mode.`off` means exit fullscreen mode. Toggle between the two if not specified

## [](#macos-native-minimize)[14\. macos-native-minimize](#macos-native-minimize)

macos-native-minimize [-h|--help] [--window-id <window-id>]

Minimize focused window

**OPTIONS**

\-h, --help

Print help

\--window-id <window-id>

Act on the specified window instead of the focused window

## [](#mode)[15\. mode](#mode)

mode [-h|--help] <binding-mode>

Activate the specified binding mode

See [the guide](guide#binding-modes) for documentation about binding modes

## [](#move)[16\. move](#move)

move [-h|--help] [--window-id <window-id>] [--boundaries <boundary>] [--boundaries-action <boundary-action>] (left|down|up|right)

Move the focused window in the given direction. See the "Examples" section for more details.

Deprecated name: `move-through`

**OPTIONS**

\-h, --help

Print help

\--window-id <window-id>

Act on the specified window instead of the focused window

\--boundaries <boundary>

Defines move boundaries.
`<boundary>` possible values: `(workspace|all-monitors-outer-frame)`.
The default is: `workspace`

\--boundaries-action <boundary-action>

Defines the behavior when requested to move across the `<boundary>`.
`<boundary-action>` possible values: `(stop|fail|create-implicit-container)`.
The default is: `create-implicit-container`

**EXAMPLES**

1. Given this layout
h_tiles
├── window 1 (focused)
└── window 2
`move right` will result in the following layout
h_tiles
├── window 2
└── window 1 (focused)
2. Given this layout
h_tiles
├── window 1
├── window 2 (focused)
└── v_tiles
    ├── window 3
    └── window 4
`move right` will result in the following layout
h_tiles
├── window 1
└── v_tiles
    ├── window 3
    ├── window 2 (focused)
    └── window 4
3. Given this layout
h_tiles
├── window 1
└── v_tiles
    ├── window 3
    ├── window 2 (focused)
    └── window 4
`move left` will result in the following layout
h_tiles
├── window 1
├── window 2 (focused)
└── v_tiles
    ├── window 3
    └── window 4
4. **Implicit container example**
In some cases, `move` needs to implicitly create a container to fulfill your command.
Given this layout
h_tiles
├── window 1
├── window 2 (focused)
└── window 3
`move up` will result in the following layout
v_tiles
├── window 2 (focused)
└── h_tiles
    ├── window 1
    └── window 3
`v_tiles` is an implicitly created container.
**Remark**: If `--boundaries` is set to `all-monitors-outer-frame` and there is a monitor in the `up` direction, the implicit container isn’t created.
Instead, `window 2` would be moved to the monitor above the current.

## [](#move-mouse)[17\. move-mouse](#move-mouse)

move-mouse [-h|--help] [--fail-if-noop] <mouse-position>

Move mouse to the requested position

**OPTIONS**

\-h, --help

Print help

\--fail-if-noop

Exit with non-zero exit code if mouse is already at the requested position. The flag is compatible only with `window-lazy-center` and `monitor-lazy-center` arguments.

**ARGUMENTS**

<mouse-position>

Position to move mouse to. Possible values:

* `monitor-lazy-center`. Move mouse to the center of the focused monitor, **unless** it is already within the monitor boundaries.
* `monitor-force-center`. Move mouse to the center of the focused monitor.
* `window-lazy-center`. Move mouse to the center of the focused window, **unless** it is already within the window boundaries. Exit with non-zero code if no window is focused.
* `window-force-center`. Move mouse to the center of the focused window. Exit with non-zero code if no window is focused.

**EXAMPLES**

* Try to move mouse to the center of the window. If there is no window in focus, move mouse to the center of the monitor:
`aerospace move-mouse window-lazy-center || aerospace move-mouse monitor-lazy-center`

## [](#move-node-to-monitor)[18\. move-node-to-monitor](#move-node-to-monitor)

move-node-to-monitor [-h|--help] [--window-id <window-id>] [--focus-follows-window]
                     [--wrap-around] (left|down|up|right|next|prev)
move-node-to-monitor [-h|--help] [--window-id <window-id>] [--focus-follows-window]
                     [--fail-if-noop] <monitor-pattern>...

Move window to monitor targeted by relative direction, by order, or by pattern

**OPTIONS**

\-h, --help

Print help

\--wrap-around

Make it possible to wrap around the movement

\--focus-follows-window

Make sure that the window in question receives focus after moving. This flag is a shortcut for manually running `aerospace-workspace`/`aerospace-focus` after `move-node-to-monitor` successful execution.

\--fail-if-noop

Exit with non-zero code if moving window to monitor it already belongs to

\--window-id <window-id>

Act on the specified window instead of the focused window

**ARGUMENTS**

(left|down|up|right)

Move window to monitor in direction relative to the focused monitor

(next|prev)

Move window to next|prev monitor in order they appear in tray icon

<monitor-pattern>…​

Find the first matching monitor and move the window there. Multiple monitor patterns is useful for different monitor configurations. Monitor patterns follow the same format as in `workspace-to-monitor-force-assignment` config option

## [](#move-node-to-workspace)[19\. move-node-to-workspace](#move-node-to-workspace)

move-node-to-workspace [-h|--help] [--focus-follows-window] [--wrap-around]
                       [--stdin|--no-stdin]
                       (next|prev)
move-node-to-workspace [-h|--help] [--focus-follows-window] [--fail-if-noop]
                       [--window-id <window-id>] <workspace-name>

Move the focused window to the specified workspace

`(next|prev)` is identical to `workspace (next|prev)`

**OPTIONS**

\-h, --help

Print help

\--wrap-around

Make it possible to jump between first and last workspaces using (next|prev)

\--fail-if-noop

Exit with non-zero code if move window to workspace it already belongs to

\--focus-follows-window

Make sure that the window in question receives focus after moving. This flag is a shortcut for manually running `aerospace-workspace`/`aerospace-focus` after `move-node-to-workspace` successful execution.

\--window-id <window-id>

Act on the specified window instead of the focused window

\--stdin

Read the list of workspaces from stdin. Incompatible with `--no-stdin`

\--no-stdin

Ignore the list of workspaces from stdin, even if provided. Incompatible with `--stdin`

**ARGUMENTS**

(next|prev)

Move window to next or prev workspace

<workspace-name>

Specifies workspace name where to move window to

## [](#move-workspace-to-monitor)[20\. move-workspace-to-monitor](#move-workspace-to-monitor)

move-workspace-to-monitor [-h|--help] [--workspace <workspace>] [--wrap-around] (left|down|up|right)
move-workspace-to-monitor [-h|--help] [--workspace <workspace>] [--wrap-around] (next|prev)
move-workspace-to-monitor [-h|--help] [--workspace <workspace>] <monitor-pattern>...

Move workspace to monitor targeted by relative direction, by order, or by pattern. Focus follows the focused workspace, so the workspace stays focused.

The command fails for workspaces [that have monitor force assignment](guide#assign-workspaces-to-monitors).

**OPTIONS**

\-h, --help

Print help

\--wrap-around

Allows to move workspace between first and last monitors

\--workspace <workspace>

Act on the specified workspace instead of the focused workspace

**ARGUMENTS**

(left|down|up|right)

Move workspace to monitor in direction relative to the focused monitor

(next|prev)

Move the workspace to next or prev monitor. 'next' or 'prev' monitor is calculated relative to the monitor `<workspace>` currently belongs to.

<monitor-pattern>

Find the first matching monitor and move the workspace there. Multiple monitor patterns is useful for different monitor configurations. Monitor patterns follow the same format as in `workspace-to-monitor-force-assignment` config option

## [](#reload-config)[21\. reload-config](#reload-config)

reload-config [-h|--help] [--no-gui] [--dry-run]

Reload currently active config

If the config contains errors they will be printed to stdout, and GUI will open to show the errors.

**OPTIONS**

\-h, --help

Print help

\--no-gui

Don’t open GUI to show error. Only use stdout to report errors

\--dry-run

Validate the config and show errors (if any) but don’t reload the config

**EXIT CODE**

0

Success. The config is reloaded successfully.

non-zero exit code

Failure. The config contains errors.

## [](#resize)[22\. resize](#resize)

resize [-h|--help] [--window-id <window-id>] (smart|smart-opposite|width|height) [+|-]<number>

Resize the focused window

The dimension to resize is chosen by the first argument

* `width` changes width
* `height` changes height
* `smart` changes width if the parent has horizontal orientation, and it changes height if the parent has vertical orientation
* `smart-opposite` resizes the opposite axis of smart

Second argument controls how much the size changes

* If the `<number>` is prefixed with `+` then the dimension is increased
* If the `<number>` is prefixed with `-` then the dimension is decreased
* If the `<number>` is prefixed with neither `+` nor `-` then the command changes the absolute value of the dimension

**OPTIONS**

\-h, --help

Print help

\--window-id <window-id>

Act on the specified window instead of the focused window

## [](#split)[23\. split](#split)

split [-h|--help] [--window-id <window-id>] (horizontal|vertical|opposite)

`split` command exists solely for compatibility with i3\. Unless you’re hardcore i3 user who knows what they are doing, it’s recommended to use `join-with`

**If the parent of focused window contains more than one child**, then the command

1. Creates a new tiling container
2. Replaces the focused window with the container
3. Puts the focused window into the container as its only child

The argument configures orientation of the newly created container.`opposite` means opposite orientation compared to the parent container.

**If the parent of the focused window contains only a single child** (the window itself), then `split` command changes the orientation of the parent container

| Important | split command has no effect if enable-normalization-flatten-containers is turned on. Consider using join-with if you want to keep enable-normalization-flatten-containers enabled |
| --------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |

**OPTIONS**

\-h, --help

Print help

\--window-id <window-id>

Act on the specified window instead of the focused window

## [](#swap)[24\. swap](#swap)

swap [-h|--help] [--window-id <window-id>] [--swap-focus]
     [--wrap-around]
     (left|down|up|right|dfs-next|dfs-prev)

Swaps the focused window with another window.

The operation is equivalent to dragging a window with the mouse.

**OPTIONS**

\-h, --help

Print help

\--window-id <window-id>

Act on the specified window instead of the focused window

\--swap-focus

Swap focus away from the currently focused window. By default, this command does not change the focused window.

\--wrap-around

Wrap around if the window is at the edge of the workspace (for `(left|down|up|right)`) or the start/end of the depth first order (for `(dfs-next|dfs-prev)`).

**ARGUMENTS**

(left|down|up|right)

Swaps the focused window with the nearest window in the given direction.

(dfs-next|dfs-prev)

Swaps the focused window with the next or previous window in the depth-first order (top-to-bottom and left-to-right) of windows in the current workspace tree.

## [](#summon-workspace)[25\. summon-workspace](#summon-workspace)

summon-workspace [-h|--help] [--fail-if-noop] <workspace>

Move the requested workspace to the focused monitor. The moved workspace becomes focused. The behavior is identical to Xmonad.

The command makes sense only in multi-monitor setup. In single monitor setup the command is identical to `workspace` command.

**OPTIONS**

\-h, --help

Print help

\--fail-if-noop

Exit with non-zero exit code if the workspace is already visible on the focused monitor.

**ARGUMENTS**

<workspace>

The workspace to operate on.

## [](#trigger-binding)[26\. trigger-binding](#trigger-binding)

trigger-binding [-h|--help] <binding> --mode <mode-id>

Trigger AeroSpace binding as if it was pressed by user

You can use aerospace-config command to inspect available bindings:
`aerospace config --get mode.main.binding --keys`

**OPTIONS**

\-h, --help

Print help

\--mode <mode-id>

Mode to search `<binding>` in

**ARGUMENTS**

<binding>

Binding to trigger

**EXAMPLES**

* Run alphabetically first binding from config (useless and synthetic example):
`aerospace trigger-binding --mode main "$(aerospace config --get mode.main.binding --keys | head -1)"`
* Trigger `alt-tab` binding:
`aerospace trigger-binding --mode main alt-tab`

## [](#volume)[27\. volume](#volume)

volume [-h|--help] (up|down) [--no-gui]
volume [-h|--help] (mute-toggle|mute-off|mute-on) [--no-gui]
volume [-h|--help] set <number> [--no-gui]

Manipulate volume

**OPTIONS**

\-h, --help

Print help

\--no-gui

Don’t show volume GUI indicator

**ARGUMENTS**

(up|down)

Increase or decrease the volume

(mute-toggle|mute-on|mute-off)

Toggle/On/Off mute

set <number>

Set volume to the exact value on scale from 0 to 100

## [](#workspace)[28\. workspace](#workspace)

workspace [-h|--help] [--auto-back-and-forth] [--fail-if-noop] <workspace-name>
workspace [-h|--help] [--wrap-around] [--stdin|--no-stdin] (next|prev)

**1\. <workspace-name> syntax**

Focus the specified workspace

**2\. (next|prev) syntax**

Focuses next or previous workspace in **the list**.

* If `--stdin` is specified, then **the list** is taken from stdin
* Otherwise, **the list** is defined as all workspaces on focused monitor in alphabetical order

**OPTIONS**

\-h, --help

Print help

\--wrap-around

Make it possible to jump between first and last workspaces using `(next|prev)`

\--auto-back-and-forth

Automatic `back-and-forth` when switching to already focused workspace. Incompatible with `--fail-if-noop`

\--fail-if-noop

Exit with non-zero exit code if switch to the already focused workspace. Incompatible with `--auto-back-and-forth`

\--stdin

Read the list of workspaces from stdin. Incompatible with `--no-stdin`

\--no-stdin

Ignore the list of workspaces from stdin, even if provided. Incompatible with `--stdin`

**EXAMPLES**

* Go to the next non empty workspace on the focused monitor:
`aerospace list-workspaces --monitor focused --empty no | aerospace workspace next`

## [](#workspace-back-and-forth)[29\. workspace-back-and-forth](#workspace-back-and-forth)

workspace-back-and-forth [-h|--help]

Switch between the focused workspace and previously focused workspace back and forth

Unlike `focus-back-and-forth`, `workspace-back-and-forth` always succeeds. Because unlike windows, workspaces can not be "closed". Workspaces are name-addressable objects. They are created and destroyed on the fly.

Also see: [focus-back-and-forth](#focus-back-and-forth)

## [](#query-commands)[30\. Query commands](#query-commands)

Query commands are commands that do not change the state but rather allow the examination of the current state.

* Query commands are **NOT** available in config
(because there is no way to consume the stdout of these commands in config)
* Query commands are only available in CLI

### [](#config)[30.1\. config](#config)

config [-h|--help] --get <name> [--json] [--keys]
config [-h|--help] --major-keys
config [-h|--help] --all-keys
config [-h|--help] --config-path

Query AeroSpace config options

For now, only `mode.*` config options are supported

Under the hood, the config is represented as recursive data structure of maps, arrays, strings, and integers.

Printing without `--json` or `--keys` flag is supported only for scalar types (strings and integers) and array of scalar types. Printing other complicated objects requires `--json` or `--keys` flag.

**OPTIONS**

\-h, --help

Print help

\--get <name>

Get the value for a given key. You can inspect available keys with `--major-keys` or `--all-keys`

\--major-keys

Print major keys

\--all-keys

Print all available keys recursively

\--json

Print result in JSON format

\--keys

Print keys of the complicated object (map or array)

\--config-path

Print absolute path to the loaded config

**EXAMPLES**

* List all binding modes:
$ aerospace config --get mode --keys
main
service
* List all key bindings for 'main' binding mode:
$ aerospace config --get mode.main.binding --keys
alt-1
alt-2
...
* List all key bindings for 'main' binding mode in JSON format:
$ aerospace config --get mode.main.binding --json
{
  "alt-w" : "workspace W",
  "alt-y" : "workspace Y",
  "alt-n" : "workspace N",
  "alt-shift-e" : "move-node-to-workspace E",
  "alt-shift-m" : "move-node-to-workspace M",
  "alt-shift-t" : "move-node-to-workspace T",
...

### [](#debug-windows)[30.2\. debug-windows](#debug-windows)

debug-windows [-h|--help] [--window-id <window-id>]

Interactive command to record Accessibility API debug information to create bug reports

Use this command output to report bug reports about incorrect windows handling (e.g. some windows are floated when they shouldn’t).

The intended usage is the following:

1. Run the command to start the debug session recording
2. Focus problematic window or make the window appear.
3. Run the command one more time to stop the debug session recording and print the results

`debug-windows` command is **not stable API**. Please **don’t rely on** the command existence and output format. The only intended use case is to report bugs about incorrect windows handling.

**OPTIONS**

\-h, --help

Print help

\--window-id <window-id>

Print debug information of the specified window right away. Usage of this flag disables interactive mode.

### [](#list-apps)[30.3\. list-apps](#list-apps)

list-apps [-h|--help] [--macos-native-hidden [no]] [--format <output-format>] [--count] [--json]

Print the list of running applications that appears in the Dock and may have a user interface

The command is useful to inspect list of applications to compose filter for [on-window-detected callback](guide#on-window-detected-callback)

**OPTIONS**

\-h, --help

Print help

\--macos-native-hidden \[no\]

Filter results to only print hidden applications.`[no]` inverts the condition

\--format <output-format>

Specify output format. See "Output Format" section for more details. Incompatible with `--count`

\--count

Output only the number of apps. Incompatible with: `--format`, `--json`

\--json

Output in JSON format. Can be used in combination with `--format` to specify which data to include into the json. Incompatible with `--count`

**OUTPUT FORMAT**

Output format can be configured with optional `[--format <output-format>]` option.`<output-format>` supports [string interpolation](https://en.wikipedia.org/wiki/String%5Finterpolation).

If not specified, the default `<output-format>` is:
`%{app-pid}%{right-padding} | %{app-bundle-id}%{right-padding} | %{app-name}`

The following variables can be used inside `<output-format>`:

%{app-bundle-id}

String. Application unique identifier. [Bundle ID](https://developer.apple.com/documentation/appstoreconnectapi/bundle%5Fids)

%{app-name}

String. Application name

%{app-pid}

Number. [UNIX process identifier](https://en.wikipedia.org/wiki/Process%5Fidentifier)

%{app-exec-path}

String. Application executable path

%{app-bundle-path}

String. Application bundle path

%{right-padding}

A special variable which expands with a minimum number of spaces required to form a right padding in the appropriate column

%{newline}

Unicode U+000A newline symbol `\n`

%{tab}

Unicode U+0009 tab symbol `\t`

### [](#list-exec-env-vars)[30.4\. list-exec-env-vars](#list-exec-env-vars)

list-exec-env-vars [-h|--help]

List environment variables that exec-\* commands and callbacks are run with

Examples of commands and callbacks:

* `aerospace exec-and-forget` command
* `exec-on-workspace-change-callback`

### [](#list-modes)[30.5\. list-modes](#list-modes)

list-modes [-h|--help] [--current] [--count] [--json]

Print a list of modes currently specified in the configuration

See [the guide](guide#binding-modes) for documentation about binding modes

**OPTIONS**

\-h, --help

Print help

\--current

Only print the currently active mode. Incompatible with `--count`

\--count

Output only the number of modes. Incompatible with `--current`, `--json`

\--json

Output in JSON format. Incompatible with `--count`

### [](#list-monitors)[30.6\. list-monitors](#list-monitors)

list-monitors [-h|--help] [--focused [no]] [--mouse [no]] [--format <output-format>] [--count] [--json]

Print monitors that satisfy conditions

**OPTIONS**

\-h, --help

Print help

\--focused \[no\]

Filter results to only print the focused monitor.`[no]` inverts the condition

\--mouse \[no\]

Filter results to only print the monitor with the mouse.`[no]` inverts the condition

\--format <output-format>

Specify output format. See "Output Format" section for more details. Incompatible with `--count`

\--count

Output only the number of monitors. Incompatible with `--format`

\--json

Output in JSON format. Can be used in combination with `--format` to specify which data to include into the json. Incompatible with `--count`

**OUTPUT FORMAT**

Output format can be configured with optional `[--format <output-format>]` option.`<output-format>` supports [string interpolation](https://en.wikipedia.org/wiki/String%5Finterpolation).

If not specified, the default `<output-format>` is:
`%{monitor-id}%{right-padding} | %{monitor-name}`

The following variables can be used inside `<output-format>`:

%{monitor-id}

1-based Number. Sequential number of the belonging monitor

%{monitor-appkit-nsscreen-screens-id}

1-based index of the belonging monitor in `NSScreen.screens` array. Useful for integration with other tools that might be using `NSScreen.screens` ordering (like sketchybar).

%{monitor-name}

String. Name of the belonging monitor

%{monitor-is-main}

Boolean. True if the monitor is main.

%{right-padding}

A special variable which expands with a minimum number of spaces required to form a right padding in the appropriate column

%{newline}

Unicode U+000A newline symbol `\n`

%{tab}

Unicode U+0009 tab symbol `\t`

### [](#list-windows)[30.7\. list-windows](#list-windows)

list-windows [-h|--help] (--workspace <workspace>...|--monitor <monitor>...)
             [--monitor <monitor>...] [--workspace <workspace>...]
             [--pid <pid>] [--app-bundle-id <app-bundle-id>] [--format <output-format>]
             [--count] [--json]
list-windows [-h|--help] --all [--format <output-format>] [--count] [--json]
list-windows [-h|--help] --focused [--format <output-format>] [--count] [--json]

Print windows that satisfy conditions

**OPTIONS**

\-h, --help

Print help

\--all

Alias for `--monitor all`. Please use this option **with caution**. Use it when you really need to get workspaces/windows from **all monitors**.

For multi-monitor setup `--monitor focused` is almost always a preferred option. If you’re automating something then you don’t want to mess up with workspaces/windows on a different monitor.

With great power comes great responsibility.

\--focused

Print the focused window. Please note that it is possible for no window to be in focus. In that case, error is reported.

\--workspace <workspace>…​

Filter results to only print windows that belong to either of specified workspaces.`<workspace>…​` is a space-separated list of workspace names.

Possible values:

1. Workspace name
2. `focused` is a special workspace name that represents the focused workspace
3. `visible` is a special workspace name that represents all currently visible workspaces (In multi-monitor setup, there are multiple visible workspaces)

\--monitor <monitors>

Filter results to only print workspaces/windows that are attached to specified monitors.`<monitors>` is a space separated list of monitor IDs.

Possible monitors IDs:

1. 1-based index of a monitor as if monitors were ordered horizontally from left to right
2. `all` is a special monitor ID that represents all monitors
3. `mouse` is a special monitor ID that represents monitor with the mouse
4. `focused` is a special monitor ID that represents the focused monitor

\--pid <pid>

Filter results to only print windows that belong to the Application with specified `<pid>`

\--app-bundle-id <app-bundle-id>

Filter results to only print windows that belong to the Application with specified [Bundle ID](https://developer.apple.com/documentation/appstoreconnectapi/bundle%5Fids)

Deprecated (but still supported) flag name: `--app-id`

\--format <output-format>

Specify output format. See "Output Format" section for more details. Incompatible with `--count`

\--count

Output only the number of windows. Incompatible with `--format`

\--json

Output in JSON format. Can be used in combination with `--format` to specify which data to include into the json. Incompatible with `--count`

**OUTPUT FORMAT**

Output format can be configured with optional `[--format <output-format>]` option.`<output-format>` supports [string interpolation](https://en.wikipedia.org/wiki/String%5Finterpolation).

If not specified, the default `<output-format>` is:
`%{window-id}%{right-padding} | %{app-name}%{right-padding} | %{window-title}`

The following variables can be used inside `<output-format>`:

%{window-id}

Number. Window unique ID

%{window-title}

String. Window title

%{window-is-fullscreen}

Boolean. Is window in fullscreen by `aerospace fullscreen` command

%{window-layout}

String. Alias for `%{window-parent-container-layout}`

%{window-parent-container-layout}

String. The layout (`v_tiles`, `h_tiles`, `v_accordion`, `h_accordion`, `floating`) of the window’s parent container.

%{app-bundle-id}

String. Application unique identifier. [Bundle ID](https://developer.apple.com/documentation/appstoreconnectapi/bundle%5Fids)

%{app-name}

String. Application name

%{app-pid}

Number. [UNIX process identifier](https://en.wikipedia.org/wiki/Process%5Fidentifier)

%{app-exec-path}

String. Application executable path

%{app-bundle-path}

String. Application bundle path

%{workspace}

String. Name of the belonging workspace

%{workspace-is-focused}

Boolean. True if the workspace has focus

%{workspace-is-visible}

Boolean. True if the workspace is visible. A workspace can be visible but not focused in a multi-monitor setup

%{workspace-root-container-layout}

String. The layout (`v_tiles`, `h_tiles`, `v_accordion`, `h_accordion`) of the workspace the window belongs to.

%{monitor-id}

1-based Number. Sequential number of the belonging monitor.

%{monitor-appkit-nsscreen-screens-id}

1-based index of the belonging monitor in `NSScreen.screens` array. Useful for integration with other tools that might be using `NSScreen.screens` ordering (like sketchybar).

%{monitor-name}

String. Name of the belonging monitor

%{monitor-is-main}

Boolean. True if the monitor is main.

%{right-padding}

A special variable which expands with a minimum number of spaces required to form a right padding in the appropriate column

%{newline}

Unicode U+000A newline symbol `\n`

%{tab}

Unicode U+0009 tab symbol `\t`

### [](#list-workspaces)[30.8\. list-workspaces](#list-workspaces)

list-workspaces [-h|--help] --monitor <monitor>... [--visible [no]] [--empty [no]] [--format <output-format>] [--count] [--json]
list-workspaces [-h|--help] --all [--format <output-format>] [--count] [--json]
list-workspaces [-h|--help] --focused [--format <output-format>] [--count] [--json]

Print workspaces that satisfy conditions

**OPTIONS**

\-h, --help

Print help

\--format <output-format>

Specify output format. See "Output Format" section for more details

\--all

Alias for `--monitor all`. Please use this option **with caution**. Use it when you really need to get workspaces/windows from **all monitors**.

For multi-monitor setup `--monitor focused` is almost always a preferred option. If you’re automating something then you don’t want to mess up with workspaces/windows on a different monitor.

With great power comes great responsibility.

\--focused

Alias for `--monitor focused --visible`. Always prints a single workspace

\--monitor <monitors>

Filter results to only print workspaces/windows that are attached to specified monitors.`<monitors>` is a space separated list of monitor IDs.

Possible monitors IDs:

1. 1-based index of a monitor as if monitors were ordered horizontally from left to right
2. `all` is a special monitor ID that represents all monitors
3. `mouse` is a special monitor ID that represents monitor with the mouse
4. `focused` is a special monitor ID that represents the focused monitor

\--visible \[no\]

Filter results to only print currently visible workspaces.`[no]` inverts the condition. Several workspaces can be visible in multi-monitor setup

\--empty \[no\]

Filter results to only print empty workspaces.`[no]` inverts the condition.

\--format <output-format>

Specify output format. See "Output Format" section for more details. Incompatible with `--count`

\--count

Output only the number of workspaces. Incompatible with `--format`

\--json

Output in JSON format. Can be used in combination with `--format` to specify which data to include into the json. Incompatible with `--count`

**OUTPUT FORMAT**

Output format can be configured with optional `[--format <output-format>]` option.`<output-format>` supports [string interpolation](https://en.wikipedia.org/wiki/String%5Finterpolation).

If not specified, the default `<output-format>` is:
`%{workspace}`

The following variables can be used inside `<output-format>`:

%{workspace}

String. Name of the belonging workspace

%{workspace-is-focused}

Boolean. True if the workspace has focus

%{workspace-is-visible}

Boolean. True if the workspace is visible. A workspace can be visible but not focused in a multi-monitor setup

%{workspace-root-container-layout}

String. The layout (`v_tiles`, `h_tiles`, `v_accordion`, `h_accordion`) of the workspace’s root container

%{monitor-id}

1-based Number. Sequential number of the belonging monitor

%{monitor-appkit-nsscreen-screens-id}

1-based Number. Sequential number of the belonging monitor in `NSScreen.screens`. Useful for integration with other tools that might be using `NSScreen.screens` ordering (like sketchybar).

%{monitor-name}

String. Name of the belonging monitor

%{monitor-is-main}

Boolean. True if the monitor is main.

%{right-padding}

A special variable which expands with a minimum number of spaces required to form a right padding in the appropriate column

%{newline}

Unicode U+000A newline symbol `\n`

%{tab}

Unicode U+0009 tab symbol `\t`

Last updated 2026-01-02 00:00:11 +0100
