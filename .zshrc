#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export TERM="xterm-256color"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# Preferred editor for local and remote sessions
if ! type "$nvim" > /dev/null; then
    export EDITOR='nvim'
else
    export EDITOR='vim'
fi

# Aliases
source ~/.aliases

# Virtualenvwrapper envs
export WORKON_HOME=${HOME}/Workspace/venv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

# Star, Hammer & sickle icons
POWERLEVEL9K_CONTEXT_TEMPLATE="%F{yellow}\u2605 \u262D"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="red"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="red"
# Python, Vim, Docker icons
# POWERLEVEL9K_CONTEXT_TEMPLATE="\ue63a %F{yellow}\ue63c %F{cyan}\ue6c5 %F{blue}\ue6b0"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs virtualenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ram root_indicator)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{cyan}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

# Uncomment it if you need kubernetes completion
# source <(kubectl completion zsh)
# https://github.com/ahmetb/kubectl-aliases
# source ~/.kubectl_aliases

#####################################
# Pure - Uncomment it if use pure themes
# fpath=( "$ZSH/functions" $fpath )
# autoload -U promptinit; promptinit
# prompt pure
# PURE_PROMPT_SYMBOL="➠"

###########################################
# Spaceship - Uncomment it if use spaceship
SPACESHIP_CHAR_SYMBOL="%F{1}\uf2d6 %B%F{1}❯%F{3}❯%F{2}❯%f%b "

if [[ $TERM == xterm-termite ]]; then                                          
    . /etc/profile.d/vte-2.91.sh                                               
    __vte_osc7                                                                 
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
