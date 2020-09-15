"
" Plugin: vim-markdown
"
" Load with:
"
"    " -- Markdown --
"    call LoadConf('markdown')
"

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_emphasis_multiline = 0

let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

let g:tex_conceal = ""
let g:vim_markdown_math = 1

let g:vim_markdown_fenced_languages = ['tcl=tcl']

let g:vim_markdown_follow_anchor = 1

"let g:vim_markdown_anchorexpr = "'<<'.v:anchor.'>>' " Default is `''`

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 3
let g:vim_markdown_no_extensions_in_markdown = 1

let g:vim_markdown_autowrite = 1
let g:vim_markdown_auto_extension_ext = 'txt'

let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
