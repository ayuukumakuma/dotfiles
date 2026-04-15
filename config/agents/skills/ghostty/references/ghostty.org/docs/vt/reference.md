---
title: "Reference - Terminal API (VT)"
source_url: "https://ghostty.org/docs/vt/reference"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* [Reference](https://ghostty.org/docs/vt/reference.html)

# VT Sequence Reference

A reference of all VT sequences supported by Ghostty.

This page lists many of the VT sequences that Ghostty supports.

This page is a work-in-progress. Ghostty supports many more sequences
than are listed here and for the sequences listed here the quality
of the linked documentation varies. This is a very contributor
friendly area to help improve the documentation!

They are currently grouped by sequence type (control, esc, CSI, etc.)
and the listed alphabetically by syntax. In the future, we will
introduce better organization and search capabilities.

| Name | Syntax | Description |
| --- | --- | --- |
| [BEL](https://ghostty.org/docs/vt/control/bel.html) | `0x07` | Alert the user (beep) |
| [BS](https://ghostty.org/docs/vt/control/bs.html) | `0x08` | Move cursor backward one position |
| [TAB](https://ghostty.org/docs/vt/control/tab.html) | `0x09` | Move cursor right to the next tab stop |
| [LF](https://ghostty.org/docs/vt/control/lf.html) | `0x0A` | Move cursor down one line, scrolling if necessary |
| [CR](https://ghostty.org/docs/vt/control/cr.html) | `0x0D` | Move cursor to the left margin |
| [DECSC](https://ghostty.org/docs/vt/esc/decsc.html) | `ESC 7` | Save cursor |
| [DECRC](https://ghostty.org/docs/vt/esc/decrc.html) | `ESC 8` | Restore cursor |
| [IND](https://ghostty.org/docs/vt/esc/ind.html) | `ESC D` | Move cursor down, scrolling if necessary |
| [RI](https://ghostty.org/docs/vt/esc/ri.html) | `ESC M` | Move cursor up, scrolling if necessary |
| [RIS](https://ghostty.org/docs/vt/esc/ris.html) | `ESC c` | Full reset |
| [DECSCUSR](https://ghostty.org/docs/vt/csi/decscusr.html) | `CSI Pn " " q` | Set cursor style |
| [DECKPAM](https://ghostty.org/docs/vt/esc/deckpam.html) | `ESC =` | Set numeric keypad to application mode |
| [DECKPNM](https://ghostty.org/docs/vt/esc/deckpnm.html) | `ESC >` | Set numeric keypad to numeric mode |
| [DECALN](https://ghostty.org/docs/vt/esc/decaln.html) | `ESC # 8` | Screen alignment test |
| [CUU](https://ghostty.org/docs/vt/csi/cuu.html) | `CSI Pn A` | Move cursor up |
| [CUD](https://ghostty.org/docs/vt/csi/cud.html) | `CSI Pn B` | Move cursor down |
| [CUF](https://ghostty.org/docs/vt/csi/cuf.html) | `CSI Pn C` | Move cursor right |
| [CUB](https://ghostty.org/docs/vt/csi/cub.html) | `CSI Pn D` | Move cursor left |
| [CNL](https://ghostty.org/docs/vt/csi/cnl.html) | `CSI Pn E` | Move cursor down `n` lines and to the leftmost column |
| [CPL](https://ghostty.org/docs/vt/csi/cpl.html) | `CSI Pn F` | Move cursor up `n` lines and to the leftmost column |
| [CUP](https://ghostty.org/docs/vt/csi/cup.html) | `CSI Py ; Px H` | Move cursor to the specified row and column |
| [CHT](https://ghostty.org/docs/vt/csi/cht.html) | `CSI Pn I` | Move cursor right `n` tabs |
| [ED](https://ghostty.org/docs/vt/csi/ed.html) | `CSI Pn J` | Erase display |
| [EL](https://ghostty.org/docs/vt/csi/el.html) | `CSI Pn K` | Erase line |
| [DL](https://ghostty.org/docs/vt/csi/dl.html) | `CSI Pn M` | Delete `n` lines at the cursor |
| [IL](https://ghostty.org/docs/vt/csi/il.html) | `CSI Pn L` | Insert `n` lines at the cursor |
| [DCH](https://ghostty.org/docs/vt/csi/dch.html) | `CSI Pn P` | Delete `n` characters at the cursor |
| [SU](https://ghostty.org/docs/vt/csi/su.html) | `CSI Pn S` | Scroll up `n` lines |
| [SD](https://ghostty.org/docs/vt/csi/sd.html) | `CSI Pn T` | Scroll down `n` lines |
| [ECH](https://ghostty.org/docs/vt/csi/ech.html) | `CSI Pn X` | Erase `n` characters at the cursor |
| [CBT](https://ghostty.org/docs/vt/csi/cbt.html) | `CSI Pn Z` | Move cursor left `n` tabs |
| [HPR](https://ghostty.org/docs/vt/csi/hpr.html) | `CSI Pn a` | Move cursor to a column relative to the cursor |
| [REP](https://ghostty.org/docs/vt/csi/rep.html) | `CSI Pn b` | Repeat the preceding character `n` times |
| [VPA](https://ghostty.org/docs/vt/csi/vpa.html) | `CSI Py d` | Move cursor to the specified row |
| [VPR](https://ghostty.org/docs/vt/csi/vpr.html) | `CSI Pn e` | Move cursor down `n` rows relative to the cursor |
| [TBC](https://ghostty.org/docs/vt/csi/tbc.html) | `CSI Pn g` | Clear one or all tab stops |
| [DSR](https://ghostty.org/docs/vt/csi/dsr.html) | `CSI Pn n` | Device status report |
| [DECSTBM](https://ghostty.org/docs/vt/csi/decstbm.html) | `CSI Pt ; Pb r` | Set top and bottom margins |
| [DECSLRM](https://ghostty.org/docs/vt/csi/decslrm.html) | `CSI Pl ; Pr s` | Set left and right margins |
| [ICH](https://ghostty.org/docs/vt/csi/ich.html) | `CSI Pn @` | Insert `n` characters at the cursor |
| [HPA](https://ghostty.org/docs/vt/csi/hpa.html) | `CSI Px`  ` | Move cursor to the specified column |
| [XTSHIFTESCAPE](https://ghostty.org/docs/vt/csi/xtshiftescape.html) | `CSI > Pn s` | Configure `shift` modifier behavior with mouse reports |
| [OSC 0](https://ghostty.org/docs/vt/osc/0.html) | `OSC 0 ; Pt ST` | Change window icon and window title |
| [OSC 1](https://ghostty.org/docs/vt/osc/1.html) | `OSC 1 ; Pt ST` | Change window icon |
| [OSC 2](https://ghostty.org/docs/vt/osc/2.html) | `OSC 2 ; Pt ST` | Change window title |
| [OSC 4](https://ghostty.org/docs/vt/osc/4.html) | `OSC 4 ; Pn ; Pc ST` | Query or change palette colors |
| [OSC 5](https://ghostty.org/docs/vt/osc/5.html) | `OSC 5 ; Pn ; Pc ST` | Query or change special colors |
| [OSC 7](https://ghostty.org/docs/vt/osc/7.html) | `OSC 7 ; Pu ; ST` | Change the working directory |
| [OSC 8](https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda) | `OSC 8 ; Pp ; Pu ; ST` | Begin or end a hyperlink |
| [OSC 9](https://ghostty.org/docs/vt/osc/9.html) | `OSC 9 ; Pt ; ST` | Show a desktop notification |
| [OSC 9;4](https://ghostty.org/docs/vt/osc/conemu.html#change-progress-state-(osc-94)) | `OSC 9 ; 4 ; Ps ; Pn ; ST` | Report progress state |
| [OSC 10](https://ghostty.org/docs/vt/osc/1x.html) | `OSC 10 ; Pc ST` | Query or change the foreground color |
| [OSC 11](https://ghostty.org/docs/vt/osc/1x.html) | `OSC 11 ; Pc ST` | Query or change the background color |
| [OSC 12](https://ghostty.org/docs/vt/osc/1x.html) | `OSC 12 ; Pc ST` | Query or change the cursor color |
| [OSC 13](https://ghostty.org/docs/vt/osc/1x.html) | `OSC 13 ; Pc ST` | Query or change the pointer foreground color |
| [OSC 14](https://ghostty.org/docs/vt/osc/1x.html) | `OSC 14 ; Pc ST` | Query or change the pointer background color |
| [OSC 15](https://ghostty.org/docs/vt/osc/1x.html) | `OSC 15 ; Pc ST` | Query or change the Tektronix foreground color |
| [OSC 16](https://ghostty.org/docs/vt/osc/1x.html) | `OSC 16 ; Pc ST` | Query or change the Tektronix background color |
| [OSC 17](https://ghostty.org/docs/vt/osc/1x.html) | `OSC 17 ; Pc ST` | Query or change the highlight background color |
| [OSC 18](https://ghostty.org/docs/vt/osc/1x.html) | `OSC 18 ; Pc ST` | Query or change the Tektronix cursor color |
| [OSC 19](https://ghostty.org/docs/vt/osc/1x.html) | `OSC 19 ; Pc ST` | Query or change the highlight foreground color |
| [OSC 21](https://sw.kovidgoyal.net/kitty/color-stack/) | `OSC 21 ; Pk = Pv ; ... ST` | Query or change any color using the Kitty Color Protocol |
| [OSC 22](https://ghostty.org/docs/vt/osc/22.html) | `OSC 22 ; Pt ST` | Change the pointer shape |
| [OSC 52](https://ghostty.org/docs/vt/osc/52.html) | `OSC 52 ; Pc ; Pd ST` | Query or change clipboard data |
| [OSC 104](https://ghostty.org/docs/vt/osc/104.html) | `OSC 104 ; Pn ST` | Reset palette colors |
| [OSC 105](https://ghostty.org/docs/vt/osc/105.html) | `OSC 105 ; Pn ST` | Reset special colors |
| [OSC 110](https://ghostty.org/docs/vt/osc/11x.html) | `OSC 110 ST` | Reset the foreground color |
| [OSC 111](https://ghostty.org/docs/vt/osc/11x.html) | `OSC 111 ST` | Reset the background color |
| [OSC 112](https://ghostty.org/docs/vt/osc/11x.html) | `OSC 112 ST` | Reset the cursor color |
| [OSC 113](https://ghostty.org/docs/vt/osc/11x.html) | `OSC 113 ST` | Reset the pointer foreground color |
| [OSC 114](https://ghostty.org/docs/vt/osc/11x.html) | `OSC 114 ST` | Reset the pointer background color |
| [OSC 115](https://ghostty.org/docs/vt/osc/11x.html) | `OSC 115 ST` | Reset the Tektronix foreground color |
| [OSC 116](https://ghostty.org/docs/vt/osc/11x.html) | `OSC 116 ST` | Reset the Tektronix background color |
| [OSC 117](https://ghostty.org/docs/vt/osc/11x.html) | `OSC 117 ST` | Reset the highlight background color |
| [OSC 118](https://ghostty.org/docs/vt/osc/11x.html) | `OSC 118 ST` | Reset the Tektronix cursor color |
| [OSC 119](https://ghostty.org/docs/vt/osc/11x.html) | `OSC 119 ST` | Reset the highlight foreground color |



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/reference.mdx)
