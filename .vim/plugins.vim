""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""
" SYNTASTIC
""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""
" SUPER TAB
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "<c-n>"

""""""""""""""""""""""""""""""""""""""""""""""""""
" EMMET
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_leader_key='<C-Z>'
