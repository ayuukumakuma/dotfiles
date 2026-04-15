#!/usr/bin/env python3

import json
import os
import subprocess
import sys

try:
    data = json.load(sys.stdin)
except (json.JSONDecodeError, ValueError):
    data = {}

BRAILLE = " ⣀⣄⣤⣦⣶⣷⣿"
R = "\033[0m"
DIM = "\033[2m"
PURPLE = "\033[38;2;180;140;255m"
GREEN = "\033[38;2;80;200;120m"
CYAN = "\033[38;2;80;200;200m"


def gradient(pct):
    if pct < 50:
        r = int(pct * 5.1)
        return f"\033[38;2;{r};200;80m"
    else:
        g = int(200 - (pct - 50) * 4)
        return f"\033[38;2;255;{max(g, 0)};60m"


def braille_bar(pct, width=8):
    pct = min(max(pct, 0), 100)
    level = pct / 100
    bar = ""
    for i in range(width):
        seg_start = i / width
        seg_end = (i + 1) / width
        if level >= seg_end:
            bar += BRAILLE[7]
        elif level <= seg_start:
            bar += BRAILLE[0]
        else:
            frac = (level - seg_start) / (seg_end - seg_start)
            bar += BRAILLE[min(int(frac * 7), 7)]
    return bar


def fmt(label, pct):
    p = round(pct)
    return f"{DIM}{label}{R} {gradient(pct)}{braille_bar(pct)}{R} ({p}%)"


def git_run(*args):
    result = subprocess.run(args, capture_output=True, text=True)
    return result.stdout.strip() if result.returncode == 0 else ""


def git_info():
    top = git_run("git", "rev-parse", "--show-toplevel")
    branch = git_run("git", "branch", "--show-current")
    if not top or not branch:
        return None, None
    repo = os.path.basename(top)
    cwd = os.getcwd()
    if cwd != top:
        repo += f"/{os.path.basename(cwd)}"
    return repo, branch


model = data.get("model", {}).get("display_name", "Claude")

lines = []

parts = [f"{PURPLE}\uf444 {model}{R}"]
repo, branch = git_info()
if repo:
    parts.append(f"{DIM}│{R} {GREEN}\ue725 {branch}{R}  {CYAN}\uf114 {repo}{R}")
lines.append(" ".join(parts))

metrics = [
    ("ctx: ", ("context_window", "used_percentage")),
    ("5h : ", ("rate_limits", "five_hour", "used_percentage")),
    ("7d : ", ("rate_limits", "seven_day", "used_percentage")),
]
for label, keys in metrics:
    val = data
    for k in keys:
        if not isinstance(val, dict):
            val = None
            break
        val = val.get(k, {})
    if isinstance(val, (int, float)):
        lines.append(fmt(label, val))

print("\n".join(lines), end="")
