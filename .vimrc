set encoding=utf-8
set nocompatible
filetype off
filetype indent on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'preservim/nerdcommenter'
Plugin 'qpkorr/vim-renamer'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()

" Emmet only for HTML/CSS
let g:user_emmet_install_global = 0
autocmd FileType html,css,eruby EmmetInstall
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
nnoremap <leader>/ :tabnew<CR>:FZF<CR>

" Stop search highlighting
nnoremap <leader><space> :noh<CR>

" Replace
nnoremap S :%s/\<<C-r><C-w>\>/

" Next Tab
nnoremap <C-w> gt
nnoremap <C-q> gT

" NAVIGATION----------
nnoremap <PageDown> 1<C-e>
nnoremap <PageUp>   1<C-y>

nnoremap <C-j> mz:m+<cr>`z
nnoremap <C-k> mz:m-2<cr>`z

" TOGGLE PASTE MODE
set pastetoggle=<F2>

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
set foldmethod=manual

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
let g:gruvbox_contrast_dark="hard"

" Other Basic Settings
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
iabbrev gandroid :robot:
iabbrev gbug :bug:
iabbrev gcomments :bulb:
iabbrev gdb :card_file_box:
iabbrev gdocs :pencil:
iabbrev gfeatures :sparkles:
iabbrev gfilechange :truck:
iabbrev gfix :ambulance:
iabbrev gformat :art:
iabbrev ginitial :tada:
iabbrev gios :green_apple:
iabbrev glinux :penguin:
iabbrev gmacos :apple:
iabbrev gmerge :twisted_rightwards_arrows:
iabbrev grefactor :recycle:
iabbrev gremove :fire:
iabbrev grevert :rewind:
iabbrev greview :ok_hand:
iabbrev gsecurity :lock:
iabbrev gperformance :zap:
iabbrev gtests :white_check_mark:
iabbrev gui :lipstick:
iabbrev gupdate :package:
iabbrev gwindows :checkered_flag:
iabbrev gworking :construction:

" Other
iabbrev myname Karandeep Singh Grewal
iabbrev mymail karandeep.grewal97@gmail.com
