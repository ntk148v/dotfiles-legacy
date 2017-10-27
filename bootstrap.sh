#!/usr/bin/zsh

# Date for use when naming backup files
DATE=`date +%Y%m%d`

echo "Install Oh-my-zsh!"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ntk148v/oh-my-zsh/master/tools/install.sh)"

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
if [ -d "${HOME}/.vim"]; then
    echo "Recursively coping ${PWD}/.vim/* to ${HOME}/.vim"
    cp -r ${PWD}/.vim/* ${HOME}/vim
fi
