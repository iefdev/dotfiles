"
" Useful mappings from:
" https://medium.com/vim-drops/custom-autoclose-mappings-1ff90f45c6f5
"
" Load with:
"
"   " -- Autoclose --
"   call LoadConf('autoclosing')
"

" autoclose and position cursor to write text inside
"ino ' ''<left>
"ino ` ``<left>
"ino " ""<left>
"ino ( ()<left>
"ino [ []<left>
"ino { {}<left>

" autoclose with ; and position cursor to write text inside
ino '; '';<left><left>
ino `; ``;<left><left>
ino "; "";<left><left>
ino (; ();<left><left>
ino [; [];<left><left>
ino {; {};<left><left>

" autoclose with , and position cursor to write text inside
ino ', '',<left><left>
ino `, ``,<left><left>
ino ", "",<left><left>
ino (, (),<left><left>
ino [, [],<left><left>
ino {, {},<left><left>

" autoclose and position cursor after
"ino '<tab> ''
"ino `<tab> ``
"ino "<tab> ""
"ino (<tab> ()
"ino [<tab> []
"ino {<tab> {}

" autoclose and position cursor after
"ino '<space> ''<space>
"ino `<space> ``<space>
"ino "<space> ""<space>
"ino (<space> ()<space>
"ino [<space> []<space>
"ino {<space> {}<space>

" autoclose with ; and position cursor after
ino ';<tab> '';
ino `;<tab> ``;
ino ";<tab> "";
ino (;<tab> ();
ino [;<tab> [];
ino {;<tab> {};

" autoclose with , and position cursor after
ino ',<tab> '',
ino `,<tab> ``,
ino ",<tab> "",
ino (,<tab> (),
ino [,<tab> [],
ino {,<tab> {},

" autoclose 2 lines below and position cursor in the middle
ino '<CR> '<CR>'<ESC>O
ino `<CR> `<CR>`<ESC>O
ino "<CR> "<CR>"<ESC>O
ino (<CR> (<CR>)<ESC>O
ino [<CR> [<CR>]<ESC>O
ino {<CR> {<CR>}<ESC>O

" autoclose 2 lines below adding ; and position cursor in the middle
ino ';<CR> '<CR>';<ESC>O
ino `;<CR> `<CR>`;<ESC>O
ino ";<CR> "<CR>";<ESC>O
ino (;<CR> (<CR>);<ESC>O
ino [;<CR> [<CR>];<ESC>O
ino {;<CR> {<CR>};<ESC>O

" autoclose 2 lines below adding , and position cursor in the middle
ino ',<CR> '<CR>',<ESC>O
ino `,<CR> `<CR>`,<ESC>O
ino ",<CR> "<CR>",<ESC>O
ino (,<CR> (<CR>),<ESC>O
ino [,<CR> [<CR>],<ESC>O
ino {,<CR> {<CR>},<ESC>O


"
" Xtras
"

" -- if's & functions --
ino i(<cr> if<space>()<space>{<CR>}<ESC>O<ESC>ki
ino f(<cr> function()<space>{<CR>}<ESC>O<ESC>kf(a

" tcl
ino i{<cr> if<space>{}<space>{<CR>}<ESC>O<ESC>ki
ino e{<cr> else<space>{<CR>}<ESC>O
ino p{<cr> proc<space>{}<space>{<CR>}<ESC>O<ESC>ki<space>
ino f{<cr> foreach<space>[list<space>]<space>{<CR>}<ESC>O<ESC>kf<space>i<space>

" css
ino c{<cr> {<CR>}<ESC>O:<space>;<left><left><left>
ino :; :<space>;<left><left><left>
ino (v var()<left>
ino (u url()<left>
