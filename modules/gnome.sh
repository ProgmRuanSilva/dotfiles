#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "GNOME Settings & UI"

u_bold "Restoring themes and icons..."
mkdir -p "$HOME/.themes"
mkdir -p "$HOME/.local/share/icons"

cp -r "$DOTFILES_DIR/assets/gnome/themes/"* "$HOME/.themes/" 2>/dev/null
cp -r "$DOTFILES_DIR/assets/gnome/icons/"* "$HOME/.local/share/icons/" 2>/dev/null

u_bold "Loading dconf settings..."
if [ -f "$DOTFILES_DIR/assets/gnome/gnome-settings.dconf" ]; then
    dconf load /org/gnome/ < "$DOTFILES_DIR/assets/gnome/gnome-settings.dconf"
fi

if [ -f "$DOTFILES_DIR/assets/gnome/extensions-settings.dconf" ]; then
    dconf load /org/gnome/shell/extensions/ < "$DOTFILES_DIR/assets/gnome/extensions-settings.dconf"
fi

u_success "GNOME settings restored"
u_note "You might need to restart GNOME (Alt+F2 > r) or re-login."
