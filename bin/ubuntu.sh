#!/bin/bash

source $HOME/dotfiles/scripts/utils.sh

update() {
  sudo apt-get update && sudo apt-get instal sqlite3 libsqlite3-dev mysql-server libmysqlclient-dev postgresql postgresql-client postgresql-contrib libpq-dev redis-server memcached imagemagick ffmpeg mupdf mupdf-tools libxml2-dev build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget liblzma-dev curl gcc git vim ripgrep zsh fzf make libz-dev openssl libyaml-dev cmake
}

update
