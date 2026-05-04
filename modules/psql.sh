#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "PSQL DBA Toolkit"

CONFIG_DIR="$HOME/.config/psql"
mkdir -p "$CONFIG_DIR"

u_bold "Linking psql configurations..."
# Link all files inside config/psql/config/psql/ to ~/.config/psql/
# Based on previous structure: psql/config/psql/
for file in "$DOTFILES_DIR/config/psql/config/psql/"*; do
    [ -e "$file" ] || continue
    ln -sf "$file" "$CONFIG_DIR/$(basename "$file")"
done

u_bold "Linking .psqlrc..."
ln -sf "$DOTFILES_DIR/config/psql/config/.psqlrc" "$HOME/.psqlrc"

u_success "PSQL toolkit linked"
