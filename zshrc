source /usr/share/zsh-antigen/antigen.zsh

# Configurations
export NVM_DIR="$HOME/.config/nvm"

# Bundles
antigen use oh-my-zsh

antigen bundle colored-man-pages
antigen bundle git
antigen bundle lukechilds/zsh-nvm
antigen bundle valentinocossar/sublime 

# Themes
antigen theme denysdovhan/spaceship-prompt

antigen apply
