#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "Flatpak Apps"

if ! type -p flatpak >/dev/null; then
    u_bold "Installing flatpak..."
    sudo pacman -S --noconfirm flatpak
fi

u_bold "Adding Flathub remote..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

FLATPAK_LIST="$DOTFILES_DIR/flatpak/flatpak-apps.txt"

if [ -f "$FLATPAK_LIST" ]; then
    u_bold "Installing apps from list..."
    while IFS= read -r app_id; do
        [ -z "$app_id" ] && continue
        u_arrow "Installing $app_id..."
        flatpak install -y flathub "$app_id"
    done < "$FLATPAK_LIST"
else
    u_warning "Flatpak app list not found."
fi

u_success "Flatpak apps setup complete"
