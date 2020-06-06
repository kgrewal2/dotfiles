" Tab Settings
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Numberline
set number
set relativenumber

" Enable filetype plugins
filetype plugin on
filetype indent on

" Enable Autoread
set autoread
au FocusGained,BufEnter * checktime

" Basic Setup
colorscheme gruvbox
highlight ColorColumn ctermbg=0
set background=dark
set clipboard+=unnamed
set colorcolumn=100
set cursorline
set cursorcolumn
set ignorecase
set history=500
set mouse=a
set nobackup
set noerrorbells
set noswapfile
set nowrap
set smartcase
set smartindent
set termguicolors
set undodir=~/.vim/undodir
set undofile
set path=**
set wildmenu
set wildmode=full
syntax on

" Split Settings
set splitbelow splitright

" Search Options
set incsearch
set hlsearch

" --- Auto Command Options ---
" Fix text file type
autocmd BufRead, BufNewFile *.tex set filetype=tex
" Set Spell Check
autocmd FileType tex,latex,markdown setlocal spell spelllang=en_us
" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz
" Remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" --- Keybindings ---
" Shortcut for split navigation
map <C-h> <C-w-h
map <C-j> <C-w-j
map <C-k> <C-w-k
map <C-l> <C-w-l

" Alias replace all to S
nnoremap S :%s///gI<Left><Left><Left><Left>

" Autocomplete Setting and Tab Remap
:set completeopt=longest,menuone
inoremap <tab> <c-n>
inoremap <s-tab> <c-p>
set dictionary=/home/lisa/.vim/spell/en.utf-8.add
set complete+=k
vnoremap <C-c> :'<,'>w !xclip -selection clipboard<Cr><Cr>

