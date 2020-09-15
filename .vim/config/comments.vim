"
" Functions and mapping for ”comments”.
"
" Load with:
"
"   " -- Comments --
"   call LoadConf('comments')
"

" One line comments
function! LineComment(start = '#', end = '')
    let l:line = getline(line("."))
    if l:line =~ '^\s*$'
        return 1
    else
        exe ":s@^@" . a:start . "@g"
        exe ":s@$@" . a:end . "@g"
    end
endfunction

" co    #comment
" cs    //slash
" cc    /* C-Style */
" ch    <!-- html -->
" cv    " vim
" cy    """ python """
vmap <silent>co :call LineComment()<CR>
vmap <silent>cs :call LineComment('//')<CR>
vmap <silent>cc :call LineComment('/*', '*/')<CR>
vmap <silent>ch :call LineComment('<!-- ', ' -->')<CR>
vmap <silent>cv :call LineComment('" ')<CR>
vmap <silent>cy :call BlockComment('"""', '"""')<CR>

" Multiline/block comments
function! BlockComment(start = '/*', end = '*/') range
    let b:start = a:start . "\r"
    let b:end = "\r" . a:end
    exe a:firstline . ':s/^/\=b:start/g'
    exe (a:lastline +1) . ':s/$/\=b:end/g'
endfunction

" cb    [b]lock comment
" cY    P[y]thon style
" cH    [H]tml
vmap <silent>cb :call BlockComment('/*', '*/')<CR>
vmap <silent>cY :call BlockComment('"""', '"""')<CR>
vmap <silent>cH :call BlockComment('<!--', '-->')<CR>
