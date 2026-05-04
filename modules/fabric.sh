#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "Fabric"

u_bold "Installing Fabric..."
go install github.com/danielmiessler/fabric@latest
go install github.com/danielmiessler/yt@latest

u_success "Fabric installed"
