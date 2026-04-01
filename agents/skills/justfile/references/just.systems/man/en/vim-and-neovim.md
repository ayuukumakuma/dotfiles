---
title: "Vim and Neovim - Just Programmer's Manual"
source_url: "https://just.systems/man/en/vim-and-neovim"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Vim and Neovim](https://just.systems/man/en/vim-and-neovim.html#vim-and-neovim)

Vim version 9.1.1042 or better and Neovim version 0.11 or better support
Justfile syntax highlighting out of the box, thanks to
[pbnj](https://github.com/pbnj).

#### [`vim-just`](https://just.systems/man/en/vim-and-neovim.html#vim-just)

The [vim-just](https://github.com/NoahTheDuke/vim-just) plugin provides syntax
highlighting for `justfile`s.

Install it with your favorite package manager, like
[Plug](https://github.com/junegunn/vim-plug):

```
call plug#begin()

Plug 'NoahTheDuke/vim-just'

call plug#end()
```

Or with Vim’s built-in package support:

```
mkdir -p ~/.vim/pack/vendor/start
cd ~/.vim/pack/vendor/start
git clone https://github.com/NoahTheDuke/vim-just.git
```

#### [`tree-sitter-just`](https://just.systems/man/en/vim-and-neovim.html#tree-sitter-just)

[tree-sitter-just](https://github.com/IndianBoy42/tree-sitter-just) is an
[Nvim Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) plugin
for Neovim.

#### [Makefile Syntax Highlighting](https://just.systems/man/en/vim-and-neovim.html#makefile-syntax-highlighting)

Vim’s built-in makefile syntax highlighting isn’t perfect for `justfile`s, but
it’s better than nothing. You can put the following in `~/.vim/filetype.vim`:

```
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  au BufNewFile,BufRead justfile setf make
augroup END
```

Or add the following to an individual `justfile` to enable `make` mode on a
per-file basis:

```
# vim: set ft=make :
```
