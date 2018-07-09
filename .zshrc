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

export EDITOR='nvim'

# Aliases
source ~/.aliases

# Virtualenvwrapper envs
export WORKON_HOME=${HOME}/Workspace/venv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

###############################################################
# Powerlevel9k - Uncomment it if you use powerlinelevel9k theme
POWERLEVEL9K_CONTEXT_TEMPLATE="$USER"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs virtualenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history ram time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

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
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  docker        # Docker section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  kubecontext   # Kubectl context section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  time          # Time stamps section
)

SPACESHIP_TIME_SHOW=true



if [[ $TERM == xterm-termite ]]; then
    . /etc/profile.d/vte-2.91.sh
    __vte_osc7
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The fuck alias
eval "$(thefuck --alias)"
