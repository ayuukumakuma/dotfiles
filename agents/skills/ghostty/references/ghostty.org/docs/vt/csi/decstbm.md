---
title: "Set Top and Bottom Margins (DECSTBM) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/decstbm"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Set Top and Bottom Margins (DECSTBM)](https://ghostty.org/docs/vt/csi/decstbm.html)

# Set Top and Bottom Margins (DECSTBM)

Set the top and bottom margins, otherwise known as the scroll region.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   t
4. 0x3B
   :   ;
5. \_\_\_\_
   :   b
6. 0x72
   :   r

Parameters `t` and `b` are integer values. If either value is zero the
value will be reset to default values. The default value for `t` is `1`
and the default value of `b` is the number of rows in the screen.

Values `t` and `b` can be omitted. If either value is omitted, their
default values will be used. Note that it is impossible to omit `t`
and not omit `b`. The only valid sequences are `CSI t ; b r`,
`CSI t r` and `CSI r`.

If top is larger or equal to bottom, this sequence does nothing. A
scroll region must be at least two rows (`b` must be greater than `t`).
The rest of this sequence description assumes valid values for `t` and `b`.

This sequence unsets the pending wrap state and moves the cursor to
the top-left of the screen. If [origin mode](https://ghostty.org/docs/vt/csi/decstbm.html#TODO) is set, the cursor is
moved to the top-left of the scroll region.

To reset the scroll region, call this sequence with both values set to
"0". This will force the default values for both `t` and `b` which is
the full screen.

The top and bottom margin constitute what is known as the *scroll region*.
The scroll region impacts the operation of many sequences such as
[insert line](https://ghostty.org/docs/vt/csi/il.html), [cursor down](https://ghostty.org/docs/vt/csi/cud.html), etc. Scroll regions are
an effective and efficient way to constraint terminal modifications to a
rectangular region of the screen.

## Validation

### DECSTBM V-1: Full Screen

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABC\n"
printf "DEF\n"
printf "GHI\n"
printf "\033[r" # scroll region top/bottom
printf "\033[T"
```

```
|c_______|
|ABC_____|
|DEF_____|
|GHI_____|
```

### DECSTBM V-2: Top Only

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABC\n"
printf "DEF\n"
printf "GHI\n"
printf "\033[2r" # scroll region top/bottom
printf "\033[T"
```

```
|ABC_____|
|________|
|DEF_____|
|GHI_____|
```

### DECSTBM V-3: Top and Bottom

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABC\n"
printf "DEF\n"
printf "GHI\n"
printf "\033[1;2r" # scroll region top/bottom
printf "\033[T"
```

```
|________|
|ABC_____|
|GHI_____|
```

### DECSTBM V-4: Top Equal to Bottom

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABC\n"
printf "DEF\n"
printf "GHI\n"
printf "\033[2;2r" # scroll region top/bottom
printf "\033[T"
```

```
|________|
|ABC_____|
|DEF_____|
|GHI_____|
```



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/decstbm.mdx)

* [Validation](https://ghostty.org/docs/vt/csi/decstbm.html#validation)
* [DECSTBM V-1: Full Screen](https://ghostty.org/docs/vt/csi/decstbm.html#decstbm-v-1:-full-screen)
* [DECSTBM V-2: Top Only](https://ghostty.org/docs/vt/csi/decstbm.html#decstbm-v-2:-top-only)
* [DECSTBM V-3: Top and Bottom](https://ghostty.org/docs/vt/csi/decstbm.html#decstbm-v-3:-top-and-bottom)
* [DECSTBM V-4: Top Equal to Bottom](https://ghostty.org/docs/vt/csi/decstbm.html#decstbm-v-4:-top-equal-to-bottom)
