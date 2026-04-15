---
title: "🛠️ Installation | lazy.nvim"
source_url: "https://lazy.folke.io/installation"
fetched_at: "2026-04-15T06:23:54.371899+00:00"
---



* 🛠️ Installation

# 🛠️ Installation

There are multiple ways to install **lazy.nvim**.
The **Structured Setup** is the recommended way, but you can also use the **Single File Setup**
if you prefer to keep everything in your `init.lua`.

Please refer to the [Configuration](https://lazy.folke.io/configuration.html) section for an overview of all available options.

tip

It is recommended to run `:checkhealth lazy` after installation.

note

In what follows `~/.config/nvim` is your Neovim configuration directory.
On Windows, this is usually `~\AppData\Local\nvim`.
To know the correct path for your system, run `:echo stdpath('config')`.

* Structured Setup
* Single File Setup

~/.config/nvim/init.lua

```
require("config.lazy")
```

~/.config/nvim/lua/config/lazy.lua

```
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
```

You can then create your plugin specs in `~/.config/nvim/lua/plugins/`.
Each file should return a table with the plugins you want to install.

For more info see [Structuring Your Plugins](https://lazy.folke.io/usage/structuring.html)

```
~/.config/nvim
├── lua
│   ├── config
│   │   └── lazy.lua
│   └── plugins
│       ├── spec1.lua
│       ├── **
│       └── spec2.lua
└── init.lua
```

~/.config/nvim/init.lua

```
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
```

[Previous

🚀 Getting Started](https://lazy.folke.io/index.html)[Next

🔌 Plugin Spec](https://lazy.folke.io/spec.html)
