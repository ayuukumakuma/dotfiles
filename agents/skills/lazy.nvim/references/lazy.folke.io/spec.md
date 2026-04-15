---
title: "🔌 Plugin Spec | lazy.nvim"
source_url: "https://lazy.folke.io/spec"
fetched_at: "2026-04-15T06:23:54.371899+00:00"
---



* 🔌 Plugin Spec

On this page

# 🔌 Plugin Spec

## Spec Source[​](https://lazy.folke.io/spec.html#spec-source "Direct link to Spec Source")

| Property | Type | Description |
| --- | --- | --- |
| **[1]** | `string?` | Short plugin url. Will be expanded using [`config.git.url_format`](https://lazy.folke.io/configuration.html). Can also be a `url` or `dir`. |
| **dir** | `string?` | A directory pointing to a local plugin |
| **url** | `string?` | A custom git url where the plugin is hosted |
| **name** | `string?` | A custom name for the plugin used for the local plugin directory and as the display name |
| **dev** | `boolean?` | When `true`, a local plugin directory will be used instead. See [`config.dev`](https://lazy.folke.io/configuration.html) |

A valid spec should define one of `[1]`, `dir` or `url`.

## Spec Loading[​](https://lazy.folke.io/spec.html#spec-loading "Direct link to Spec Loading")

| Property | Type | Description |
| --- | --- | --- |
| **dependencies** | `LazySpec[]` | A list of plugin names or plugin specs that should be loaded when the plugin loads. Dependencies are always lazy-loaded unless specified otherwise. When specifying a name, make sure the plugin spec has been defined somewhere else. |
| **enabled** | `boolean?` or `fun():boolean` | When `false`, or if the `function` returns false, then this plugin will not be included in the spec |
| **cond** | `boolean?` or `fun(LazyPlugin):boolean` | Behaves the same as `enabled`, but won't uninstall the plugin when the condition is `false`. Useful to disable some plugins in vscode, or firenvim for example. |
| **priority** | `number?` | Only useful for **start** plugins (`lazy=false`) to force loading certain plugins first. Default priority is `50`. It's recommended to set this to a high number for colorschemes. |

## Spec Setup[​](https://lazy.folke.io/spec.html#spec-setup "Direct link to Spec Setup")

| Property | Type | Description |
| --- | --- | --- |
| **init** | `fun(LazyPlugin)` | `init` functions are always executed during startup. Mostly useful for setting `vim.g.*` configuration used by **Vim** plugins startup |
| **opts** | `table` or `fun(LazyPlugin, opts:table)` | `opts` should be a table (will be merged with parent specs), return a table (replaces parent specs) or should change a table. The table will be passed to the `Plugin.config()` function. Setting this value will imply `Plugin.config()` |
| **config** | `fun(LazyPlugin, opts:table)` or `true` | `config` is executed when the plugin loads. The default implementation will automatically run `require(MAIN).setup(opts)` if `opts` or `config = true` is set. Lazy uses several heuristics to determine the plugin's `MAIN` module automatically based on the plugin's **name**. *(`opts` is the recommended way to configure plugins)*. |
| **main** | `string?` | You can specify the `main` module to use for `config()` and `opts()`, in case it can not be determined automatically. See `config()` |
| **build** | `fun(LazyPlugin)` or `string` or `false` or a list of build commands | `build` is executed when a plugin is installed or updated. See [Building](https://lazy.folke.io/developers.html#building) for more information. |

Always use `opts` instead of `config` when possible. `config` is almost never needed.

GOOD

```
{ "folke/todo-comments.nvim", opts = {} },
```

BAD

```
{
  "folke/todo-comments.nvim",
  config = function()
    require("todo-comments").setup({})
  end,
},
```

## Spec Lazy Loading[​](https://lazy.folke.io/spec.html#spec-lazy-loading "Direct link to Spec Lazy Loading")

| Property | Type | Description |
| --- | --- | --- |
| **lazy** | `boolean?` | When `true`, the plugin will only be loaded when needed. Lazy-loaded plugins are automatically loaded when their Lua modules are `required`, or when one of the lazy-loading handlers triggers |
| **event** | `string?` or `string[]` or `fun(self:LazyPlugin, event:string[]):string[]` or `{event:string[]|string, pattern?:string[]|string}` | Lazy-load on event. Events can be specified as `BufEnter` or with a pattern like `BufEnter *.lua` |
| **cmd** | `string?` or `string[]` or `fun(self:LazyPlugin, cmd:string[]):string[]` | Lazy-load on command |
| **ft** | `string?` or `string[]` or `fun(self:LazyPlugin, ft:string[]):string[]` | Lazy-load on filetype |
| **keys** | `string?` or `string[]` or `LazyKeysSpec[]` or `fun(self:LazyPlugin, keys:string[]):(string | LazyKeysSpec)[]` | Lazy-load on [key mapping](https://lazy.folke.io/spec/lazy_loading.html#%EF%B8%8F-lazy-key-mappings) |

Refer to the [Lazy Loading](https://lazy.folke.io/spec/lazy_loading.html) section for more information.

## Spec Versioning[​](https://lazy.folke.io/spec.html#spec-versioning "Direct link to Spec Versioning")

| Property | Type | Description |
| --- | --- | --- |
| **branch** | `string?` | Branch of the repository |
| **tag** | `string?` | Tag of the repository |
| **commit** | `string?` | Commit of the repository |
| **version** | `string?` or `false` to override the default | Version to use from the repository. Full [Semver](https://devhints.io/semver) ranges are supported |
| **pin** | `boolean?` | When `true`, this plugin will not be included in updates |
| **submodules** | `boolean?` | When false, git submodules will not be fetched. Defaults to `true` |

Refer to the [Versioning](https://lazy.folke.io/spec/versioning.html) section for more information.

## Spec Advanced[​](https://lazy.folke.io/spec.html#spec-advanced "Direct link to Spec Advanced")

| Property | Type | Description |
| --- | --- | --- |
| **optional** | `boolean?` | When a spec is tagged optional, it will only be included in the final spec, when the same plugin has been specified at least once somewhere else without `optional`. This is mainly useful for Neovim distros, to allow setting options on plugins that may/may not be part of the user's plugins. |
| **specs** | `LazySpec` | A list of plugin specs defined in the scope of the plugin. This is mainly useful for Neovim distros, to allow setting options on plugins that may/may not be part of the user's plugins. When the plugin is disabled, none of the scoped specs will be included in the final spec. Similar to `dependencies` without the automatic loading of the specs. |
| **module** | `false?` | Do not automatically load this Lua module when it's required somewhere |
| **import** | `string?` | Import the given spec module. |

[Previous

🛠️ Installation](https://lazy.folke.io/installation.html)[Next

Examples](https://lazy.folke.io/spec/examples.html)

* [Spec Source](https://lazy.folke.io/spec.html#spec-source)
* [Spec Loading](https://lazy.folke.io/spec.html#spec-loading)
* [Spec Setup](https://lazy.folke.io/spec.html#spec-setup)
* [Spec Lazy Loading](https://lazy.folke.io/spec.html#spec-lazy-loading)
* [Spec Versioning](https://lazy.folke.io/spec.html#spec-versioning)
* [Spec Advanced](https://lazy.folke.io/spec.html#spec-advanced)
