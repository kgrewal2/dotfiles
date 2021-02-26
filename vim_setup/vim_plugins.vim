" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf.vim'
Plug 'qpkorr/vim-renamer'
Plug 'scrooloose/syntastic'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
call plug#end()

" Lightline
set laststatus=2

" Theme
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox
