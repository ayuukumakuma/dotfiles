---
title: "GitHub Actions - Just Programmer's Manual"
source_url: "https://just.systems/man/en/github-actions"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [GitHub Actions](https://just.systems/man/en/github-actions.html#github-actions)

`just` can be installed on GitHub Actions in a few ways.

Using package managers pre-installed on GitHub Actions runners on MacOS with
`brew install just`, and on Windows with `choco install just`.

With [extractions/setup-just](https://github.com/extractions/setup-just):

```
- uses: extractions/setup-just@v3
  with:
    just-version: 1.5.0  # optional semver specification, otherwise latest
```

Or with [taiki-e/install-action](https://github.com/taiki-e/install-action):

```
- uses: taiki-e/install-action@just
```
