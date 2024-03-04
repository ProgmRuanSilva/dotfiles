#!/bin/bash

install () {
  source $HOME/dotfiles/bin/utils.sh

  u_header "Asdf Installer"

  u_bold "Installing asdf..."
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1

  u_success "Asdf Installed"

  options=("node.js" "python" "ruby" "golang" "rust" "lua" "Quit")

  while true; do
      u_header "Select a programming language to install:"
      for i in "${!options[@]}"; do
          u_arrow "$((i+1)). ${options[$i]}"
      done

      u_bold_read "Enter the numbers of your choice or 'q' to quit: " input

      if [ "$input" = "q" ]; then
          break
      fi

      IFS=',' read -ra choices <<< "$input"

      invalid_choice=false

      for choice in "${choices[@]}"; do
          if ! [[ "$choice" =~ ^[0-9]+$ ]] || ((choice < 1)) || ((choice > ${#options[@]})); then
              u_error "Invalid choice: $choice. Please enter valid numbers between 1 and ${#options[@]}"
              invalid_choice=true
              break
          fi
      done

      if [ "$invalid_choice" = true ]; then
          continue
      fi

      for choice in "${choices[@]}"; do
          selected_option="${options[$((choice-1))]}"
          if [ "$selected_option" != "Quit" ]; then
              u_success "Installing $selected_option"
              read -p "Enter the version for $selected_option (press Enter for latest): " version

              case $selected_option in
                  "node.js")
                      asdf plugin add nodejs
                      if [ -z "$version" ]; then
                          version="latest"
                      fi
                      asdf install nodejs "$version"
                      asdf global nodejs "$version"
                      ;;
                  "python")
                      asdf plugin add python
                      if [ -z "$version" ]; then
                          version="latest"
                      fi
                      asdf install python "$version"
                      asdf global python "$version"
                      ;;
                  "ruby")
                      asdf plugin add ruby
                      if [ -z "$version" ]; then
                          version="latest"
                      fi
                      asdf install ruby "$version"
                      asdf global ruby "$version"
                      ;;
                  "golang")
                      asdf plugin add golang
                      if [ -z "$version" ]; then
                          version="latest"
                      fi
                      asdf install golang "$version"
                      asdf global golang "$version"
                      ;;
                  "rust")
                      asdf plugin add rust
                      if [ -z "$version" ]; then
                          version="latest"
                      fi
                      asdf install rust "$version"
                      asdf global rust "$version"
                      ;;
                  "lua")
                      asdf plugin add lua
                      if [ -z "$version" ]; then
                          version="latest"
                      fi
                      asdf install lua "$version"
                      asdf global lua "$version"
                      ;;
                  *)
                      u_error "Invalid option: $selected_option"
                      ;;
              esac
          else
              u_warning "Quitting..."
              exit 0
          fi
      done
  done
  }

install
