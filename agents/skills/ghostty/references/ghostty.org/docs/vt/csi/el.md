---
title: "Erase in Line (EL) - CSI"
source_url: "https://ghostty.org/docs/vt/csi/el"
fetched_at: "2026-04-07T02:34:27.768926+00:00"
---



* [Ghostty Docs](https://ghostty.org/docs.html)
* [Terminal API (VT)](https://ghostty.org/docs/vt.html)
* CSI
* [Erase in Line (EL)](https://ghostty.org/docs/vt/csi/el.html)

# Erase Line (EL)

Erase line contents with behavior depending on the command `n`.

1. 0x1B
   :   ESC
2. 0x5B
   :   [
3. \_\_\_\_
   :   n
4. 0x4B
   :   K

If `n` is unset, the value of `n` is 0. The only valid values for `n` are
0, 1, or 2. If any other value of `n` is given, do not execute this sequence.
The remainder of the sequence documentation assumes a valid value of `n`.

For all valid values of `n`, this sequence unsets the pending wrap state.
The cursor position will remain unchanged under all circumstances throughout
this sequence.

If [Select Character Selection Attribute (DECSCA)](https://ghostty.org/docs/vt/csi/el.html#TODO) is enabled
or was the most recently enabled protection mode on the currently active screen,
protected attributes are ignored. Otherwise, protected attributes will be
respected. For more details on this specific logic for protected attribute
handling, see [Erase Character (ECH)](https://ghostty.org/docs/vt/csi/ech.html).

For all operations, if a multi-cell character would be split, erase the full multi-cell
character. For example, if "橋" is printed and the erase would only erase the
first or second cell of the two-cell character, both cells should be erased.

If `n` is `0`, perform an **erase line right** operation. Erase line right
is equivalent to [Erase Character (ECH)](https://ghostty.org/docs/vt/csi/ech.html) with `n` set to the total
remaining columns from the cursor to the end of the line (and including
the cursor). If the line is softwrapped, only the single row is erased;
it does not erase through the wrap. Further, the wrap state of the row is
reset such that the line is no longer considered wrapped.

If `n` is `1`, perform an **erase line left** operation. This replaces
the `n` cells left of and including the cursor with a blank character and
colors the background according to the current SGR state. The leftmost
column that can be blanked is the first column of the screen. The
[left margin](https://ghostty.org/docs/vt/csi/el.html#TODO) has no effect on this operation.

If `n` is `2`, **erase the entire line**. This is the equivalent of
erase left (`n = 1`) and erase right (`n = 0`) both being executed.

## Validation

### EL V-1: Simple Erase Right

```
printf "ABCDE"
printf "\033[3G"
printf "\033[0K"
```

```
|ABc_____|
```

### EL V-2: Erase Right Resets Pending Wrap

```
cols=$(tput cols)
printf "\033[${cols}G" # move to last column
printf "A" # set pending wrap state
printf "\033[0K"
printf "X"
```

```
|_______X|
```

The cursor should be on the 'X'

### EL V-3: Erase Right SGR State

```
printf "ABC"
printf "\033[2G"
printf "\033[41m"
printf "\033[0K"
```

```
|Ac______|
```

The cells from `c` onwards should have a red background all the way to
the right edge of the screen.

### EL V-4: Erase Right Multi-cell Character

```
printf "AB橋DE"
printf "\033[4G"
printf "\033[0K"
```

```
|AB_c____|
```

### EL V-5: Erase Right Left/Right Scroll Region Ignored

```
printf "\033[1;1H" # move to top-left
printf "\033[0J" # clear screen
printf "ABCDE"
printf "\033[?69h" # enable left/right margins
printf "\033[1;3s" # scroll region left/right
printf "\033[2G"
printf "\033[0K"
```

```
|Ac________|
```

### EL V-6: Erase Right Protected Attributes Ignored with DECSCA

```
printf "\033V"
printf "ABCDE"
printf "\033[1\"q"
printf "\033[0\"q"
printf "\033[2G"
printf "\033[0K"
```

```
|Ac________|
```

### EL V-7: Protected Attributes Respected without DECSCA

```
printf "\033[1\"q"
printf "ABCDE"
printf "\033V"
printf "\033[2G"
printf "\033[0K"
printf "\033[1K"
printf "\033[2K"
```

```
|ABCDE_____|
```

### EL V-8: Simple Erase Left

```
printf "ABCDE"
printf "\033[3G"
printf "\033[1K"
```

```
|__cDE___|
```

### EL V-9: Erase Left SGR State

```
printf "ABC"
printf "\033[2G"
printf "\033[41m"
printf "\033[1K"
```

```
|_cC_____|
```

The cells from `c` to the left should have a red background.

### EL V-10: Erase Left Multi-cell Character

```
printf "AB橋DE"
printf "\033[3G"
printf "\033[1K"
```

```
|__c_DE__|
```

### EL V-11: Erase Left Protected Attributes Ignored with DECSCA

```
printf "\033V"
printf "ABCDE"
printf "\033[1\"q"
printf "\033[0\"q"
printf "\033[2G"
printf "\033[1K"
```

```
|_cCDE_____|
```

### EL V-12: Simple Erase Complete

```
printf "ABCDE"
printf "\033[3G"
printf "\033[2K"
```

```
|__c_______|
```

### EL V-13: Erase Complete SGR State

```
printf "ABC"
printf "\033[2G"
printf "\033[41m"
printf "\033[2K"
```

```
|_c______|
```

The entire line should have a red background.



[Edit on GitHub](https://github.com/ghostty-org/website/edit/main/docs/vt/csi/el.mdx)

* [Validation](https://ghostty.org/docs/vt/csi/el.html#validation)
* [EL V-1: Simple Erase Right](https://ghostty.org/docs/vt/csi/el.html#el-v-1:-simple-erase-right)
* [EL V-2: Erase Right Resets Pending Wrap](https://ghostty.org/docs/vt/csi/el.html#el-v-2:-erase-right-resets-pending-wrap)
* [EL V-3: Erase Right SGR State](https://ghostty.org/docs/vt/csi/el.html#el-v-3:-erase-right-sgr-state)
* [EL V-4: Erase Right Multi-cell Character](https://ghostty.org/docs/vt/csi/el.html#el-v-4:-erase-right-multi-cell-character)
* [EL V-5: Erase Right Left/Right Scroll Region Ignored](https://ghostty.org/docs/vt/csi/el.html#el-v-5:-erase-right-leftright-scroll-region-ignored)
* [EL V-6: Erase Right Protected Attributes Ignored with DECSCA](https://ghostty.org/docs/vt/csi/el.html#el-v-6:-erase-right-protected-attributes-ignored-with-decsca)
* [EL V-7: Protected Attributes Respected without DECSCA](https://ghostty.org/docs/vt/csi/el.html#el-v-7:-protected-attributes-respected-without-decsca)
* [EL V-8: Simple Erase Left](https://ghostty.org/docs/vt/csi/el.html#el-v-8:-simple-erase-left)
* [EL V-9: Erase Left SGR State](https://ghostty.org/docs/vt/csi/el.html#el-v-9:-erase-left-sgr-state)
* [EL V-10: Erase Left Multi-cell Character](https://ghostty.org/docs/vt/csi/el.html#el-v-10:-erase-left-multi-cell-character)
* [EL V-11: Erase Left Protected Attributes Ignored with DECSCA](https://ghostty.org/docs/vt/csi/el.html#el-v-11:-erase-left-protected-attributes-ignored-with-decsca)
* [EL V-12: Simple Erase Complete](https://ghostty.org/docs/vt/csi/el.html#el-v-12:-simple-erase-complete)
* [EL V-13: Erase Complete SGR State](https://ghostty.org/docs/vt/csi/el.html#el-v-13:-erase-complete-sgr-state)
