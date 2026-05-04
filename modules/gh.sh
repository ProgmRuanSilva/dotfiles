#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "GitHub CLI"

if ! type -p gh >/dev/null; then
    u_bold "Installing GitHub CLI..."
    sudo pacman -S --noconfirm github-cli
fi

u_bold "Authenticating with GitHub..."
u_note "You will need to log in manually."
gh auth login

u_success "GitHub CLI setup complete"
