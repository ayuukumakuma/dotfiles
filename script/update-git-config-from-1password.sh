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

# Check if user is signed in to 1Password
if ! op account list &> /dev/null; then
    print_info "You need to sign in to 1Password first."
    echo "Please run: op signin"
    exit 1
fi

print_info "Fetching GitHub credentials from 1Password..."

# Try to get GitHub item
# Note: The item name might need to be adjusted based on your 1Password vault
ITEM_NAME="GitHub"
SSH_ITEM_NAME="GitHub SSH"

# Get the GitHub username
USERNAME=$(op item get "$ITEM_NAME" --fields login 2>/dev/null || echo "")
if [ -z "$USERNAME" ]; then
    print_error "Could not retrieve GitHub username from 1Password."
    echo "Make sure you have a GitHub item with a 'username' field in 1Password."
    exit 1
fi

# Get the GitHub email
EMAIL=$(op item get "$ITEM_NAME" --fields メール 2>/dev/null || echo "")
if [ -z "$EMAIL" ]; then
    # Try alternative field names
    EMAIL=$(op item get "$ITEM_NAME" --fields "email address" 2>/dev/null || echo "")
fi
if [ -z "$EMAIL" ]; then
    print_error "Could not retrieve GitHub email from 1Password."
    echo "Make sure you have a GitHub item with an 'email' field in 1Password."
    exit 1
fi

# Get the SSH public key
SSH_KEY=$(op item get "$SSH_ITEM_NAME" --fields "public key" 2>/dev/null || echo "")
if [ -z "$SSH_KEY" ]; then
    # Try alternative field names
    SSH_KEY=$(op item get "$SSH_ITEM_NAME" --fields "SSH Public Key" 2>/dev/null || echo "")
fi
if [ -z "$SSH_KEY" ]; then
    # Try to get from SSH key section
    SSH_KEY=$(op item get "$ITEM_NAME" --format json 2>/dev/null | jq -r '.fields[] | select(.label | test("public key"; "i")) | .value' || echo "")
fi
if [ -z "$SSH_KEY" ]; then
    print_error "Could not retrieve SSH public key from 1Password."
    echo "Make sure you have a GitHub item with an SSH public key field in 1Password."
    exit 1
fi

# Update git config
print_info "Updating git config..."

git config --global user.name "$USERNAME"
print_success "Set user.name to: $USERNAME"

git config --global user.email "$EMAIL"
print_success "Set user.email to: $EMAIL"

git config --global user.signingkey "$SSH_KEY"
print_success "Set user.signingkey"

# Display current git config
echo ""
print_info "Current git user configuration:"
echo "  user.name = $(git config --global user.name)"
echo "  user.email = $(git config --global user.email)"
echo "  user.signingkey = $(git config --global user.signingkey | cut -c1-50)..."

print_success "Git configuration updated successfully from 1Password!"