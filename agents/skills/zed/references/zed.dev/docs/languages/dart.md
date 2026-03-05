---
title: "Dart | Dart"
source_url: "https://zed.dev/docs/languages/dart"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Dart](https://zed.dev/docs/languages/dart.html#dart)

Dart support is available through the [Dart extension](https://github.com/zed-extensions/dart).

* Tree-sitter: [UserNobody14/tree-sitter-dart](https://github.com/UserNobody14/tree-sitter-dart)
* Language Server: [dart language-server](https://github.com/dart-lang/sdk)

## [Pre-requisites](https://zed.dev/docs/languages/dart.html#pre-requisites)

You will need to install the Dart SDK.

You can install dart from [dart.dev/get-dart](https://dart.dev/get-dart) or via the [Flutter Version Management CLI (fvm)](https://fvm.app/documentation/getting-started/installation)

## [Configuration](https://zed.dev/docs/languages/dart.html#configuration)

The dart extension requires no configuration if you have `dart` in your path:

```
which dart
dart --version
```

If you would like to use a specific dart binary or use dart via FVM you can specify the `dart` binary in your Zed settings.jsons file:

```
{
  "lsp": {
    "dart": {
      "binary": {
        "path": "/opt/homebrew/bin/fvm",
        "arguments": ["dart", "language-server", "--protocol=lsp"]
      }
    }
  }
}
```

### [Formatting](https://zed.dev/docs/languages/dart.html#formatting)

Dart by-default uses a very conservative maximum line length (80). If you would like the dart LSP to permit a longer line length when auto-formatting, add the following to your Zed settings.json:

```
{
  "lsp": {
    "dart": {
      "settings": {
        "lineLength": 140
      }
    }
  }
}
```

Please see the Dart documentation for more information on [dart language-server capabilities](https://github.com/dart-lang/sdk/blob/main/pkg/analysis_server/tool/lsp_spec/README.md).

[CSS](https://zed.dev/docs/languages/css.html "CSS")
[Deno](https://zed.dev/docs/languages/deno.html "Deno")
