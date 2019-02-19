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
          --exclude "Makefile" \
          --exclude "python-pkgs.txt" \
          -av --no-perms . ${HOME}
    fc-cache -fv
}

echo "Install diff-so-fancy"
sudo wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -O /usr/local/bin/diff-so-fancy
sudo chmod +x /usr/local/bin/diff-so-fancy

echo "Install z"
wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O  ~/.config/z.sh

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
