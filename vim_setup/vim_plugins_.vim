" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'Chiel92/vim-autoformat'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'qpkorr/vim-renamer'
Plug 'tpope/vim-commentary'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

" UltiSnips
let g:UltiSnipsExpandTrigger = "<tab>"
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
