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

" Backspace Configuration
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" A buffer becomes hidden when it is abandoned
set hid

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Status Line
set laststatus=2
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


" Basic Setup
colorscheme gruvbox
highlight ColorColumn ctermbg=0
set background=dark
set clipboard+=unnamed
set cmdheight=1
set colorcolumn=100
set cursorcolumn
set cursorline
set foldcolumn=1
set completeopt=longest,menuone
set history=500
set dictionary=/home/lisa/.vim/spell/en.utf-8.add
set complete+=k
set ignorecase
set lazyredraw
set magic
set mat=2
set mouse=a
set nobackup
set noerrorbells
set noswapfile
set nowrap
set path=**
set ruler
set smartcase
set smartindent
set smarttab
set termguicolors
set undodir=~/.vim/undodir
set undofile
set wildmenu
set wildmode=full
syntax on

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Split Settings
set splitbelow splitright

" Search Options
set incsearch
set hlsearch

" --- Auto Command Options --------------------------------------------
" Fix text file type
autocmd BufRead, BufNewFile *.tex set filetype=tex
" Set Spell Check
autocmd FileType tex,latex,markdown setlocal spell spelllang=en_us
" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz
" Remove trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e

" --- Keybindings -----------------------------------------------------

" Search for Selection (Michael Naumann)
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" Alias replace all to S
nnoremap S :%s///gI<Left><Left><Left><Left>

" Autocomplete Setting and Tab Remap
inoremap <tab> <c-n>
inoremap <s-tab> <c-p>
vnoremap <C-c> :'<,'>w !xclip -selection clipboard<Cr><Cr>

" New Tab
nnoremap <leader>tn :tabnew<cr>

" Toggle Tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()o

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Disable search highlighting
nnoremap <leader><space> :noh<cr>

" Move a line of text using Ctrl+[jk]
nnoremap <C-j> mz:m+<cr>`z
nnoremap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Toggle spell mode
map <leader>ss :setlocal spell!<cr>

" --- Functions -------------------------------------------------------
function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction
