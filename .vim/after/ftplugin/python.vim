"
" Python settings PEP 8
"
set ts=4
set sts=4
set sw=4
set et
set ai
set si

set fdm=indent

set tw=100

if exists("+colorcolumn")
    set cc=
    execute "set cc=" . join(range(80,450), ',')
endif

"setlocal pa=src/**,tests,bin/**
"setlocal wig=*/__pycache__/*,*.pyc
setlocal pa=.,**
setlocal wig=*.pyc

" search include: https://www.youtube.com/watch?v=Gs1VDYnS-Ac (≈ 27:00)
set inc=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\| as\\)

function! PyInclude(fname)
    let parts = split(a:fname, ' import ')
    let l = parts[0]
    if len(parts) > 1
        let r = parts[1]
        let joined = join([l, r], '.')
        let fp = substitute(joined, '\.', '/', 'g') . '.py'
        let found = glob(fp, 1)
        if len(found)
            return found
        endif
    endif
    "return fp
    return substitute(joined, '\.', '/', 'g') . '.py'
endfunction

setlocal includeexpr=PyInclude(v:fname)

setlocal define=^\\s*\\<\\(def\\\|class\\)\\>
