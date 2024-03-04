#!/bin/bash

source $HOME/dotfiles/bin/utils.sh

install(){

  u_header "Lazygit"

  u_bold "Installing Lazygit..."

  yay -S --noconfirm lazygit

  u_bold "Creating configuration file..."
  if [ ! -d ~/.config/lazygit ]; then
    mkdir ~/.config/lazygit
  fi
  u_bold "Copying configuration file..."
  cp -r ../lazygit/config.yml ~/.config/lazygit/

  u_success "Lazygit installed"
}

install
