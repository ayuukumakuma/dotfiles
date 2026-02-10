#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=../script/link-common.sh
source "${SCRIPT_DIR}/../script/link-common.sh"

create_symlink "claude/settings.json" "~/.claude/settings.json"
create_symlink "claude/statusline.sh" "~/.claude/statusline.sh"
create_symlink "claude/hooks/state-notify.sh" "~/.claude/hooks/state-notify.sh"
