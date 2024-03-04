#!/bin/bash

install () {
  source $HOME/dotfiles/bin/utils.sh

  u_header "NvChad Installer"

  u_bold "Installing NvChad..."
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1  && cp -r ../nvchad/custom/* ~/.config/nvim/lua/custom/ && nvim

  u_success "NvChad installed"
  break
}

install
