" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'chun-yang/auto-pairs'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'qpkorr/vim-renamer'
Plug 'tomasr/molokai'
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

" NerdTree
map <F5> :NERDTreeToggle<CR>

" FZF
nmap <leader>o :Files<CR>

" Git Gutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

set dictionary+=~/.vim/words_alpha

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
