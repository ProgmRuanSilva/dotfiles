#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "Neovim Config"

NVIM_CONFIG_DIR="$HOME/.config/nvim"

if [ -d "$NVIM_CONFIG_DIR" ]; then
    u_warning "Removing existing nvim config..."
    rm -rf "$NVIM_CONFIG_DIR"
fi

u_bold "Cloning Neovim config from ProgmRuanSilva/nvim..."
git clone https://github.com/ProgmRuanSilva/nvim "$NVIM_CONFIG_DIR"

u_success "Neovim config cloned"
u_note "Run 'nvim' to finish installation."
