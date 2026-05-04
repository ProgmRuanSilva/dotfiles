#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "Alacritty Terminal"

ALACRITTY_DIR="$HOME/.config/alacritty"
mkdir -p "$ALACRITTY_DIR"

u_bold "Linking alacritty.toml..."
ln -sf "$DOTFILES_DIR/config/alacritty/alacritty.toml" "$ALACRITTY_DIR/alacritty.toml"

u_success "Alacritty config linked"
