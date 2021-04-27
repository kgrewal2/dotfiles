function Format()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/,/, /g
    silent! %s/:-/ :- /g
    silent! %s/|/ | /g
    silent! %s/  / /g

    silent! %s/\s\+$/ /e
    normal gg=G
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction

nnoremap <leader>l :call Format()<CR>
nnoremap <F10> :w!<CR>:!swipl %<CR>

inoremap >> <space>--><space>

nnoremap <leader>term diwpA<space>--><space>['<esc>pA'].<ESC>
