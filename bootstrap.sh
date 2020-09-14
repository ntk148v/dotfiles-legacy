#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]-$0}")"
git pull origin master
git submodule update --init --recursive

# Do it quick with rsync
function install() {
    echo "## Check distro"
    # try various methods, in order of preference, to detect distro
    # store result in variable 'distro'
    if type lsb_release >/dev/null 2>&1; then
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
    debian* | ubuntu | *mint*)
        pkg_install_prefix="sudo apt install -y"
        echo "## Add neovim repository"
        sudo add-apt-repository ppa:neovim-ppa/stable -y && sudo apt update
        distro_pkgs="python3-dev python-dev rofi dunst tint2 software-properties-common synaptic make build-essential neovim"
        ;; # For Distro based on Ubuntu 18.04 (and up)
    centos*)
        echo "## Add EPEL repo"
        yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
        pkg_install_prefix="sudo yum install -y"
        distro_pkgs="python3-devel python-devel neovim python3-neovim"
        ;;
    *)
        echo "unknow distro: ${distro}"
        exit 1
        ;;
    esac

    echo "## Install dependencies for ${distro}"
    common_pkgs="curl wget zsh git python3-pip python-pip fish"
    pkg_install="${pkg_install_prefix} ${common_pkgs} ${distro_pkgs}"
    $pkg_install

    echo "## Create directories"
    mkdir -p $HOME/Workspace/github-repos
    mkdir -p $HOME/Workspace/openstack
    mkdir -p $HOME/Apps

    # Comment if you don't use MT7630e wifi driver - it sucks anw.
    echo "## Clone MT7630e to build manually"
    git clone https://github.com/neurobin/MT7630E $HOME/Workspace/github-repos/MT7630E

    echo "## Install vim-plug"
    sh -c "$(curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim)"

    echo "## Install oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # echo "## Install oh-my-fish"
    # sudo curl -L https://get.oh-my.fish > install
    # sudo fish install --path=$HOME/.local/share/omf --config=$HOME/.config/omf

    echo "## Install fzf"
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
    $HOME/.fzf/install

    echo "## Install pywal"
    sudo -H pip3 install -U pywal wpgtk

    echo "## Install golang 1.12"
    wget https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz -O /tmp/go1.12.7.linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf /tmp/go1.12.7.linux-amd64.tar.gz

    rsync --exclude ".git/" \
        --exclude "bootstrap.sh" \
        --exclude "LICENSE" \
        --exclude "README.md" \
        --exclude "Makefile" \
        --exclude "python-pkgs.txt" \
        -av --no-perms . ${HOME}

    echo "## Install snap packages"
    sudo snap install spotify
    sudo snap install hugo --channel=extended
    sudo snap install goland --classic
    sudo snap install postman
    sudo snap install pycharm-professional --classic
    sudo snap install code --classic
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
exec zsh
# This is my alias
aptuu
