#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "Starship Prompt"

if ! type -p starship >/dev/null; then
    u_bold "Installing starship..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

STARSHIP_DIR="$HOME/.config/starship"
mkdir -p "$STARSHIP_DIR"

u_bold "Linking starship.toml..."
ln -sf "$DOTFILES_DIR/config/starship/starship.toml" "$STARSHIP_DIR/starship.toml"

u_success "Starship setup complete"
