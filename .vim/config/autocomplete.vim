"
" Load with:
"
"   " -- Autocomplete --
"   call LoadConf('autocomplete')
"

" General
set ofu=syntaxcomplete#Complete

if has('autocmd')
    au FileType php setl ofu=phpcomplete#CompletePHP
    au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
    au FileType ruby,eruby setl ofu=rubycomplete#Complete
    au FileType py,pyc setl ofu=pythoncomplete#Complete
    au FileType js,javascript setl omnifunc=javascriptcomplete#CompleteJS
    au FileType c setl ofu=ccomplete#CompleteCpp
    au FileType css setl ofu=csscomplete#CompleteCSS
endif

"function! SuperCleverTab()
"    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
"        return "\<Tab>"
"    else
"        if &omnifunc != ''
"            return "\<C-X>\<C-O>"
"        elseif &dictionary != ''
"            return "\<C-K>"
"        else
"            return "\<C-N>"
"        endif
"    endif
"endfunction

"ino <Tab> <C-R>=SuperCleverTab()<cr>
