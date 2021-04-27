" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf.vim'
Plug 'qpkorr/vim-renamer'
Plug 'vimwiki/vimwiki'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'chun-yang/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'soli/prolog-vim'
call plug#end()

" Theme
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

" Vim Wiki
let g:vimwiki_list = [{'path':'~/Git/private-wiki', 'path_html':'~/Git/private-wiki/html/'}]
