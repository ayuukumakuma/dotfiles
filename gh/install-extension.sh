#!/bin/bash

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_error() { echo -e "${RED}Error: $1${NC}" >&2; }
print_success() { echo -e "${GREEN}Success: $1${NC}"; }
print_info() { echo -e "${YELLOW}Info: $1${NC}"; }
print_step() { echo -e "${BLUE}Step: $1${NC}"; }

require_command() {
    if ! command -v "$1" &> /dev/null; then
        print_error "$1 is not installed."
        exit 1
    fi
}

contains() {
    local needle="$1"; shift
    for item; do [[ "$item" == "$needle" ]] && return 0; done
    return 1
}

require_command gh
require_command jq

# Resolve extensions.jsonc path relative to this script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_FILE="${SCRIPT_DIR}/extensions.jsonc"

if [[ ! -f "$CONFIG_FILE" ]]; then
    print_error "${CONFIG_FILE} not found."
    exit 1
fi

# Strip JSONC comments and parse desired extensions
desired_list=()
while IFS= read -r ext; do
    [[ -n "$ext" ]] && desired_list+=("$ext")
done < <(sed 's://.*$::' "$CONFIG_FILE" | jq -r '.extensions[]')

# Get currently installed extensions (REPO column from gh extension list)
installed_list=()
while IFS= read -r ext; do
    [[ -n "$ext" ]] && installed_list+=("$ext")
done < <(gh extension list 2>/dev/null | awk '{print $2}')

installed_count=0
removed_count=0
failed_count=0

# Remove extensions not in jsonc
for ext in ${installed_list[@]+"${installed_list[@]}"}; do
    [[ -z "$ext" ]] && continue
    if ! contains "$ext" "${desired_list[@]+"${desired_list[@]}"}"; then
        print_step "Removing ${ext}..."
        if gh extension remove "$ext" 2>/dev/null; then
            print_success "${ext} removed."
            ((removed_count++))
        else
            print_error "Failed to remove ${ext}."
            ((failed_count++))
        fi
    fi
done

# Install extensions not yet installed
for ext in ${desired_list[@]+"${desired_list[@]}"}; do
    [[ -z "$ext" ]] && continue
    if ! contains "$ext" "${installed_list[@]+"${installed_list[@]}"}"; then
        print_step "Installing ${ext}..."
        if gh extension install "$ext" 2>/dev/null; then
            print_success "${ext} installed."
            ((installed_count++))
        else
            print_error "Failed to install ${ext}."
            ((failed_count++))
        fi
    fi
done

already=$(( ${#desired_list[@]} - installed_count ))

echo ""
print_info "Done: ${installed_count} installed, ${removed_count} removed, ${failed_count} failed (${already} already up-to-date)."
