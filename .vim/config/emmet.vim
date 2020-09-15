"
" Plugin: mattn/emmet-vim
"
" Load with:
"
"    " -- Emmet --
"    call LoadConf('emmet')
"

let g:user_emmet_settings =
  \ {
      \ 'php' : {
      \     'extends' : 'html',
      \     'filters' : 'c',
      \ },
      \ 'xml' : {
      \     'extends' : 'html',
      \ },
      \ 'haml' : {
      \     'extends' : 'html',
      \ },
  \ }


" modes: inva (a = all)
let g:user_emmet_mode = 'a'

if has('autocmd')
    "let g:user_emmet_install_global = 0
    " au FileType php,html,css EmmetInstall
endif

"let g:user_emmet_leader_key='<C-Z>'
