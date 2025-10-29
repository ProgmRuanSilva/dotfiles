#!/bin/bash

source $HOME/dotfiles/bin/utils.sh

install () {
  u_bold "Copying ngrok config..."
  cp -r ../ngrok ~/.config/

  u_success "ngrok installed"
}

install

