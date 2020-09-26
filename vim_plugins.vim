" PLUGINS
call plug#begin('~/.vim/plugged')
" Plug 'Chiel92/vim-autoformat'
" Plug 'ervandew/supertab'
" Plug 'mattn/emmet-vim'
" Plug 'turbio/bracey.vim'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'qpkorr/vim-renamer'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'ycm-core/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

" UltiSnips
let g:UltiSnipsExpandTrigger="``"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Gruvbox
colorscheme gruvbox
set background=dark

" Autoformat
let g:formatter_yapf_style = 'google'
nnoremap <F9> :Autoformat<CR>

" SUPER TAB
let g:SuperTabDefaultCompletionType = "<c-n>"

" EMMET
let g:user_emmet_leader_key='<C-Z>'


