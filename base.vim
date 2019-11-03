""" BASE.vim
" This base file contains configurations that are used in both vim and nvim.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible        " Make vim not suck
filetype off            " Turn off filetype while doing configuration

set backspace=2         " Allow for backspace
set cursorline          " Highlight current line
set encoding=utf8       " UTF-8
set showcmd             " Show commands
set number              " Show line numbers
set nowrap              " Don't wrap lines. Why would you do that. 
set noeb vb             " No error bells or visual bells 
set t_vb=               " Set theme for visual bells as blank
set linespace=2         " Give the font some room

set nobackup            " Turn off backup files
set noswapfile          " Turn off swap files
set nowritebackup       " Turn off automatic write backup

set hlsearch            " Highlight search matches
set incsearch           " Starts searching before 'enter' is pressed

set autoindent          " Automatically indent new lines
set expandtab           " Tabs are spaces
set smartindent
set smarttab            " Be 'smart' when using tabs
set shiftwidth=4        " Set 1 tab = 4 spaces
set tabstop=4

set splitbelow          " Horizontal tabs open below
set splitright          " Vertical tabs open on the right

set foldmethod=syntax   " Folds are defined by syntax highlighting
set list
set listchars=tab:\ \ ,precedes:<,extends:> " shows characters '<' and '>' for lines starting before and/or ending after the viewport, respectively
set fillchars+=vert:\       " Display nothing in vertical split


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

" Save buffer
nnoremap <Leader>w :w<CR>
" Close buffer
nnoremap <Leader>q :q<CR>
" Open horizontal split
nnoremap <Leader>s :sp<Space><CR>
" Open vertical split
nnoremap <Leader>v :vsp<Space><CR>
" Clear search highlighting
nnoremap <Leader>c :let @/= ""<CR>
" Toggle menubar
nnoremap <Leader>g :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

"""
""" Plugin Mapping
"""

" Toggle NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load specific configuartions for vim  and nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("nvim")
    " Open current directory in current buffer with NERDTree
    nnoremap N :edit .<CR>
    runtime nvimrc.vim
else
    nnoremap N :open .<CR>
    runtime vimrc.vim
endif
