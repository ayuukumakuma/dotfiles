#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Arto
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 📝
# @raycast.argument1 { "type": "text", "placeholder": "URL" }

# Documentation:
# @raycast.description Open the given file path with Arto.
# @raycast.author ayuu
# @raycast.authorURL https://raycast.com/ayuu

/etc/profiles/per-user/nasuno.ayumu/bin/arto $1
