"
" Numbers, keypad, etc
"
" Load with:
"
"   " -- Numbers --
"   call LoadConf('numbers')
"

set number
set numberwidth=5

function! NumberToggle()
if(&nu == 1)
    set nu!
    set nu rnu!
else
    set nornu
    set nu
endif
endfunction

" Toggle relative numbers (relative or absolute number lines)
nmap <Leader>n :call NumberToggle()<CR>


" Fix the Keypad !!!
map <Esc>Op 0
map <Esc>Oq 1
map <Esc>Or 2
map <Esc>Os 3
map <Esc>Ot 4
map <Esc>Ou 5
map <Esc>Ov 6
map <Esc>Ow 7
map <Esc>Ox 8
map <Esc>Oy 9
map <Esc>On .
map <Esc>OQ /
map <Esc>OR *
map <Esc>Ol +
map <Esc>OS -
map <Esc>OM <CR>
map! <Esc>Op 0
map! <Esc>Oq 1
map! <Esc>Or 2
map! <Esc>Os 3
map! <Esc>Ot 4
map! <Esc>Ou 5
map! <Esc>Ov 6
map! <Esc>Ow 7
map! <Esc>Ox 8
map! <Esc>Oy 9
map! <Esc>On .
map! <Esc>OQ /
map! <Esc>OR *
map! <Esc>Ol +
map! <Esc>OS -
map! <Esc>OM <CR>
