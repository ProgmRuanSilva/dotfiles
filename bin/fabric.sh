#!/bin/bash

source $HOME/dotfiles/bin/utils.sh

install () {
  u_header "Fabric"

  u_bold "Installing Fabric..."
  go install github.com/danielmiessler/fabric@latest
  go install github.com/danielmiessler/yt@latest
  u_success "Fabric installed"
}

install
