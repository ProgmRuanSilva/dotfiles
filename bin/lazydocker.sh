#!/bin/bash

source $HOME/dotfiles/bin/utils.sh

install(){

  u_header "Lazydocker"

  u_bold "Installing Lazydocker..."

  yay -S --noconfirm lazydocker

  u_bold "Creating configuration file..."
  if [ ! -d ~/.config/lazydocker ]; then
    mkdir ~/.config/lazydocker
  fi
  u_bold "Copying configuration file..."
  cp -r ../lazydocker/config.yml ~/.config/lazydocker/

  u_success "Lazygit installed"
}

install
