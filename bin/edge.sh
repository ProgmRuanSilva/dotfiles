#!/bin/bash

install () {
  source $HOME/dotfiles/bin/utils.sh

  u_header "Microsoft Edge"

  u_bold "Installing Microsoft Edge..."
  # curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  # sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/
  # sudo sh -c 'echo deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main > /etc/apt/sources.list.d/microsoft-edge-beta.list'
  # sudo rm microsoft.gpg
  #
  # sudo apt update
  # sudo apt install microsoft-edge-beta
  yay -S mcrosoft-edge-beta-bin

  u_success "Installed Microsoft Edge"
}

install
