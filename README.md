# Soloa (.) Files

This is a collection of my dotfiles for both Windows & Linux (Debian 10)

## Linux Configuration

Distro: Debian 10
DE: XFCE
Shell: ZSH
Terminal: Alacritty
Editor: Neovim


## Configuring Vim & NeoVim

In the default vimrc add the following lines:

    rtp+=PATH_TO_THIS_DIRECTORY
    runtime base.vim

if using regular vim, install Vundle

    git clone git://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if using neovim, install Plug

    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

Install plugins and restart vim

    vim +PluginInstall +qall && vim
    nvim +PlugInstall +qall && nvim
