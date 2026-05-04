#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "Lazydocker"

CONFIG_DIR="$HOME/.config/lazydocker"
mkdir -p "$CONFIG_DIR"

u_bold "Linking lazydocker config..."
ln -sf "$DOTFILES_DIR/config/lazydocker/config.yml" "$CONFIG_DIR/config.yml"

u_success "Lazydocker linked"
