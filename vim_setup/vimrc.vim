""""""""""""""""""""""""""""""""
" Basics
""""""""""""""""""""""""""""""""
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au FocusGained,BufEnter * checktime
autocmd BufWritePre * :call CleanExtraSpaces()
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
filetype plugin indent on
set autoread
set history=500
set omnifunc=syntaxcomplete#Complete
set undodir=~/.vim/undodir
set undofile

let g:tex_flavor = "latex"

" Ignore Compiled Files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

""""""""""""""""""""""""""""""""
" Vim Interface
""""""""""""""""""""""""""""""""
set backspace=eol,start,indent
set cmdheight=1
set encoding=utf8
set ffs=unix,dos,mac
set hid
set hlsearch
set ignorecase
set incsearch
set lazyredraw
set magic
set mat=2
set mouse=a
set number
set pastetoggle=<F2>
set relativenumber
set ruler
set showmatch
set showmode
set smartcase
set so=5
set whichwrap+=<,>,h,l,[,]
set wildmenu
syntax enable

set colorcolumn=110

""""""""""""""""""""
" Prevents potential security hole
""""""""""""""""""""
set exrc
set secure

""""""""""""""""""""
" Fold Options
""""""""""""""""""""
set foldmethod=syntax
set foldnestmax=3
set foldcolumn=1
set nofoldenable

""""""""""""""""""""
" Text, Tab, Indent
""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set linebreak
set autoindent
set smartindent
set wrap

""""""""""""""""""""
" Visual Mode
""""""""""""""""""""
vnoremap <silent> / :<C-u>call VisualSelection('', '')<CR>/<CR>=@/<CR><CR>
vnoremap <silent> ? :<C-u>call VisualSelection('', '')<CR>?<CR>=@/<CR><CR>
vnoremap <C-c> :!xclip -f -sel clip<CR>

""""""""""""""""""""
" Moving Around
""""""""""""""""""""
nnoremap <silent> <leader><space> :noh<CR>
nnoremap <leader>/ :tabnew<CR>:FZF<CR>
nnoremap <space><left> gT
nnoremap <space><right> gt
nnoremap <PageUp> 5<C-y>
nnoremap <PageDown> 5<C-e>
nnoremap <C-j> mz:m+<cr>`z
nnoremap <C-k> mz:m-2<cr>`z
vnoremap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z
nnoremap <C-n> :tabnew<CR>:Explore<CR>
nnoremap rd :%s/^\(.*\)\(\n\1\)\+$/\1/


""""""""""""""""""""
" Others
""""""""""""""""""""
nnoremap S yiw:%s/\<<C-r>"\>//g<left><left>

""""""""""""""""""""
" Spell Check
""""""""""""""""""""
set spellfile=~/.vim/spell/en.utf-8.add
set spelllang=en_us
augroup set_spell
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd FileType text setlocal spell
augroup END


""""""""""""""""""""
" Prolog
""""""""""""""""""""
let g:filetype_pl="prolog"

augroup imp_ft
  au!
  autocmd BufNewFile,BufRead *.imp  set filetype=imp
augroup END

autocmd BufNewFile,BufRead *.todo set filetype=todo

""""""""""""""""""""
" Functions
""""""""""""""""""""
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

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
