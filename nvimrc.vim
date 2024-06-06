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

" Play nice with tmux
Plug 'christoomey/vim-tmux-navigator'

" Airline for status bar
Plug 'vim-airline/vim-airline'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'Erichain/vim-monokai-pro'
Plug 'talha-akram/noctis.nvim'

call plug#end()

""""""""""
" Colors "
""""""""""

set background=dark
set termguicolors
" let g:gruvbox_contrast_dark = 'hard'
" colorscheme monokai_pro
colorscheme noctis_sereno

let g:airline_theme = 'gruvbox'

""""""""""""
" Mappings "
""""""""""""

" Open file with :open
map :open :e

" Open CtrlP
nnoremap <Leader>o :CtrlP<CR>

" Map TMUX
nnoremap <silent> <M-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <M-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <M-Right> :TmuxNavigateRight<cr>
" nnoremap <silent> <M-C> :TmuxNavigatePrevious<cr>
