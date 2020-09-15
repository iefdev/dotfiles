"
" Make sure we use spaces, and trim whitespace on save
"
" Functions Entab/Detab can be used manually when needed.
"
" Load with:
"
"   " -- Tabs/Spaces and Whitespace --
"   call LoadConf('whitespace')
"

" 4 spaces !!!
set ts=4
set sts=4
set sw=4
set et

" TODO: Move the othe whitespace related setting here.


function Detab()
   :set et | %retab
endfunction

function Entab()
    :set noet | %retab!
endfunction


if has('autocmd')
    if !exists("autocommands_loaded")
        let autocommands_loaded = 1
    endif

    au BufEnter * if (&modifiable) | :set et | :retab | endif
    au BufWritePre * %s/\s\+$//e
endif

" easier moving of code blocks better intendation
vn < <gv
vn > >gv

" New lines without INSERT mode
nmap <CR> o<C-c>
