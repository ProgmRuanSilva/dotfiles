#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "Antigravity"

CONFIG_DIR="$HOME/.config/Antigravity/User"
mkdir -p "$CONFIG_DIR"

u_bold "Linking Antigravity config..."
ln -sf "$DOTFILES_DIR/config/vscode/settings.json" "$CONFIG_DIR/settings.json"
ln -sf "$DOTFILES_DIR/config/vscode/keybindings.json" "$CONFIG_DIR/keybindings.json"

u_success "Antigravity linked"
