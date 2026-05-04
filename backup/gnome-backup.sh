#!/bin/bash

# Load utilities
DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/bin/utils.sh"

u_header "GNOME Backup"

u_bold "Dumping dconf settings..."
dconf dump /org/gnome/ > "$DOTFILES_DIR/assets/gnome/gnome-settings.dconf"
dconf dump /org/gnome/shell/extensions/ > "$DOTFILES_DIR/assets/gnome/extensions-settings.dconf"

u_bold "Exporting extension list..."
gnome-extensions list --enabled > "$DOTFILES_DIR/assets/gnome/gnome-extensions-list.txt"

u_bold "Backing up themes and icons..."
# Check if directories exist before copying
if [ -d "$HOME/.themes" ]; then
    cp -r "$HOME/.themes/"* "$DOTFILES_DIR/assets/gnome/themes/" 2>/dev/null
fi

if [ -d "$HOME/.local/share/icons" ]; then
    cp -r "$HOME/.local/share/icons/"* "$DOTFILES_DIR/assets/gnome/icons/" 2>/dev/null
fi

u_success "GNOME configurations backed up to assets/gnome/"
