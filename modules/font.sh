#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "Fonts"

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

u_bold "Copying fonts..."
cp -r "$DOTFILES_DIR/assets/fonts/"* "$FONT_DIR/" 2>/dev/null

u_bold "Refreshing font cache..."
fc-cache -f

u_success "Fonts installed"
