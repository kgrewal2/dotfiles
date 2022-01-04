" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'chun-yang/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'qpkorr/vim-renamer'
Plug 'soli/prolog-vim'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'
Plug 'yggdroot/indentLine'
call plug#end()

" Theme
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

" Vim Wiki
let g:vimwiki_list = [{'path':'~/Git/private-wiki', 'path_html':'~/Git/private-wiki/html/'}]

" Emmet
let g:user_emmet_leader_key=','
call plug#end()

" Theme
let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

" Vim Wiki
let g:vimwiki_list = [{'path':'~/Git/private-wiki', 'path_html':'~/Git/private-wiki/html/'}]

" Emmet
let g:user_emmet_leader_key=','
