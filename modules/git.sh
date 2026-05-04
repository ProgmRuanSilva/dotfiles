#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "Git Config"

u_bold "Linking .gitconfig..."
ln -sf "$DOTFILES_DIR/config/git/.gitconfig" "$HOME/.gitconfig"

u_success "Git config linked"
