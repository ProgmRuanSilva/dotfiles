#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "FZF Config"

u_bold "Linking .fzf.zsh..."
ln -sf "$DOTFILES_DIR/config/fzf/.fzf.zsh" "$HOME/.fzf.zsh"

u_success "FZF setup complete"
