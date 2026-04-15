---
title: "🔒 Lockfile | lazy.nvim"
source_url: "https://lazy.folke.io/usage/lockfile"
fetched_at: "2026-04-15T06:23:54.371899+00:00"
---



* [🚀 Usage](https://lazy.folke.io/usage.html)
* 🔒 Lockfile

# 🔒 Lockfile

After every **update**, the local lockfile (`lazy-lock.json`) is updated with the installed revisions.
It is recommended to have this file under version control.

If you use your Neovim config on multiple machines, using the lockfile, you can
ensure that the same version of every plugin is installed.

If you are on another machine, you can do `:Lazy restore`, to update all your plugins to
the version from the lockfile.

[Previous

🚀 Usage](https://lazy.folke.io/usage.html)[Next

📦 Migration Guide](https://lazy.folke.io/usage/migration.html)
