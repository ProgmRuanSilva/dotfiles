#!/bin/bash

source $HOME/dotfiles/bin/utils.sh

install () {
  u_bold "Copying fzf config..."
  cp -r ../fzf/.fzf.zsh ~/

  u_success "fzf installed"
}

install
