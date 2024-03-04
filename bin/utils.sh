#!/bin/bash

# Checks 
seek_confirmation() {
  printf "\n${bold}$@${reset}"
  read -p " (y/n) " -n 1
  printf "\n"
}

is_confirmed() {
  if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    return 0
  fi
  return 1
}

type_exists() {
  if [ $(type -P $1) ]; then
    return 0
  fi
  return 1
}

# System
sys_check () {
  if [ -e /etc/os-release ]; then
      # Source the file to set environment variables
      . /etc/os-release

      # Print distribution information
      echo "Distribution: $NAME"
      echo "Version: $VERSION"
      echo "ID: $ID"
  else
      echo "Unable to determine the Linux distribution."
  fi
}

is_os() {
  if [[ "${OSTYPE}" == $1* ]]; then
    return 0
  fi
  return 1
}

# UI
bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)

# Headers and  Logging

u_header() { printf "\n${bold}${purple}==========  %s  ==========${reset}\n" "$@"
}
u_arrow() { printf "➜ $@\n"
}
u_success() { printf "${green}✔ %s${reset}\n" "$@"
}
u_error() { printf "${red}✖ %s${reset}\n" "$@"
}
u_warning() { printf "${tan}➜ %s${reset}\n" "$@"
}
u_underline() { printf "${underline}${bold}%s${reset}\n" "$@"
}
u_bold() { printf "${bold}%s${reset}\n" "$@"
}
u_note() { printf "${underline}${bold}${blue}Note:${reset}  ${blue}%s${reset}\n" "$@"
}
u_bold_read() {
    echo -e "\033[1m$@\033[0m"
    read -r input
}
u_step() {
    # Usage: echo_step  "1. this is the step 1"
    echo -e '\033[0;32m'"$1"'\033[0m'
}
u_separator() {
    printf "${purple}====================================================================\n${reset}"
}
u_in_processing_bar() {
    # Usage: bar 1 10
    #            ^----- Elapsed Percentage (0-100).
    #               ^-- Total length in chars.
    ((elapsed=$1*$2/100))

    # Create the bar with spaces.
    printf -v prog  "%${elapsed}s"
    printf -v total "%$(($2-elapsed))s"

    printf '%s\r' "[${prog// /-}${total}]"
}

# Commands
run_command_in_background() {
    # Usage: run_command_in_background ./some_script.sh
    (nohup "$@" &>/dev/null &)
}

# Strings
  # reference https://github.com/dylanaraps/pure-bash-bible

string_trim() {
    # Usage: string_trim "   example   string    "
    : "${1#"${1%%[![:space:]]*}"}"
    : "${_%"${_##*[![:space:]]}"}"
    printf '%s\n' "$_"
}

string_split() {
   # Usage: string_split "string" "delimiter"
   IFS=$'\n' read -d "" -ra arr <<< "${1//$2/$'\n'}"
   printf '%s\n' "${arr[@]}"
}

string_lstrip() {
    # Usage: string_lstrip "string" "pattern"
    printf '%s\n' "${1##$2}"
}

string_rstrip() {
    # Usage: string_rstrip "string" "pattern"
    printf '%s\n' "${1%%$2}"
}

# Requires bash 4+
string_to_lower() {
    # Usage: string_to_lower "string"
    printf '%s\n' "${1,,}"
}

# Requires bash 4+
string_to_upper() {
    # Usage: string_to_upper "string"
    printf '%s\n' "${1^^}"
}

string_contains() {
    # Usage: string_contains hello he
    [[ "${1}" == *${2}* ]]
}

string_starts_with() {
    # Usage: string_starts_with hello he
    [[ "${1}" == ${2}* ]]
}


string_ends_with() {
    # Usage: string_ends_wit hello lo
    [[ "${1}" == *${2} ]]
}


string_regex() {
    # Usage: string_regex "string" "regex"
    [[ $1 =~ $2 ]] && printf '%s\n' "${BASH_REMATCH[1]}"
}
