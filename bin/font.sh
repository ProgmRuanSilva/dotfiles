#!/bin/bash

source $HOME/dotfiles/bin/utils.sh

install () {
  u_bold "Copying font..."
  mkdir -p ~/.local/share/fonts/
  cp -r ../font/* ~/.local/share/fonts/

  u_success "font copied"
}

install

