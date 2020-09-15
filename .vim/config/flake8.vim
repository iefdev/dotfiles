"
" Plugin: nvie/vim-flake8
"
" Load with:
"
"    " -- flake8 --
"    call LoadConf('flake8')
"

" To remove from file: (cf = [c]lear [f]lake8)
nn <Leader>cf :call flake8#Flake8UnplaceMarkers()

if has('autocmd')
    au BufWritePost *.py call flake8#Flake8()
endif

" To customize the location of your flake8 binary
" let g:flake8_cmd="/opt/strangebin/flake8000"
" let g:flake8_cmd="/opt/local/bin/flake8"

"To customize the location of quick fix window
let g:flake8_quickfix_location="topleft"

"To customize the height of quick fix window
let g:flake8_quickfix_height=7

" To customize whether the quickfix window opens
"let g:flake8_show_quickfix=0

" To customize whether the show signs in the gutter
let g:flake8_show_in_gutter=1

"To customize whether the show marks in the file
let g:flake8_show_in_file=1

"To customize the number of marks to show
"let g:flake8_max_markers=500

" To customize the gutter markers, set any of flake8_error_marker,
" flake8_warning_marker, flake8_pyflake_marker, flake8_complexity_marker,
" flake8_naming_marker. Setting one to the empty string disables it. Ex.:

" flake8_error_marker='EE'     " set error marker to 'EE'
" flake8_warning_marker='WW'   " set warning marker to 'WW'
" flake8_pyflake_marker=''     " disable PyFlakes warnings
" flake8_complexity_marker=''  " disable McCabe complexity warnings
" flake8_naming_marker=''      " disable naming warnings

" To customize the colors used for markers, define the highlight groups,
" Flake8_Error, Flake8_Warning, Flake8_PyFlake, Flake8_Complexity, Flake8_Naming:

" to use colors defined in the colorscheme
hi link Flake8_Error      Error
hi link Flake8_Warning    WarningMsg
hi link Flake8_Complexity WarningMsg
hi link Flake8_Naming     WarningMsg
hi link Flake8_PyFlake    WarningMsg

" To show the error message of the current line in the ruler,
" call flake8#ShowError():
nn <C-K> :call flake8#Flake8ShowError()<cr>
