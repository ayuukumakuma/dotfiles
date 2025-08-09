#!/bin/bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
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

# Check if 1Password CLI is installed
if ! command -v op &> /dev/null; then
    print_error "1Password CLI (op) is not installed."
    echo "Please install it via Homebrew: brew install 1password-cli"
    exit 1
fi

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    print_error "jq is not installed."
    echo "Please install it via Homebrew: brew install jq"
    exit 1
fi

# Check if user is signed in to 1Password
if ! op account list &> /dev/null; then
    print_info "You need to sign in to 1Password first."
    echo "Please run: op signin"
    exit 1
fi

print_info "Fetching Slack Webhook URL from 1Password..."

# Item name in 1Password
ITEM_NAME="Claude Code用Slack Webhook"

# Get the Webhook URL from notesPlain field
WEBHOOK_URL=$(op item get "$ITEM_NAME" --fields notesPlain 2>/dev/null || echo "")

if [ -z "$WEBHOOK_URL" ]; then
    print_error "Could not retrieve Slack Webhook URL from 1Password."
    echo "Make sure you have an item named '$ITEM_NAME' with a webhook URL in the 'notesPlain' field in 1Password."
    exit 1
fi

# Path to the settings.json file
SETTINGS_FILE="$(dirname "$(dirname "$(realpath "$0")")")/claude/settings.json"

# Check if settings.json exists
if [ ! -f "$SETTINGS_FILE" ]; then
    print_error "File not found: $SETTINGS_FILE"
    exit 1
fi

print_info "Updating claude/settings.json..."

# Create a backup of the current settings file
cp "$SETTINGS_FILE" "${SETTINGS_FILE}.bak"

# Update the SLACK_WEBHOOK_URL in settings.json using jq
if jq --arg url "$WEBHOOK_URL" '.env.SLACK_WEBHOOK_URL = $url' "$SETTINGS_FILE" > "$SETTINGS_FILE.tmp"; then
    mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"
    print_success "Updated SLACK_WEBHOOK_URL in claude/settings.json"

    # Remove backup file on success
    rm "${SETTINGS_FILE}.bak"

    # Display the updated value (masked for security)
    echo ""
    print_info "SLACK_WEBHOOK_URL has been set to:"
    echo "  ${WEBHOOK_URL:0:30}...[masked]"
else
    print_error "Failed to update settings.json"
    # Restore from backup
    mv "${SETTINGS_FILE}.bak" "$SETTINGS_FILE"
    exit 1
fi

print_success "Slack Webhook URL successfully updated from 1Password!"