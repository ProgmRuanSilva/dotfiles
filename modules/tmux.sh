#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "Tmux & TPM"

u_bold "Installing tmux..."
sudo pacman -S --noconfirm tmux

TMUX_CONFIG_DIR="$HOME/.config/tmux"
mkdir -p "$TMUX_CONFIG_DIR"

u_bold "Linking tmux.conf..."
ln -sf "$DOTFILES_DIR/config/tmux/tmux.conf" "$TMUX_CONFIG_DIR/tmux.conf"

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    u_bold "Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

u_success "Tmux setup complete"
u_note "Press 'Ctrl + B' then 'I' inside tmux to install plugins."
