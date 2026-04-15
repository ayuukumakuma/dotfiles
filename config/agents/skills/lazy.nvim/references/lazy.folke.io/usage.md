---
title: "🚀 Usage | lazy.nvim"
source_url: "https://lazy.folke.io/usage"
fetched_at: "2026-04-15T06:23:54.371899+00:00"
---



* 🚀 Usage

On this page

# 🚀 Usage

## ▶️ Startup Sequence[​](https://lazy.folke.io/usage.html#️-startup-sequence "Direct link to ▶️ Startup Sequence")

**lazy.nvim** does **NOT** use Neovim packages and even disables plugin loading
completely (`vim.go.loadplugins = false`). It takes over the complete
startup sequence for more flexibility and better performance.

In practice this means that step 10 of [Neovim Initialization](https://neovim.io/doc/user/starting.html#_initialization) is done by Lazy:

1. All the plugins' `init()` functions are executed
2. All plugins with `lazy=false` are loaded. This includes sourcing `/plugin` and `/ftdetect` files. (`/after` will not be sourced yet)
3. All files from `/plugin` and `/ftdetect` directories in your rtp are sourced (excluding `/after`)
4. All `/after/plugin` files are sourced (this includes `/after` from plugins)

Files from runtime directories are always sourced in alphabetical order.

## 🚀 Commands[​](https://lazy.folke.io/usage.html#-commands "Direct link to 🚀 Commands")

Plugins are managed with the `:Lazy` command.
Open the help with `<?>` to see all the key mappings.

You can press `<CR>` on a plugin to show its details. Most properties
can be hovered with `<K>` to open links, help files, readmes,
git commits and git issues.

Lazy can automatically check for updates in the background. This feature
can be enabled with `config.checker.enabled = true`.

Any operation can be started from the UI, with a sub command or an API function:

| Command | Lua | Description |
| --- | --- | --- |
| `:Lazy build {plugins}` | `require("lazy").build(opts)` | Rebuild a plugin |
| `:Lazy check [plugins]` | `require("lazy").check(opts?)` | Check for updates and show the log (git fetch) |
| `:Lazy clean [plugins]` | `require("lazy").clean(opts?)` | Clean plugins that are no longer needed |
| `:Lazy clear` | `require("lazy").clear()` | Clear finished tasks |
| `:Lazy debug` | `require("lazy").debug()` | Show debug information |
| `:Lazy health` | `require("lazy").health()` | Run `:checkhealth lazy` |
| `:Lazy help` | `require("lazy").help()` | Toggle this help page |
| `:Lazy home` | `require("lazy").home()` | Go back to plugin list |
| `:Lazy install [plugins]` | `require("lazy").install(opts?)` | Install missing plugins |
| `:Lazy load {plugins}` | `require("lazy").load(opts)` | Load a plugin that has not been loaded yet. Similar to `:packadd`. Like `:Lazy load foo.nvim`. Use `:Lazy! load` to skip `cond` checks. |
| `:Lazy log [plugins]` | `require("lazy").log(opts?)` | Show recent updates |
| `:Lazy profile` | `require("lazy").profile()` | Show detailed profiling |
| `:Lazy reload {plugins}` | `require("lazy").reload(opts)` | Reload a plugin (experimental!!) |
| `:Lazy restore [plugins]` | `require("lazy").restore(opts?)` | Updates all plugins to the state in the lockfile. For a single plugin: restore it to the state in the lockfile or to a given commit under the cursor |
| `:Lazy sync [plugins]` | `require("lazy").sync(opts?)` | Run install, clean and update |
| `:Lazy update [plugins]` | `require("lazy").update(opts?)` | Update plugins. This will also update the lockfile |

Any command can have a **bang** to make the command wait till it finished. For example,
if you want to sync lazy from the cmdline, you can use:

```
nvim --headless "+Lazy! sync" +qa
```

`opts` is a table with the following key-values:

* **wait**: when true, then the call will wait till the operation completed
* **show**: when false, the UI will not be shown
* **plugins**: a list of plugin names to run the operation on
* **concurrency**: limit the `number` of concurrently running tasks

Stats API (`require("lazy").stats()`):

```
{
  -- startuptime in milliseconds till UIEnter
  startuptime = 0,
  -- when true, startuptime is the accurate cputime for the Neovim process. (Linux & macOS)
  -- this is more accurate than `nvim --startuptime`, and as such will be slightly higher
  -- when false, startuptime is calculated based on a delta with a timestamp when lazy started.
  real_cputime = false,
  count = 0, -- total number of plugins
  loaded = 0, -- number of loaded plugins
  ---@type table<string, number>
  times = {},
}
```

**lazy.nvim** provides a statusline component that you can use to show the number of pending updates.
Make sure to enable `config.checker.enabled = true` to make this work.

Example of configuring [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

```
require("lualine").setup({
  sections = {
    lualine_x = {
      {
        require("lazy.status").updates,
        cond = require("lazy.status").has_updates,
        color = { fg = "#ff9e64" },
      },
    },
  },
})
```

## 📆 User Events[​](https://lazy.folke.io/usage.html#-user-events "Direct link to 📆 User Events")

The following user events will be triggered:

* **LazyDone**: when lazy has finished starting up and loaded your config
* **LazySync**: after running sync
* **LazyInstall**: after an install
* **LazyUpdate**: after an update
* **LazyClean**: after a clean
* **LazyCheck**: after checking for updates
* **LazyLog**: after running log
* **LazyLoad**: after loading a plugin. The `data` attribute will contain the plugin name.
* **LazySyncPre**: before running sync
* **LazyInstallPre**: before an install
* **LazyUpdatePre**: before an update
* **LazyCleanPre**: before a clean
* **LazyCheckPre**: before checking for updates
* **LazyLogPre**: before running log
* **LazyReload**: triggered by change detection after reloading plugin specs
* **VeryLazy**: triggered after `LazyDone` and processing `VimEnter` auto commands
* **LazyVimStarted**: triggered after `UIEnter` when `require("lazy").stats().startuptime` has been calculated.
  Useful to update the startuptime on your dashboard.

## ❌ Uninstalling[​](https://lazy.folke.io/usage.html#-uninstalling "Direct link to ❌ Uninstalling")

To uninstall **lazy.nvim**, you need to remove the following files and directories:

* **data**: `~/.local/share/nvim/lazy`
* **state**: `~/.local/state/nvim/lazy`
* **lockfile**: `~/.config/nvim/lazy-lock.json`

> Paths can differ if you changed `XDG` environment variables.

[Previous

🌈 Highlight Groups](https://lazy.folke.io/configuration/highlights.html)[Next

🔒 Lockfile](https://lazy.folke.io/usage/lockfile.html)

* [▶️ Startup Sequence](https://lazy.folke.io/usage.html#️-startup-sequence)
* [🚀 Commands](https://lazy.folke.io/usage.html#-commands)
* [📆 User Events](https://lazy.folke.io/usage.html#-user-events)
* [❌ Uninstalling](https://lazy.folke.io/usage.html#-uninstalling)
