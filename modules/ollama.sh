#!/bin/bash

DOTFILES_DIR="$HOME/dotfiles"
source "$DOTFILES_DIR/lib/utils.sh"

u_header "Ollama.ai"

u_bold "Installing Ollama.ai..."
curl -fsSL https://ollama.ai/install.sh | sh

u_success "Ollama.ai installed"
