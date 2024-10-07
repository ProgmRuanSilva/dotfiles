#!/bin/bash

source $HOME/dotfiles/bin/utils.sh

install () {
  u_bold "Copying .gitconfig config..."
  cp -r ../git/.gitconfig ~/

  u_success "gitconfig installed"
}

install
