" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf.vim'
Plug 'qpkorr/vim-renamer'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'chun-yang/auto-pairs'
Plug 'itchyny/lightline.vim'
call plug#end()

" Theme
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox
