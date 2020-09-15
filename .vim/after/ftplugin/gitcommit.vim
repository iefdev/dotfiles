" Limit first line to 50 chars (title)
" and the following lines to 72

filetype plugin indent on
hi def link gitcommitOverflow Error

if has('autocmd')
    au CursorMoved,CursorMovedI * let &l:tw = line('.') == 1 ? 50 : 72
endif
