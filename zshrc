# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Easy access to dotfiles
export dotfiles="$HOME/Documents/dotfiles"

# Configure and init pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# Lazy init — pyenv shims activate on first use
eval "$(pyenv init --path)"
eval "$(pyenv init - --no-rehash)"

# Configure os specific
case `uname` in
    Darwin)  # OSX
        ANTIGEN_PATH=/opt/homebrew/share/antigen/antigen.zsh
        ll_COMMAND='gls -1F --group-directories-first --color'
    ;;
    Linux)  # Linux
        ANTIGEN_PATH=/usr/share/zsh-antigen/antigen.zsh
        ll_COMMAND='ls -1F --group-directories-first'
    ;;
esac

source $ANTIGEN_PATH

function cursor() {
    # Open cursor at the provided path
    open -a "Cursor" "$@"
}


# Start tmux
# 1. Use command to check for the existence of tmux
# 2. Use "$PS`" to check if we're in an interactive shell
# 3. Make sure tmux does not run within tmux
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

# Spacheship prompt options
SPACESHIP_DOCKER_SHOW=false

# Install antigen bundles and themes
antigen use oh-my-zsh
    antigen bundle colored-man-pages
    antigen bundle git
    antigen bundle pyenv
    antigen bundle srijanshetty/zsh-pip-completion
    antigen bundle supercrabtree/k
    antigen bundle valentinocossar/sublime
    antigen theme romkatv/powerlevel10k
antigen apply


source $dotfiles/gcpx.sh

# Create ll alias
alias ll=$ll_COMMAND

# Create git aliases
alias gs='git status .'
alias gret='cd `git rev-parse --show-toplevel`'

# Add scripts folder to path
export PATH="$HOME/Documents/scripts:$PATH"

# Created by `pipx` on 2023-12-29 13:33:46
export PATH="$PATH:/Users/shel/.local/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/shel/Documents/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/shel/Documents/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/shel/Documents/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/shel/Documents/google-cloud-sdk/completion.zsh.inc'; fi

# Remove oh-my-zsh resetting screen on commands like git log
unset LESS

# fnm
export PATH="$HOME/.fnm:$PATH"
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"


# pnpm
export PNPM_HOME="/Users/shel/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(direnv hook zsh)"
