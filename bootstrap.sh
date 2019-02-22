#!/bin/bash

# WARNING: This file didn't work. Still WIP.

cd "$(dirname "${BASH_SOURCE[0]-$0}")"
git pull origin master

# Do it quick with rsync
function install() {
    echo "## Check distro"
    # try various methods, in order of preference, to detect distro
    # store result in variable 'distro'
    if type lsb_release > /dev/null 2>&1 ; then
        distro=$(lsb_release -i -s)
    elif [ -e /etc/os-release ]; then
        distro=$(awk -F= '$1 == "ID" {print $2}' /etc/os-release)
    elif [ -e /etc/lsb-release ]; then
        # For some version of Debian/Ubuntu without lsb_release command
        distro=$(ihavenfihowtohandleotherhypotheticalreleasefiles)
    elif [ -e /etc/redhat-release ]; then
        # Older Red Hat, CentOS; etc
        distro=$(ihavenfihowtohandleotherhypotheticalreleasefiles)
    elif [ -e /etc/SuSe-release ]; then
        # Older SuSE/etc
        distro=$(ihavenfihowtohandleotherhypotheticalreleasefiles)
    fi

    # convert to lowercase
    distro=$(printf '%s\n' "$distro" | LC_ALL=C tr '[:upper:]' '[:lower:]')

    # now do different things depending on distro
    case "${distro}" in
        # Set prefix, the dependencies are the same in different distro
        debian*|ubuntu|mint*) pkg_install_prefix="sudo apt install -y"; distro_pkgs="python3-dev python-dev rofi dunst tint2";; # For Distro based on Ubuntu 18.04 (and up)
        centos*)         pkg_install_prefix="sudo yum install -y"; distro_pkgs="python3-devel python-devel";;
        *)               echo "unknow distro: ${distro}"; exit 1;;
    esac

    echo "## Install dependencies for ${distro}"
    common_pkgs="curl wget zsh git neovim python3-pip python-pip fish golang"
    pkg_install="${pkg_install_prefix} ${common_pkgs} ${distro_pkgs}"
    $pkg_install

    echo "## Install oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # echo "## Install oh-my-fish"
    # sudo curl -L https://get.oh-my.fish > install
    # sudo fish install --path=~/.local/share/omf --config=~/.config/omf

    echo "## Install fzf"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

    # Uncomment if want to use
    # echo "## Install diff-so-fancy"
    # sudo wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy -O /usr/local/bin/diff-so-fancy
    # sudo chmod +x /usr/local/bin/diff-so-fancy

	# echo "## Install snap packages"
	# sudo snap install hugo spotify

    rsync --exclude ".git/" \
          --exclude "bootstrap.sh" \
          --exclude "LICENSE" \
          --exclude "README.md" \
          --exclude "Makefile" \
          --exclude "python-pkgs.txt" \
          -av --no-perms . ${HOME}
	sudo cp -r .fonts/* /usr/share/fonts
    sudo fc-cache -fv
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
