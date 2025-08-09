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

# Check if Fish is installed
if ! command -v fish &> /dev/null; then
    print_error "Fish shell is not installed."
    echo "Please install it first:"
    echo "  macOS: brew install fish"
    echo "  Linux: apt install fish (or your package manager)"
    exit 1
fi

FISH_PATH="$(which fish)"
CURRENT_SHELL="$SHELL"

print_info "Current shell: $CURRENT_SHELL"
print_info "Fish shell location: $FISH_PATH"

# Check if Fish is already the default shell
if [ "$CURRENT_SHELL" = "$FISH_PATH" ]; then
    print_success "Fish is already your default shell!"
    exit 0
fi

# Check if Fish is already in /etc/shells
if grep -q "^$FISH_PATH$" /etc/shells 2>/dev/null; then
    print_info "Fish is already registered in /etc/shells"
else
    print_step "Adding Fish to /etc/shells (requires sudo)..."
    
    # Confirm before using sudo
    echo "This operation requires administrator privileges."
    read -p "Do you want to continue? (y/N): " -n 1 -r
    echo
    
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Operation cancelled by user."
        exit 0
    fi
    
    if echo "$FISH_PATH" | sudo tee -a /etc/shells > /dev/null; then
        print_success "Fish added to /etc/shells"
    else
        print_error "Failed to add Fish to /etc/shells"
        exit 1
    fi
fi

# Change default shell to Fish
print_step "Changing default shell to Fish..."
echo "This will change your default shell for user: $(whoami)"
read -p "Do you want to continue? (y/N): " -n 1 -r
echo

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_info "Operation cancelled by user."
    exit 0
fi

if chsh -s "$FISH_PATH"; then
    print_success "Default shell changed to Fish!"
    echo ""
    print_info "Next steps:"
    echo "  1. Log out and log back in for the change to take effect"
    echo "  2. Or start a new Fish session now: fish"
    echo ""
    print_success "Fish shell setup completed successfully!"
else
    print_error "Failed to change default shell"
    echo "You may need to run: chsh -s $FISH_PATH"
    exit 1
fi