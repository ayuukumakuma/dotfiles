#!/usr/bin/env python3
"""Search Markdown reference files for this skill."""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path


def extract_frontmatter(content: str) -> tuple[dict[str, str], str]:
    match = re.match(r"^---\s*\n(.*?)\n---\s*\n(.*)", content, re.DOTALL)
    if not match:
        return {}, content

    frontmatter: dict[str, str] = {}
    for line in match.group(1).splitlines():
        if ":" in line:
            key, value = line.split(":", 1)
            frontmatter[key.strip()] = value.strip()
    return frontmatter, match.group(2)


def contexts(body: str, query: str, context_lines: int = 2) -> list[str]:
    keywords = [keyword.lower() for keyword in query.split()]
    lines = body.splitlines()
    matches = [
        index
        for index, line in enumerate(lines)
        if any(keyword in line.lower() for keyword in keywords)
    ]

    snippets: list[str] = []
    for index in matches[:6]:
        start = max(0, index - context_lines)
        end = min(len(lines), index + context_lines + 1)
        snippet = []
        for current in range(start, end):
            marker = ">" if current == index else " "
            snippet.append(f"{marker} {lines[current]}")
        snippets.append("\n".join(snippet))
    return snippets


def search(skill_dir: Path, query: str, max_results: int) -> list[dict[str, object]]:
    references_dir = skill_dir / "references"
    keywords = [keyword.lower() for keyword in query.split()]
    results: list[dict[str, object]] = []

    for path in references_dir.glob("**/*.md"):
        content = path.read_text(encoding="utf-8")
        frontmatter, body = extract_frontmatter(content)
        body_lower = body.lower()
        match_count = sum(body_lower.count(keyword) for keyword in keywords)
        if match_count == 0:
            continue

        results.append(
            {
                "file": str(path.relative_to(skill_dir)),
                "matches": match_count,
                "source_url": frontmatter.get("source_url", "Unknown"),
                "fetched_at": frontmatter.get("fetched_at", "Unknown"),
                "contexts": contexts(body, query),
            }
        )

    results.sort(key=lambda result: result["matches"], reverse=True)
    return results[:max_results]


def main() -> None:
    parser = argparse.ArgumentParser(description="Search nix-darwin skill references.")
    parser.add_argument("query", help="Search query")
    parser.add_argument("--max-results", "-n", type=int, default=10)
    parser.add_argument("--json", action="store_true")
    parser.add_argument(
        "--skill-dir",
        default=str(Path(__file__).resolve().parent.parent),
        help="Skill directory",
    )
    args = parser.parse_args()

    results = search(Path(args.skill_dir), args.query, args.max_results)
    if args.json:
        print(json.dumps(results, indent=2))
        return

    if not results:
        print(f"No matches found for {args.query!r}.")
        return

    print(f"Search results for {args.query!r}")
    for index, result in enumerate(results, 1):
        print(f"\n{index}. {result['file']} ({result['matches']} matches)")
        print(f"   Source: {result['source_url']}")
        print(f"   Fetched: {result['fetched_at']}")
        for snippet in result["contexts"][:3]:
            print("   ---")
            print(snippet)


if __name__ == "__main__":
    main()

