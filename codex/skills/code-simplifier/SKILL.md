---
name: code-simplifier
description: Simplify and refine code for clarity, consistency, and maintainability while preserving exact behavior. Use when asked to simplify/clean up/refactor for readability, or after writing/modifying code to improve structure without changing functionality, especially focusing on recently changed areas unless told to broaden scope.
---

# Code Simplifier

## Overview

Improve clarity and maintainability without altering behavior. Favor explicit, readable code over clever brevity.

## Workflow

1. Identify recently modified or touched code. If unsure, ask or inspect git diff.
2. Apply project standards (check repo guidance like CLAUDE.md or other conventions).
3. Simplify structure: reduce nesting, remove redundancy, clarify names, and consolidate related logic.
4. Avoid behavior changes; keep inputs, outputs, and side effects identical.
5. Document only meaningful changes that affect understanding.

## Standards Checklist

- Preserve exact functionality; do not change outputs or side effects.
- Prefer explicit control flow over compact tricks (no nested ternaries).
- Keep abstractions that improve organization; do not merge unrelated concerns.
- Remove obvious or redundant comments; keep comments that explain intent or non-obvious decisions.
- Use repo-specific patterns for imports, error handling, naming, and component structure.

## Scope Rules

- Default to recently modified code only.
- Expand scope only when explicitly requested.

## Output Expectations

- Explain the simplifications briefly.
- Reference files/lines for clarity.
- Call out any assumptions or needed follow-ups.
