---
title: "C | C"
source_url: "https://zed.dev/docs/languages/c"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [C](https://zed.dev/docs/languages/c.html#c)

C support is available natively in Zed.

* Tree-sitter: [tree-sitter/tree-sitter-c](https://github.com/tree-sitter/tree-sitter-c)
* Language Server: [clangd/clangd](https://github.com/clangd/clangd)
* Debug Adapter: [CodeLLDB](https://github.com/vadimcn) (primary), [GDB](https://sourceware.org/gdb/) (secondary, not available on Apple silicon)

## [Clangd: Force detect as C](https://zed.dev/docs/languages/c.html#clangd-force-detect-as-c)

Clangd out of the box assumes mixed C++/C projects. If you have a C-only project you may wish to instruct clangd to treat all files as C using the `-xc` flag. To do this, create a `.clangd` file in the root of your project with the following:

```
# yaml-language-server: $schema=https://json.schemastore.org/clangd.json
CompileFlags:
  Add: [-xc]
```

By default clang and gcc will recognize `*.C` and `*.H` (uppercase extensions) as C++ and not C and so Zed too follows this convention. If you are working with a C-only project (perhaps one with legacy uppercase pathing like `FILENAME.C`) you can override this behavior by adding this to your settings:

```
{
  "file_types": {
    "C": ["C", "H"]
  }
}
```

## [Formatting](https://zed.dev/docs/languages/c.html#formatting)

By default Zed will use the `clangd` language server for formatting C code like the `clang-format` CLI tool. To configure this you can add a `.clang-format` file. For example:

```
# yaml-language-server: $schema=https://json.schemastore.org/clang-format-21.x.json
---
BasedOnStyle: GNU
IndentWidth: 2
---
```

See [Clang-Format Style Options](https://clang.llvm.org/docs/ClangFormatStyleOptions.html) for a complete list of options.

You can trigger formatting via `cmd-shift-i|ctrl-shift-i` or the `editor: format` action from the command palette or by enabling format on save.

Configure formatting in Settings (`cmd-,|ctrl-,`) under Languages > C, or add to your settings file:

```
  "languages": {
    "C": {
      "format_on_save": "on",
      "tab_size": 2
    }
  }
```

## [Compile Commands](https://zed.dev/docs/languages/c.html#compile-commands)

For some projects Clangd requires a `compile_commands.json` file to properly analyze your project. This file contains the compilation database that tells clangd how your project should be built.

### [CMake Compile Commands](https://zed.dev/docs/languages/c.html#cmake-compile-commands)

With CMake, you can generate `compile_commands.json` automatically by adding the following line to your `CMakeLists.txt`:

```
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
```

After building your project, CMake will generate the `compile_commands.json` file in the build directory and clangd will automatically pick it up.

## [Debugging](https://zed.dev/docs/languages/c.html#debugging)

You can use CodeLLDB or GDB to debug native binaries. (Make sure that your build process passes `-g` to the C compiler, so that debug information is included in the resulting binary.) See below for examples of debug configurations that you can add to `.zed/debug.json`.

* [CodeLLDB configuration documentation](https://github.com/vadimcn/codelldb/blob/master/MANUAL.md#starting-a-new-debug-session)
* [GDB configuration documentation](https://sourceware.org/gdb/current/onlinedocs/gdb.html/Debugger-Adapter-Protocol.html)

### [Build and Debug Binary](https://zed.dev/docs/languages/c.html#build-and-debug-binary)

```
[
  {
    "label": "Debug native binary",
    "build": {
      "command": "make",
      "args": ["-j8"],
      "cwd": "$ZED_WORKTREE_ROOT"
    },
    "program": "$ZED_WORKTREE_ROOT/build/prog",
    "request": "launch",
    "adapter": "CodeLLDB"
  }
]
```

[Biome](https://zed.dev/docs/languages/biome.html "Biome")
[C++](https://zed.dev/docs/languages/cpp.html "C++")
