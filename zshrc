# Configure Google Cloud SDK autocompletion
CLOUD_SDK_HOME=~/.local/share/google-cloud-sdk
source "${CLOUD_SDK_HOME}/completion.zsh.inc"

# Configure and init pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Load antigen
source /usr/share/zsh-antigen/antigen.zsh

# Start tmux
# 1. Use command to check for the existence of tmux
# 2. Use "$PS`" to check if we're in an interactive shell
# 3. Make sure tmux does not run within tmux
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

# Configure NVM
export NVM_DIR="$HOME/.config/nvm"

# Spacheship prompt options
SPACESHIP_DOCKER_SHOW=false

# Install antigen bundles and themes
antigen use oh-my-zsh
    antigen bundle colored-man-pages
    antigen bundle git
    antigen bundle pyenv
    antigen bundle lukechilds/zsh-nvm
    antigen bundle srijanshetty/zsh-pip-completion
    antigen bundle supercrabtree/k
    antigen bundle valentinocossar/sublime
    antigen theme denysdovhan/spaceship-prompt
antigen apply

# Easy access to dotfiles
export dotfiles="$HOME/Documents/dotfiles"

# Create ll alias
alias ll='ls -1F --group-directories-first'

# Create git aliases
alias gs='git status .'
alias gret='cd `git rev-parse --show-toplevel`'

# Add scripts folder to path
export PATH="$HOME/Documents/scripts:$PATH"
