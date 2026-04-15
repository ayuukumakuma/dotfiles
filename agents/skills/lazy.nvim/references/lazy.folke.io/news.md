---
title: "📰 What's new? | lazy.nvim"
source_url: "https://lazy.folke.io/news"
fetched_at: "2026-04-15T06:23:54.371899+00:00"
---



* 📰 What's new?

On this page

# 📰 What's new?

## 11.x[​](https://lazy.folke.io/news.html#11x "Direct link to 11.x")

* **New Website**: There's a whole new website with a fresh look and improved documentation.
  Check it out at [https://lazy.folke.io](https://lazy.folke.io/index.html).
  The GitHub `README.md` has been updated to point to the new website.
  The `vimdoc` contains all the information that is available on the website.
* **Spec Resolution & Merging**: the code that resolves a final spec from a plugin's fragments has been rewritten.
  This should be a tiny bit faster, but more importantly, fixes some issues and is easier to maintain.
* [Packages](https://lazy.folke.io/packages.html) can now specify their dependencies and configuration using one of:

  + **Lazy**: `lazy.lua` file
  + **Rockspec**: [luarocks](https://luarocks.org/) `*-scm-1.rockspec` [file](https://github.com/luarocks/luarocks/wiki/Rockspec-format)
  + **Packspec**: `pkg.json` (experimental, since the [format](https://github.com/neovim/packspec/issues/41) is not quite there yet)

  Related *lazy.nvim* options:

  ```
  {
    pkg = {
      enabled = true,
      cache = vim.fn.stdpath("state") .. "/lazy/pkg-cache.lua",
      -- the first package source that is found for a plugin will be used.
      sources = {
        "lazy",
        "rockspec", -- will only be used when rocks.enabled is true
        "packspec",
      },
    },
    rocks = {
      enabled = true,
      root = vim.fn.stdpath("data") .. "/lazy-rocks",
      server = "https://nvim-neorocks.github.io/rocks-binaries/",
    },
  }
  ```
* Installing [neorg](https://github.com/nvim-neorg/neorg) is now as simple as:

  ```
  { "nvim-neorg/neorg", opts = {} }
  ```
* Packages are not limited to just Neovim plugins. You can install any **luarocks** package, like:

  ```
  { "https://github.com/lubyk/yaml" }
  ```

  Luarocks packages without a `/lua` directory are never lazy-loaded, since it's just a library.
* `build` functions or `*.lua` build files (like `build.lua`) now run asynchronously.
  You can use `coroutine.yield(status_msg)` to show progress.
  Yielding will also schedule the next `resume` to run in the next tick,
  so you can do long-running tasks without blocking Neovim.

[Previous

🔥 Developers](https://lazy.folke.io/developers.html)

* [11.x](https://lazy.folke.io/news.html#11x)
