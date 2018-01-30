#!/bin/bash

# WARNING: This file didn't work. Still WIP.

cd "$(dirname "${BASH_SOURCE[0]-$0}")"
git pull origin master

# Do it quick with rsync
function install() {
    rsync --exclude ".git/" \
          --exclude "bootstrap.sh" \
          --exclude "LICENSE" \
          --exclude "README.md" \
          --exclude "nvim/" -av --no-perms . ${HOME}
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    install
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        install
    fi
fi

unset install
source ~/.zshrc