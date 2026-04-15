---
title: "Upgrading Vite+ | The Unified Toolchain for the Web"
source_url: "https://viteplus.dev/guide/upgrade"
fetched_at: "2026-03-31T02:50:28.336963+00:00"
---



# Upgrading Vite+ [​](https://viteplus.dev/guide/upgrade.html#upgrading-vite)

Use `vp upgrade` to update the global `vp` binary, and use Vite+'s package management commands to update the local `vite-plus` package in a project.

## Overview [​](https://viteplus.dev/guide/upgrade.html#overview)

There are two parts to upgrading Vite+:

* The global `vp` command installed on your machine
* The local `vite-plus` package used by an individual project

You can upgrade both of them independently.

## Global `vp` [​](https://viteplus.dev/guide/upgrade.html#global-vp)

bash

```
vp upgrade
```

## Local `vite-plus` [​](https://viteplus.dev/guide/upgrade.html#local-vite-plus)

Update the project dependency with the package manager commands in Vite+:

bash

```
vp update vite-plus
```

You can also use `vp add vite-plus@latest` if you want to move the dependency explicitly to the latest version.
