#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "Ngrok Config"

CONFIG_DIR="$HOME/.config/ngrok"
mkdir -p "$CONFIG_DIR"

u_bold "Linking ngrok.yml..."
ln -sf "$DOTFILES_DIR/config/ngrok/ngrok.yml" "$CONFIG_DIR/ngrok.yml"

u_success "Ngrok config linked"
