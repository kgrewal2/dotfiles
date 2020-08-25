""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-unimpaired'
Plug 'turbio/bracey.vim'
Plug 'qpkorr/vim-renamer'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoformat
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:formatter_yapf_style = 'google'

nnoremap <F9> :Autoformat<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTASTIC
""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

nnoremap <F10> :lopen<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" SUPER TAB
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "<c-n>"

""""""""""""""""""""""""""""""""""""""""""""""""""
" EMMET
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_leader_key='<C-Z>'
