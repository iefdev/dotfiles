"
" Plugin: yggdroot/indentline
"
" Load with:
"
"   " -- Identline --
"   call LoadConf('identline')
"

" -- Change Indent Char
" Vim and GVim vim let g:indentLine_char = 'c' where 'c' can be any
" ASCII character. You can also use one of ¦, ┆, │, ⎸, or ▏ to display
" more beautiful lines. However, these characters will only work with
" files whose encoding is UTF-8.

" or vim let g:indentLine_char_list = ['|', '¦', '┆', '┊'] each indent
" level has a distinct character.

" ¦, ┆, ┊, │, ⎸, ▏
let  g:indentLine_char = '┊'

" Use conceal color
"let g:indentLine_setColors = 0

let g:indentLine_color_term = 239
"let g:indentLine_bgcolor_term = 202

"indentLine will overwrite your "concealcursor"
" and "conceallevel" with default value:
"let g:indentLine_concealcursor = 'inc'
"let g:indentLine_conceallevel = 2

"If you want to keep your conceal settting
"let g:indentLine_setConceal = 0

" Disable by default
"let g:indentLine_enabled = 0

":IndentLinesToggle toggles lines on and off.
