#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "Lazygit"

CONFIG_DIR="$HOME/.config/lazygit"
mkdir -p "$CONFIG_DIR"

u_bold "Linking lazygit config..."
ln -sf "$DOTFILES_DIR/config/lazygit/config.yml" "$CONFIG_DIR/config.yml"

u_success "Lazygit linked"
