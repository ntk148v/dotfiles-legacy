#!/usr/bin/zsh

# We also have to unset other variables that might impact LC_ALL
# taking effect.
unset LANG
unset LANGUAGE
LC_ALL=en_US.utf8
export LC_ALL

# Make sure umask is sane
umask 022

XTRACE=$(set +o | grep xtrace)
set -o xtrace

# Date for use when naming backup files
DATE=`date +%Y%m%d`

echo "Install Custom Oh-my-zsh & Powerlevel9k!"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ntk148v/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/paulirish/git-open.git ~/.oh-my-zsh/custom/plugins/git-open

echo "Install Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Check if dot files already exist:
for FILE in ".vimrc" ".zshrc" ".gitconfig"; do
    if [ -f "${HOME}/${FILE}" ]; then
        if [ -L "${HOME}/${FILE}" ]; then
            echo "Unlinking ${HOME}/${FILE}"
            unlink ${HOME}/${FILE}
        else
            echo "Backing up ${HOME}/${FILE} to ${HOME}/${FILE}-${DATE}.bak"
            mv ${HOME}/${FILE} ${HOME}/${FILE}-${DATE}.bak
        fi
    fi
    echo "Linking `pwd`/${FILE} ${HOME}/${FILE}"
    ln -s `pwd`/${FILE} ${HOME}/${FILE}
done

# Special casing the .vim directory
# Have to copy new .vim info into the user's ~/.vim recursively
if ! [ -d "${HOME}/.vim" ]; then
    mkdir ${HOME}/.vim
fi
echo "Recursively coping ${PWD}/.vim/* to ${HOME}/.vim"
cp -r ${PWD}/.vim/* ${HOME}/vim

vim +PluginInstall +qall

# Restore xtrace
$XTRACE
