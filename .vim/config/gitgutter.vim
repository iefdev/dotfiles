"
" Plugin: airblade/vim-gitgutter
"
" Load with:
"
"   " -- Gitgitter - no commands --
"   call LoadConf('git_gutter')
"

" If your terminal doesn’t report focus events, set:
" let g:gitgutter_terminal_reports_focus=0.
" For tmux, set -g focus-events on in your tmux.conf.

let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_lines = 0
let g:gitgutter_set_sign_backgrounds = 1

" let g:gitgutter_sign_added = '+'
" let g:gitgutter_sign_modified = '>'
" let g:gitgutter_sign_removed = '-'
" let g:gitgutter_sign_removed_first_line = '^'
" let g:gitgutter_sign_modified_removed = '<'

let g:gitgutter_override_sign_column_highlight = 1
hi SignColumn guibg=DarkGreen
hi SignColumn ctermbg=DarkGreen
hi link GitGutterChangeLine DiffText

" Update freq
set updatetime=1000

" Jump between hunks
nmap <Leader>gn <Plug>GitGutterNextHunk
nmap <Leader>gp <Plug>GitGutterPrevHunk

" Toggle
nmap <Leader>gt <Plug>GitGutterToggle
