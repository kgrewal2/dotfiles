" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'qpkorr/vim-renamer'
Plug 'scrooloose/syntastic'
Plug 'sjl/badwolf'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
call plug#end()

" Lightline
set laststatus=2

" Theme
set background=dark
colorscheme badwolf
