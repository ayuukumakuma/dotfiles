---
title: "🔥 Developers | lazy.nvim"
source_url: "https://lazy.folke.io/developers"
fetched_at: "2026-04-15T06:23:54.371899+00:00"
---



* 🔥 Developers

On this page

# 🔥 Developers

To make it easier for users to install your plugin, you can include a [package spec](https://lazy.folke.io/packages.html) in your repo.

## Best Practices[​](https://lazy.folke.io/developers.html#best-practices "Direct link to Best Practices")

* If your plugin needs `setup()`, then create a simple `lazy.lua` file like this:

  ```
    return { "me/my-plugin", opts = {} }
  ```
* Plugins that are pure lua libraries should be lazy-loaded with `lazy = true`.

  ```
  { "nvim-lua/plenary.nvim", lazy = true }
  ```
* Always use `opts` instead of `config` when possible. `config` is almost never needed.

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
* Only use `dependencies` if a plugin needs the dep to be installed **AND** loaded.
  Lua plugins/libraries are automatically loaded when they are `require()`d,
  so they don't need to be in `dependencies`.

  GOOD

  ```
  { "folke/todo-comments.nvim", opts = {} },
  { "nvim-lua/plenary.nvim", lazy = true },
  ```

  BAD

  ```
  {
    "folke/todo-comments.nvim",
    opts = {},
    -- This will always load plenary as soon as todo-comments loads,
    -- even when todo-comments doesn't use it.
    dependencies = { "nvim-lua/plenary.nvim", lazy = true },
  },
  ```
* Inside a `build` function or `*.lua` build file, use `coroutine.yield(msg:string|LazyMsg)` to show progress.
* Don't change the `cwd` in your build function, since builds run in parallel and changing the `cwd` will affect other builds.

## Building[​](https://lazy.folke.io/developers.html#building "Direct link to Building")

The spec **build** property can be one of the following:

* `fun(plugin: LazyPlugin)`: a function that builds the plugin.
* `*.lua`: a Lua file that builds the plugin (like `build.lua`)
* `":Command"`: a Neovim command
* `"rockspec"`: this will run `luarocks make` in the plugin's directory
  This is automatically set by the `rockspec` [package](https://lazy.folke.io/packages.html) source.
* any other **string** will be run as a shell command
* a `list` of any of the above to run multiple build steps
* if no `build` is specified, but a `build.lua` file exists, that will be used instead.

Build functions and `*.lua` files run asynchronously in a coroutine.
Use `coroutine.yield(msg:string|LazyMsg)` to show progress.

Yielding will also schedule the next `coroutine.resume()` to run in the next tick, so you can do long-running tasks without blocking Neovim.

```
---@class LazyMsg
---@field msg string
---@field level? number vim.log.levels.XXX
```

Use `vim.log.levels.TRACE` to only show the message as a **status** message for the task.

tip

If you need to know the directory of your build lua file, you can use:

```
local dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")
```

## Minit (Minimal Init)[​](https://lazy.folke.io/developers.html#minit-minimal-init "Direct link to Minit (Minimal Init)")

**lazy.nvim** comes with some built-in functionality to help you create a minimal init for your plugin.

I mainly use this for testing and for users to create a `repro.lua`.

When running in **headless** mode, **lazy.nvim** will log any messages to the terminal.
See `opts.headless` for more info.

**minit** will install/load all your specs and will always run an update as well.

### Bootstrap[​](https://lazy.folke.io/developers.html#bootstrap "Direct link to Bootstrap")

```
-- setting this env will override all XDG paths
vim.env.LAZY_STDPATH = ".tests"
-- this will install lazy in your stdpath
load(vim.fn.system("curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"))()
```

### Testing with Busted[​](https://lazy.folke.io/developers.html#testing-with-busted "Direct link to Testing with Busted")

This will add `"lunarmodules/busted"`, configure `hererocks` and run `busted`.

Below is an example of how I use **minit** to run tests with [busted](https://olivinelabs.com/busted/)
in **LazyVim**.

tests/busted.lua

```
#!/usr/bin/env -S nvim -l

vim.env.LAZY_STDPATH = ".tests"
load(vim.fn.system("curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"))()

-- Setup lazy.nvim
require("lazy.minit").busted({
  spec = {
    "LazyVim/starter",
    "williamboman/mason-lspconfig.nvim",
    "williamboman/mason.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
})
```

To use this, you can run:

```
nvim -l ./tests/busted.lua tests
```

If you want to inspect the test environment, run:

```
nvim -u ./tests/busted.lua
```

### `repro.lua`[​](https://lazy.folke.io/developers.html#reprolua "Direct link to reprolua")

repro.lua

```
vim.env.LAZY_STDPATH = ".repro"
load(vim.fn.system("curl -s https://raw.githubusercontent.com/folke/lazy.nvim/main/bootstrap.lua"))()

require("lazy.minit").repro({
  spec = {
    "stevearc/conform.nvim",
    "nvim-neotest/nvim-nio",
  },
})

-- do anything else you need to do to reproduce the issue
```

Then run it with:

```
nvim -u repro.lua
```

[Previous

📂 Structuring Your Plugins](https://lazy.folke.io/usage/structuring.html)[Next

📰 What's new?](https://lazy.folke.io/news.html)

* [Best Practices](https://lazy.folke.io/developers.html#best-practices)
* [Building](https://lazy.folke.io/developers.html#building)
* [Minit (Minimal Init)](https://lazy.folke.io/developers.html#minit-minimal-init)
  + [Bootstrap](https://lazy.folke.io/developers.html#bootstrap)
  + [Testing with Busted](https://lazy.folke.io/developers.html#testing-with-busted)
  + [`repro.lua`](https://lazy.folke.io/developers.html#reprolua)
