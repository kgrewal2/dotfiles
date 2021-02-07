" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'sjl/badwolf'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'qpkorr/vim-renamer'
Plug 'tpope/vim-commentary'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

" Lightline
set laststatus=2

" Theme
set background=dark
colorscheme badwolf
