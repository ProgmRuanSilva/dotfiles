#!/bin/bash

# Load utilities
DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/bin/utils.sh"

u_header "Flatpak Backup"

u_bold "Exporting Flatpak app list..."
flatpak list --app --columns=application > "$DOTFILES_DIR/flatpak/flatpak-apps.txt"

u_bold "Exporting Flatpak remotes..."
flatpak remotes > "$DOTFILES_DIR/flatpak/flatpak-remotes.txt"

u_success "Flatpak app list and remotes backed up to flatpak/"
