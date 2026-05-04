#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "Yay Config"

CONFIG_DIR="$HOME/.config/yay"
mkdir -p "$CONFIG_DIR"

u_bold "Linking yay config..."
ln -sf "$DOTFILES_DIR/config/yay/config.json" "$CONFIG_DIR/config.json"

u_success "Yay config linked"
