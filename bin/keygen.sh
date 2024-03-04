#!/bin/bash

source $HOME/dotfiles/bin/utils.sh

install () {
  u_bold "Generating keygen..."
  if [ ! -d ~/.ssh/ ]; then
    u_bold "Creating .ssh directory..."
    mkdir ~/.ssh/
  fi

  if [ ! -f ~/.ssh/id_*.pub ]; then
    u_bold "Generating keygen..."
    ssh-keygen
  else
    u_warning "Keygen already exists"
  fi
}

install

