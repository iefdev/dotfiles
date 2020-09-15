"
" Load with:
"
"   " -- Securemodelines --
"   call LoadConf('securemodelines')
"

" set modelines=0                         " CVE-2007-2438

" securemodelines
" ------------------
let g:secure_modelines_modelines=2

let g:secure_modelines_allowed_items = [
    \ "textwidth",  "tw",
    \ "softtabstop","sts",
    \ "tabstop",    "ts",
    \ "shiftwidth", "sw",
    \ "expandtab",  "et",   "noexpandtab",  "noet",
    \ "filetype",   "ft",
    \ "encoding",   "enc",
    \ "fleencoding","fenc",
    \ "readonly",   "ro",   "noreadonly",   "noro",
    \ "cindent",    "cin",  "nocindent",    "nocin",
    \ "smartindent","si",   "nosmartindent","nosi",
    \ "autoindent", "ai",   "noautoindent", "noai"
    \ ]

"     \ "fileformat", "ff",
