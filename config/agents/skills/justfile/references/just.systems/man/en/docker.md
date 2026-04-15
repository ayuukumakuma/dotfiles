---
title: "Docker - Just Programmer's Manual"
source_url: "https://just.systems/man/en/docker"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Docker](https://just.systems/man/en/docker.html#docker)

`just` is available as a Docker image from
[the GitHub Container Registry](https://ghcr.io/casey/just).

To copy `just` into a Docker image, add the following line to your
`Dockerfile`:

```
COPY --from=ghcr.io/casey/just:latest /just /usr/local/bin/
```

After copying, `just` may also be used as part of a docker build:

```
RUN just
```
