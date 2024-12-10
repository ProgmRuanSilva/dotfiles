#!/bin/bash

source $HOME/dotfiles/bin/utils.sh

install(){

  u_header "Alacritty"

  u_bold "Creating configuration file..."
  if [ ! -d ~/.config/alacritty ]; then
    mkdir ~/.config/alacritty
  fi
  u_bold "Copying configuration file..."
  cp -r ../alacritty/alacritty.toml ~/.config/alacritty/

  u_success "Alacritty installed"
}

install
