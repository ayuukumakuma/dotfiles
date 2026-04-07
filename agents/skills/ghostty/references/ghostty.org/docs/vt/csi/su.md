---
title: "Scroll Up (SU) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/su"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Scroll Up (SU)](https://ghostty.org/docs/vt/csi/su.html)

# Scroll Up (SU)

Remove `n` lines from the top of the scroll region and shift existing
lines up.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   n
4. 0x53
   :   S

The parameter `n` must be an integer greater than or equal to 1. If `n` is less than
or equal to 0, adjust `n` to be 1. If `n` is omitted, `n` defaults to 1.

This sequence executes [Delete Line (DL)](https://ghostty.org/docs/vt/csi/dl.html) with the cursor position
set to the top of the scroll region. There are some differences from DL
which are explained below.

The cursor position after the operation must be unchanged from when SU was
invoked. The pending wrap state is *not* reset.

## Validation

### SU V-1: Simple Usage

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABC\n"
printf "DEF\n"
printf "GHI\n"
printf "\033[2;2H"
printf "\033[S"
```

```
|DEF_____|
|GHI_____|
```

### SU V-2: Top/Bottom Scroll Region

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABC\n"
printf "DEF\n"
printf "GHI\n"
printf "\033[2;3r" # scroll region top/bottom
printf "\033[1;1H"
printf "\033[S"
```

```
|ABC_____|
|GHI_____|
```

### SU V-3: Left/Right Scroll Regions

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABC123\n"
printf "DEF456\n"
printf "GHI789\n"
printf "\033[?69h" # enable left/right margins
printf "\033[2;4s" # scroll region left/right
printf "\033[2;2H"
printf "\033[S"
```

```
|AEF423__|
|DHI756__|
|G___89__|
```

### SU V-4: Preserves Pending Wrap

```
cols=$(tput cols)
printf "\033[1;${cols}H" # move to top-right
printf "\033[2J" # clear screen
printf "A"
printf "\033[2;${cols}H"
printf "B"
printf "\033[3;${cols}H"
printf "C"
printf "\033[S"
printf "X"
```

```
|_______B|
|_______C|
|________|
|X_______|
```

### SU V-5: Scroll Full Top/Bottom Scroll Region

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "top"
printf "\033[5;1H"
printf "ABCDEF"
printf "\033[2;5r" # scroll region top/bottom
printf "\033[4S"
```

```
|top_____|
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/su.mdx)

* [Validation](https://ghostty.org/docs/vt/csi/su.html#validation)
* [SU V-1: Simple Usage](https://ghostty.org/docs/vt/csi/su.html#su-v-1:-simple-usage)
* [SU V-2: Top/Bottom Scroll Region](https://ghostty.org/docs/vt/csi/su.html#su-v-2:-topbottom-scroll-region)
* [SU V-3: Left/Right Scroll Regions](https://ghostty.org/docs/vt/csi/su.html#su-v-3:-leftright-scroll-regions)
* [SU V-4: Preserves Pending Wrap](https://ghostty.org/docs/vt/csi/su.html#su-v-4:-preserves-pending-wrap)
* [SU V-5: Scroll Full Top/Bottom Scroll Region](https://ghostty.org/docs/vt/csi/su.html#su-v-5:-scroll-full-topbottom-scroll-region)
