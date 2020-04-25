"""""""""""
" General "
"""""""""""

set showmatch

 " Toggle cursor line highlighting depending on mode
autocmd InsertEnter,InsertLeave * set cul!

"""""""""""
" Plugins "
"""""""""""

call plug#begin('~/.config/nvim/plugged')

" Add NERDTree and it's helpers
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Add CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" Airline for status bar
Plug 'vim-airline/vim-airline'

" Colorschemes
Plug 'morhetz/gruvbox'

call plug#end()

""""""""""
" Colors "
""""""""""

set background=dark
set termguicolors
let g:airline_theme = 'gruvbox'
colorscheme gruvbox

""""""""""""
" Mappings "
""""""""""""

" Open file with :open 
map :open :e

" Open CtrlP
nnoremap <Leader>o :CtrlP<CR>
