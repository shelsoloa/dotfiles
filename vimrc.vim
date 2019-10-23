"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible        " Make vim not suck
filetype off

set backspace=2         " Allow for backspace
set cursorline          " Highlight current line
set encoding=utf8
set showcmd             " Show commands
set number              " Show line numbers
set nowrap          
set noeb vb 
set t_vb= 
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

" Create statusline
set laststatus=2 " always show status bar
set statusline=
set statusline+=%#todo#
set statusline+=%f
set statusline+=%#error#
set statusline+=%m
set statusline+=%#todo#
set statusline+=%=
set statusline+=%y
set statusline+=\ [%l-%c/%L]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Preconf for Tlist. Requires reference to cTags
if has("win32") || has("win16")
    set rtp+=C:/Program\ Files\ (x86)/Vim/vimfiles/bundle/Vundle.vim
    let Tlist_Ctags_Cmd="C:/Progra~1/ctags/ctags.exe"
else
    set rtp+=~/.vim/bundle/Vundle.vim
endif

let g:tlist_python_settings = 'python;c:class;f:function'
call vundle#begin()

" Dependencies
Plugin 'gmarik/vundle'  " Let vundle manage vundle, required
Plugin 'xolox/vim-misc' " Required for vim-colorscheme-switcher
Plugin 'peterhoeg/vim-qml'  " Support for qml syntax highlighting

" Colorschemes
Plugin 'ayu-theme/ayu-vim'
Plugin 'sjl/badwolf'
Plugin 'chriskempson/base16-vim'
Plugin 'herrbischoff/cobalt2.vim'
Plugin 'zenorocha/dracula-theme'  " TODO fix this ... It does not find plugin
Plugin 'jordwalke/flatlandia'
Plugin 'romainl/flattened'
Plugin 'morhetz/gruvbox'
Plugin 'ciaranm/inkpot'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tomasr/molokai'
Plugin 'mhartington/oceanic-next'
Plugin 'vim-scripts/otaku'
Plugin 'vim-scripts/pyte'
Plugin 'junegunn/seoul256.vim'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'nelstrom/vim-blackboard'
Plugin 'altercation/vim-colors-solarized'
Plugin 'whatyouhide/vim-gotham'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'KabbAmine/yowish.vim'

" Utility
Plugin 'octol/vim-cpp-enhanced-highlight'   " Better higlighting for c++ files
Plugin 'kchmck/vim-coffee-script'   " CoffeeScript syntax
Plugin 'fatih/vim-go'               " Go syntax
Plugin 'kien/ctrlp.vim'             " Open files
Plugin 'mattn/emmet-vim'            " Emmet
Plugin 'scrooloose/nerdtree'        " Tree view
Plugin 'vim-scripts/taglist.vim'    " Member view
Plugin 'scrooloose/syntastic'       " Syntax highlighter
Plugin 'junegunn/goyo.vim'          " Distraction free
Plugin 'jdonaldson/vaxe'            " Haxe support
Plugin 'gregsexton/MatchTag'        " Highlight matching HTML tags
" Plugin 'Valloric/YouCompleteMe'   " Intellisense

" Options
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git\|venv\w*\|node_modules',
  \ 'file': '\.exe$'
  \ }
let g:user_emmet_leader_key = '<C-Z>'
let NERDTreeIgnore = ['\.pyc$']

call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI Options (must occur after Plugins)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
if has('gui_running')
    if has("win32") || has("win16")
        set guifont=Source_Code_Pro:h11
    else
        set guifont=mononoki\ 10
    endif

    " let g:gruvbox_contrast_dark = 'hard'
	let ayucolor="dark"
    colorscheme ayu

    set guioptions-=m " no menu
    set guioptions-=T " no toolbar
    set guioptions-=r " no scrollbar (right)
    set guioptions-=L " no scrollbar (left)
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

" Clear search highlighting
nnoremap <Leader>c :let @/= ""<CR>
" Toggle menubar
nnoremap <Leader>g :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
" Toggle Taglist
nnoremap <Leader>m :TlistToggle<CR>
" Toggle NERDTree
nnoremap <Leader>n :NERDTreeToggle<CR>
" Open CtrlP
nnoremap <Leader>o :CtrlP<CR>
" Close buffer
nnoremap <Leader>q :q<CR>
" Open Goyo
nnoremap <Leader>r :Goyo<CR>
" Open horizontal split
nnoremap <Leader>s :sp<Space><CR>
" Open vertical split
nnoremap <Leader>v :vsp<Space><CR>
" Save buffer
nnoremap <Leader>w :w<CR>
" Open local VIMRC
noremap <Leader><Home> :e $MYVIMRC<CR>
" Open NERDTree for current directory in current buffer
nnoremap N :open .<CR>
" Highlight matching tags (I think)
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name"). '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Additional
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically cd into the working directory
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
" AS3 support
autocmd BufRead,BufNewFile *.as set filetype=as3
