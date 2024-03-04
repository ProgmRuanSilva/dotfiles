#!/bin/bash

nvim() {
  source $HOME/dotfiles/bin/utils.sh

  u_header "Nvim Installer"

  u_bold "Installing nvim..."
  sudo pacman -S --noconfirm neovim
  u_success "Nvim installed"

  u_bold "Installing Ruan Silva's nvim..."
  git clone https://github.com/ProgmRuanSilva/nvim ~/.config/nvim

  u_note "Run: nvim to complete installation"

  u_success "Nvim installed"
}

nvim
