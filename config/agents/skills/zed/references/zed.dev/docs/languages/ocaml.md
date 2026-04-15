---
title: "OCaml | OCaml"
source_url: "https://zed.dev/docs/languages/ocaml"
fetched_at: "2026-03-05T02:24:06.365855+00:00"
---



# [OCaml](https://zed.dev/docs/languages/ocaml.html#ocaml)

OCaml support is available through the [OCaml extension](https://github.com/zed-extensions/ocaml).

* Tree-sitter: [tree-sitter/tree-sitter-ocaml](https://github.com/tree-sitter/tree-sitter-ocaml)
* Language Server: [ocaml/ocaml-lsp](https://github.com/ocaml/ocaml-lsp)

## [Setup Instructions](https://zed.dev/docs/languages/ocaml.html#setup-instructions)

If you have the development environment already setup, you can skip to [Launching Zed](https://zed.dev/docs/languages/ocaml.html#launching-zed)

### [Using Opam](https://zed.dev/docs/languages/ocaml.html#using-opam)

Opam is the official package manager for OCaml and is highly recommended for getting started with OCaml. To get started using Opam, please follow the instructions provided [here](https://ocaml.org/install).

Once you install opam and setup a switch with your development environment as per the instructions, you can proceed.

### [Launching Zed](https://zed.dev/docs/languages/ocaml.html#launching-zed)

By now you should have `ocamllsp` installed, you can verify so by running

```
ocamllsp --help
```

in your terminal. If you get a help message, you're good to go. If not, please revisit the installation instructions for `ocamllsp` and ensure it's properly installed.

With that aside, we can now launch Zed. Given how the OCaml package manager works, we require you to run Zed from the terminal, so please make sure you install the [Zed cli](https://zed.dev/features#cli) if you haven't already.

Once you have the cli, simply from a terminal, navigate to your project and run

```
zed .
```

You should now have Zed running with OCaml support, with no additional setup required.

[Nim](https://zed.dev/docs/languages/nim.html "Nim")
[OpenTofu](https://zed.dev/docs/languages/opentofu.html "OpenTofu")
