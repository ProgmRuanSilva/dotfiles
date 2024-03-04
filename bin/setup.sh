#!/bin/bash

setup() {
    source $HOME/dotfiles/bin/utils.sh

    local sh_files=(*.sh)
    local options=("${sh_files[@]}")

    while true; do
        u_header "Dotfiles Installer"

        u_bold "Select scripts to run:"
        for i in "${!options[@]}"; do
            echo "$((i+1)). ${options[$i]}"
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
            if [ -f "$selected_option" ]; then
                u_success "Running: $selected_option"
                chmod +x "$selected_option"
                "./$selected_option"
            else
                u_error "Invalid option: $selected_option"
            fi
        done
    done
}

setup
