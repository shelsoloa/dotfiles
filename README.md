# Soloa (.) Files

This is a collection of all my dotfiles. Mainly for internal usage, but if you find anything cool in here, feel free to grab it.

## Installing Vim

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
