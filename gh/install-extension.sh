#!/bin/bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored messages
print_error() {
    echo -e "${RED}Error: $1${NC}" >&2
}

print_success() {
    echo -e "${GREEN}Success: $1${NC}"
}

print_info() {
    echo -e "${YELLOW}Info: $1${NC}"
}

print_step() {
    echo -e "${BLUE}Step: $1${NC}"
}

require_command() {
    if ! command -v "$1" &> /dev/null; then
        print_error "$1 is not installed."
        exit 1
    fi
}

# Check dependencies
require_command gh
require_command jq

# Resolve extensions.jsonc path relative to this script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_FILE="${SCRIPT_DIR}/extensions.jsonc"

if [[ ! -f "$CONFIG_FILE" ]]; then
    print_error "${CONFIG_FILE} not found."
    exit 1
fi

# Strip JSONC comments and parse extensions array
extensions=$(sed 's://.*$::' "$CONFIG_FILE" | jq -r '.extensions[]')

if [[ -z "$extensions" ]]; then
    print_info "No extensions found in ${CONFIG_FILE}."
    exit 0
fi

total=$(echo "$extensions" | wc -l | tr -d ' ')
succeeded=0
failed=0

print_info "Installing ${total} extension(s)..."
echo ""

while IFS= read -r ext; do
    print_step "Installing ${ext}..."
    if gh extension install "$ext" 2>/dev/null; then
        print_success "${ext} installed."
        ((succeeded++))
    else
        print_error "Failed to install ${ext}."
        ((failed++))
    fi
done <<<"$extensions"

echo ""
print_info "Done: ${succeeded} succeeded, ${failed} failed (${total} total)."
