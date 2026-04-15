---
title: "📦 Packages | lazy.nvim"
source_url: "https://lazy.folke.io/packages"
fetched_at: "2026-04-15T06:23:54.371899+00:00"
---



* 📦 Packages

On this page

# 📦 Packages

**lazy.nvim** supports three ways for plugins to define their dependencies and configuration.

* **Lazy**: `lazy.lua` file
* **Rockspec**: [luarocks](https://luarocks.org/) `*-scm-1.rockspec` [file](https://github.com/luarocks/luarocks/wiki/Rockspec-format)
* **Packspec**: `pkg.json` (experimental, since the [format](https://github.com/neovim/packspec/issues/41) is not quite there yet)

You can enable/disable package sources with [`config.pkg.sources`](https://lazy.folke.io/configuration.html).
The order of sources is important, as the first source that finds a package will be used.

info

Package specs are always loaded in the scope of the plugin (using [specs](https://lazy.folke.io/spec.html#advanced)),
so that when the plugin is disabled, none of the specs are loaded.

## Lazy[​](https://lazy.folke.io/packages.html#lazy "Direct link to Lazy")

Using a `lazy.lua` file is the recommended way to define your plugin dependencies and configuration.
Syntax is the same as any plugin spec.

## Rockspec[​](https://lazy.folke.io/packages.html#rockspec "Direct link to Rockspec")

When a plugin contains a `*-1.rockspec` file, **lazy.nvim** will automatically build the rock and its dependencies.

A **rockspec** will only be used if one of the following is true:

* the package does not have a `/lua` directory
* the package has a complex build step
* the package has dependencies (excluding `lua`)

## Packspec[​](https://lazy.folke.io/packages.html#packspec "Direct link to Packspec")

Supports the [pkg.json](https://github.com/nvim-lua/nvim-package-specification/issues/41) format,
with a lazy extension in `lazy`.
`lazy` can contain any valid lazy spec fields. They will be added to the plugin's spec.

[Previous

Versioning](https://lazy.folke.io/spec/versioning.html)[Next

⚙️ Configuration](https://lazy.folke.io/configuration.html)

* [Lazy](https://lazy.folke.io/packages.html#lazy)
* [Rockspec](https://lazy.folke.io/packages.html#rockspec)
* [Packspec](https://lazy.folke.io/packages.html#packspec)
