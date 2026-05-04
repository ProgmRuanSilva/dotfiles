#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "ASDF Version Manager"

if ! type -p asdf >/dev/null; then
    u_bold "Installing asdf-vm..."
    yay -S --noconfirm asdf-vm
    # Add to current session
    source /opt/asdf-vm/asdf.sh
fi

languages=("nodejs" "python" "ruby" "golang" "rust" "lua")

for lang in "${languages[@]}"; do
    u_bold "Installing $lang (latest)..."
    asdf plugin add "$lang" 2>/dev/null
    asdf install "$lang" latest
    asdf global "$lang" latest
done

u_success "ASDF languages installed"
