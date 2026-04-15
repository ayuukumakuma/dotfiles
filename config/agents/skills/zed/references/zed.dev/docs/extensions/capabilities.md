---
title: "Extension Capabilities | Extension Capabilities"
source_url: "https://zed.dev/docs/extensions/capabilities"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Extension Capabilities](https://zed.dev/docs/extensions/capabilities.html#extension-capabilities)

The operations that Zed extensions are able to perform are governed by a capability system.

## [Restricting capabilities](https://zed.dev/docs/extensions/capabilities.html#restricting-capabilities)

As a user, you have the option of restricting the capabilities that are granted to extensions.

This is controlled via the `granted_extension_capabilities` setting.

Restricting or removing a capability will cause an error to be returned when an extension attempts to call the corresponding extension API without sufficient capabilities.

For example, to restrict downloads to files from GitHub, set `host` for the `download_file` capability:

```
{
  "granted_extension_capabilities": [
    { "kind": "process:exec", "command": "*", "args": ["**"] },
-   { "kind": "download_file", "host": "*", "path": ["**"] },
+   { "kind": "download_file", "host": "github.com", "path": ["**"] },
    { "kind": "npm:install", "package": "*" }
  ]
}
```

If you don't want extensions to be able to perform *any* capabilities, you can remove all granted capabilities:

```
{
  "granted_extension_capabilities": []
}
```

> Note that this will likely make many extensions non-functional, at least in their default configuration.

## [Capabilities](https://zed.dev/docs/extensions/capabilities.html#capabilities)

### [`process:exec`](https://zed.dev/docs/extensions/capabilities.html#processexec)

The `process:exec` capability grants extensions the ability to invoke commands using [`zed_extension_api::process::Command`](https://docs.rs/zed_extension_api/latest/zed_extension_api/process/struct.Command.html).

#### [Examples](https://zed.dev/docs/extensions/capabilities.html#examples)

To allow any command to be executed with any arguments:

```
{ kind = "process:exec", command = "*", args = ["**"] }
```

To allow a specific command (e.g., `gem`) to be executed with any arguments:

```
{ kind = "process:exec", command = "gem", args = ["**"] }
```

### [`download_file`](https://zed.dev/docs/extensions/capabilities.html#download_file)

The `download_file` capability grants extensions the ability to download files using [`zed_extension_api::download_file`](https://docs.rs/zed_extension_api/latest/zed_extension_api/fn.download_file.html).

#### [Examples](https://zed.dev/docs/extensions/capabilities.html#examples-1)

To allow any file to be downloaded:

```
{ kind = "download_file", host = "*", path = ["**"] }
```

To allow any file to be downloaded from `github.com`:

```
{ kind = "download_file", host = "github.com", path = ["**"] }
```

To allow any file to be downloaded from a specific GitHub repository:

```
{ kind = "download_file", host = "github.com", path = ["zed-industries", "zed", "**"] }
```

### [`npm:install`](https://zed.dev/docs/extensions/capabilities.html#npminstall)

The `npm:install` capability grants extensions the ability to install npm packages using [`zed_extension_api::npm_install_package`](https://docs.rs/zed_extension_api/latest/zed_extension_api/fn.npm_install_package.html).

#### [Examples](https://zed.dev/docs/extensions/capabilities.html#examples-2)

To allow any npm package to be installed:

```
{ kind = "npm:install", package = "*" }
```

To allow a specific npm package (e.g., `typescript`) to be installed:

```
{ kind = "npm:install", package = "typescript" }
```

[Developing Extensions](https://zed.dev/docs/extensions/developing-extensions.html "Developing Extensions")
[Language Extensions](https://zed.dev/docs/extensions/languages.html "Language Extensions")
