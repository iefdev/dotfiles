"
" netRW
"
" Load with:
"
"   " -- netRW --
"   call LoadConf('netRW')
"

" let g:loaded_netrw = 1
" let g:loaded_netrwPlugin = 1

let g:netrw_preview = 1
let g:netrw_banner = 0                  " use F1
let g:netrw_browse_split = 4            " | 2
let g:netrw_winsize = 30                " 20%
let g:netrw_liststyle = 3               " tree
"let g:netrw_list_hide = &wildignore
let g:netrw_list_hide= '.*\.swp$,.DS_*,*/tmp/*,*.so,*.swp,*.zip,'
let g:netrw_fastbrowse = 2
let g:netrw_sort_options = "i"          " ignore CS
let g:netrw_special_syntax = 1
let g:netrw_keepdir= 0

" Use natural/alphabetic order
" sort: revome dir on top
let g:netrw_sort_sequence = '\<core\%(\.\d\+\)\=,\.[a-np-z]$,\.h$,\.c$,\.cpp$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$'

" Toggle
nmap <C-n> :Lex<CR>

" Autoload?
if has('autocmd')
"     aug ProjectDrawer
"         au!
"         au VimEnter * :Vex
"     aug END

    "open on startup
    "    au Vimenter * :Vex         " open on startup

    " close on 1 window
    au bufenter * if (winnr("$") == 1 && exists("t:netrw_lexbufnr") &&
        \ bufwinnr(t:netrw_lexbufnr) == 1) | q | endif

    " Cleanup buffer
    autocmd Filetype netrw setl bufhidden=delete       " :qa!
endif
