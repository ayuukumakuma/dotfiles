---
title: "Node.js package.json Script Compatibility - Just Programmer's Manual"
source_url: "https://just.systems/man/en/nodejs-packagejson-script-compatibility"
fetched_at: "2026-03-31T07:58:30.733796+00:00"
---



### [Node.js `package.json` Script Compatibility](https://just.systems/man/en/nodejs-packagejson-script-compatibility.html#nodejs-packagejson-script-compatibility)

The following export statement gives `just` recipes access to local Node module
binaries, and makes `just` recipe commands behave more like `script` entries in
Node.js `package.json` files:

```
export PATH := "./node_modules/.bin:" + env_var('PATH')
```
