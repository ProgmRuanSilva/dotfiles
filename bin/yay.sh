#!/bin/bash

source $HOME/dotfiles/bin/utils.sh

install(){

  u_header "Yay"

  u_bold "Creating configuration file..."
  if [ ! -d ~/.config/yay ]; then
    mkdir ~/.config/yay
  fi
  u_bold "Copying configuration file..."
  cp -r ../yay/config.json ~/.config/yay/

  u_success "Yay installed"
}

install
