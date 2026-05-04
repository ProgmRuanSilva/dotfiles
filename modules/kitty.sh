#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "Kitty Terminal"

KITTY_DIR="$HOME/.config/kitty"
mkdir -p "$KITTY_DIR"

u_bold "Linking kitty configs..."
ln -sf "$DOTFILES_DIR/config/kitty/kitty.conf" "$KITTY_DIR/kitty.conf"
ln -sf "$DOTFILES_DIR/config/kitty/diff.conf" "$KITTY_DIR/diff.conf"
ln -sf "$DOTFILES_DIR/config/kitty/dracula.conf" "$KITTY_DIR/dracula.conf"

u_success "Kitty config linked"
