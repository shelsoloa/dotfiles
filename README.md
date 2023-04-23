# Soloa DotFiles

This is a collection of my dotfiles for both Windows, Ubuntu, and OSX

## Linux Configuration

- Distro: Ubuntu
- DE: XFCE
- Shell: ZSH
- Terminal: Alacritty
- Editors: Neovim
- Tools: Antigen, Pyenv

# ZSH

## On Linux


## On Mac
Install antigen through brew
```
brew install antigen
```

install coreutils for aliases
```
brew install coreutils
```


# Vim & NeoVim

In the default vimrc add the following lines:

Add the following lines to your rc file. For Vim the file is located at `~/.vimrc` for nvim it is located at `~/.config/nvim/init.vim`.

```
set rtp+=PATH_TO_DOTFILES_DIRECTORY
runtime base.vim
```

### Complete Vim install
Install Vundle & install plugins
```
git clone git://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall && vim
```

### Complete NeoVim install:

Install Plug & install plugins

```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall && nvim
```