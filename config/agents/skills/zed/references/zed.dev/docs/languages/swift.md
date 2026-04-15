---
title: "Swift | Swift"
source_url: "https://zed.dev/docs/languages/swift"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [Swift](https://zed.dev/docs/languages/swift.html#swift)

Swift language support in Zed is provided by the community-maintained [Swift extension](https://github.com/zed-extensions/swift).
Report issues to: <https://github.com/zed-extensions/swift/issues>

* Tree-sitter: [alex-pinkus/tree-sitter-swift](https://github.com/alex-pinkus/tree-sitter-swift)
* Language Server: [swiftlang/sourcekit-lsp](https://github.com/swiftlang/sourcekit-lsp)
* Debug Adapter: [`lldb-dap`](https://github.com/swiftlang/llvm-project/blob/next/lldb/tools/lldb-dap/README.md)

## [Language Server Configuration](https://zed.dev/docs/languages/swift.html#language-server-configuration)

You can modify the behavior of SourceKit LSP by creating a `.sourcekit-lsp/config.json` under your home directory or in your project root. See [SourceKit-LSP configuration file](https://github.com/swiftlang/sourcekit-lsp/blob/main/Documentation/Configuration%20File.md) for complete documentation.

## [Debugging](https://zed.dev/docs/languages/swift.html#debugging)

The Swift extension provides a debug adapter for debugging Swift code.
Zed's name for the adapter (in the UI and `debug.json`) is `Swift`, and under the hood it uses [`lldb-dap`](https://github.com/swiftlang/llvm-project/blob/next/lldb/tools/lldb-dap/README.md), as provided by the Swift toolchain.
The extension tries to find an `lldb-dap` binary using `swiftly`, using `xcrun`, and by searching `$PATH`, in that order of preference.
The extension doesn't attempt to download `lldb-dap` if it's not found.

* [lldb-dap configuration documentation](https://github.com/llvm/llvm-project/blob/main/lldb/tools/lldb-dap/README.md#configuration-settings-reference)

### [Examples](https://zed.dev/docs/languages/swift.html#examples)

#### [Build and debug a Swift binary](https://zed.dev/docs/languages/swift.html#build-and-debug-a-swift-binary)

```
[
  {
    "label": "Debug Swift",
    "build": {
      "command": "swift",
      "args": ["build"]
    },
    "program": "$ZED_WORKTREE_ROOT/swift-app/.build/arm64-apple-macosx/debug/swift-app",
    "request": "launch",
    "adapter": "Swift"
  }
]
```

[Svelte](https://zed.dev/docs/languages/svelte.html "Svelte")
[Tailwind CSS](https://zed.dev/docs/languages/tailwindcss.html "Tailwind CSS")
