set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'mattn/emmet-vim'
Plugin 'preservim/nerdcommenter'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'qpkorr/vim-renamer'
call vundle#end()

" Emmet only for HTML/CSS
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-Z>'

"--------------------
" Commands
"--------------------
" Save file with sudo permissions
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"--------------------
" Virtual Mode
"--------------------
" Copy selected text
vnoremap <C-c> y:call system("xclip -selection clipboard", @")<cr>

" Search visually selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Move Selected Lines
vnoremap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

"--------------------
" Normal Mode
"--------------------
" Stop search highlighting
nnoremap <leader><space> :noh<CR>

" Replace
nnoremap S :%s/\<<C-r><C-w>\>/

" TABS SETTINGS----------
" New Tab
nnoremap <leader>t :tabnew<space>
" Close Tab
nnoremap <leader>w :wq<CR>
" Next Tab
nnoremap <leader><tab> gt

" SPLIT SHORTCUTS
nnoremap <leader>v :Vexplore<cr>
nnoremap <leader>h :Hexplore<cr>

" NAVIGATION----------
nnoremap <PageDown> 8<C-e>
nnoremap <PageUp>   8<C-y>

nnoremap <C-j> mz:m+<cr>`z
nnoremap <C-k> mz:m-2<cr>`z
"--------------------
" Insert Mode
"--------------------

"--------------------
" Autocommands
"--------------------
" Remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Enable Autoread on external changes
set autoread
au FocusGained,BufEnter * checktime

" Tex Spelling Support
autocmd FileType tex setlocal spell spelllang=en_us
"--------------------
" Functions
"--------------------
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

"--------------------
" Other Options
"--------------------

" Tab Settings
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set foldmethod=indent

" Search Options
set incsearch
set hlsearch

" Syntax Highlights/Indents
syntax on
filetype indent on
filetype plugin on


" Backspace configuration
set backspace=eol,start,indent

" Hid buffer when abandoned
set hid

" No error sounds
set noerrorbells
set novisualbell

" Theme
colorscheme gruvbox
set background=dark
set clipboard+=unnamed
set cmdheight=1
set colorcolumn=100
set complete+=k
set completeopt=longest,menuone
set cursorcolumn
set cursorline
set foldcolumn=1
set history=500
set ignorecase
set linebreak
set laststatus=2
set mat=2
set mouse=a
set backup
set noerrorbells
set swapfile
set number
set path=**
set relativenumber
set ruler
set smartcase
set smartindent
set noshowmode
set smarttab
" set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
set undodir=~/.vim/undodir
set undofile
set wildmenu
set wildmode=full
set undodir=~/.vim/undodir

"--------------------------------------------------
" ABBREVIATIONS
"--------------------------------------------------
" Use C-x X-u to autocomplete abbrevations
augroup GetAbbrev
    autocmd!
    autocmd VimEnter * let s:abbrev_list = [] |
                \ call substitute(join(readfile($MYVIMRC), "\n"), '\v%(^|\n)\s*i?%(nore)?ab%[brev]\s+%(%(\<expr\>|\<buffer\>)\s+){,2}(\k+)', '\=add(s:abbrev_list, submatch(1))', 'gn')
augroup END

set completefunc=CompleteAbbrev
function! CompleteAbbrev(findstart, base)
    if a:findstart
        return searchpos('\<\k', 'bcnW', line('.'))[1] - 1
    else
        return filter(copy(s:abbrev_list), 'v:val =~ "^" . a:base')
    endif
endfunction

" Git
iabbrev gitandroid :robot:
iabbrev gitbug :bug:
iabbrev gitcomments :bulb:
iabbrev gitdb :card_file_box:
iabbrev gitdocs :pencil:
iabbrev gitfeatures :sparkles:
iabbrev gitfilechange :truck:
iabbrev gitfix :ambulance:
iabbrev gitformat :art:
iabbrev gitinitial :tada:
iabbrev gitios :green_apple:
iabbrev gitlinux :penguin:
iabbrev gitmacos :apple:
iabbrev gitmerge :twisted_rightwards_arrows:
iabbrev gitrefactor :recycle:
iabbrev gitremove :fire:
iabbrev gitrevert :rewind:
iabbrev gitreview :ok_hand:
iabbrev gitsecurity :lock:
iabbrev gitperformance :zap:
iabbrev gittests :white_check_mark:
iabbrev gitui :lipstick:
iabbrev gitupdate :package:
iabbrev gitwindows :checkered_flag:
iabbrev gitworking :construction:

" Other
iabbrev vimname Karandeep Singh Grewal
iabbrev vimmail karandeep.grewal97@gmail.com