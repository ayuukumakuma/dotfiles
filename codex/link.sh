#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=../script/link-common.sh
source "${SCRIPT_DIR}/../script/link-common.sh"

create_symlink "codex/config.toml" "~/.codex/config.toml"
create_symlink "codex/hooks/notify-terminal-notifier.sh" "~/.codex/hooks/notify-terminal-notifier.sh"
