""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Options
""""""""""""""""""""""""""""""""""""""""""""""""""
set history=500

filetype plugin indent on

" Autoread
set autoread
au FocusGained,BufEnter * checktime

" Fast Saving
nnoremap <leader>w :w!<CR>

" Sudo Save
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Interface
""""""""""""""""""""""""""""""""""""""""""""""""""
set so=5

set wildmenu

" Ignore Compiled Files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set ruler

set cmdheight=1

" Buffer is hid when abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l,[,]

set ignorecase
set smartcase

set hlsearch
set incsearch

set lazyredraw
set magic

set showmode

set showmatch
set mat=2

set foldcolumn=1

""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Options
""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax
set foldnestmax=3

""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Options
""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

set mouse=a

set pastetoggle=<F2>

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark="hard"

set encoding=utf8
set ffs=unix,dos,mac

set number
set relativenumber

""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, Backup, Undo
""""""""""""""""""""""""""""""""""""""""""""""""""
set backup
set wb
set swapfile
set undodir=~/.vim/undodir
set undofile

""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, Tab, Indent
""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set linebreak

set autoindent
set smartindent
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Mode Related
""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <silent> / :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> ? :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader><space> :noh<cr>

" New Tab with FZF
nnoremap <leader>/ :tabnew<CR>:FZF<CR>

" Switch between the tabs
let g:lasttab = 1
nmap <space><space> :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%f%m%r%h\ %w\ %h\ \ \ Line:\ %l/%L\ \ Column:\ %c%=

""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Move line(s) around
nnoremap <C-j> mz:m+<cr>`z
nnoremap <C-k> mz:m-2<cr>`z
vnoremap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

nnoremap <C-n> :tabnew<CR>:Explore<CR>

autocmd BufWritePre * :call CleanExtraSpaces()

""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell Check
""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <C-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Helper Functions
""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun


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

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

