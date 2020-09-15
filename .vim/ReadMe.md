# Vimfiles

This folder is for the external vimfiles I source into `.vimrc`. It also have a few “after” files _(see section below)_.


## Config files

As the `.vimrc` file grow, it's nice to split up the file with external files. It both makes it looks cleaner and is easier to manage.

Put the files in: `~/.vim/config`

Or from the directory in Termial:

```bash
cd dotfiles/.vim
install -vd ~/.vim/config
install -v config/*.vim ~/.vim/config
```

#### Usage

Include the file(s) like you'd normally do, or you can use a function.

You'll see at the top of each file, it says to load the file with _(example)_:

```vim
" -- Description --
call LoadConf('filename')
```

“`filename`” is the name of the file, without the `.vim` extension. Just to make it look a bit cleaner.

To load the files you'll need a small function called `LoadConf()`. I have it in the top of my `.vimrc`, followed by loading the `vim_plug` file:

```vim
"
" ~/.vimrc, or
" ~/.vim/vimrc
"

" Basics
" - - - - - - - - - - - - - - - - - - - -
set nocp                    " be iMproved

filetype plugin indent on
syntax on
set backspace=start,eol,indent
set hidden


" Load external config files.
" Usage: call LoadConf('filename')
" - - - - - - - - - - - - - - - - - - - -
function! LoadConf(cf = '')
    let b:file = printf("%s%s%s", '~/.vim/config/', a:cf, '.vim')
    if filereadable(expand(b:file))
        exe 'so' . b:file
    else
        echom "»»» ERR: LoadConf('" . a:cf . "')"
        echom '    ' . b:file . ' do not exist.' | echom ''
    endif
endfunction


" -- Load plugins --
call LoadConf('vim_plug')

" The rest of the file
" ...
```

An error msg will be displayed on save or start if the file is missing _(most likely there's a typo)_.

To use a function to load the files are easier, and you don't need to type the full path to each file.


## After files

In the `after/ftplugin` folder, you can add specific files that only affects certain filetypes. A great way to keep your `.vimrc` clean(er).

Put the files in: `~/.vim/after/ftplugin`

Or from the directory in Termial:

```bash
cd dotfiles/.vim
install -vd ~/.vim/after
install -v after/ftplugin/*.vim ~/.vim/after/ftplugin
```

At the moment there are only 2 files. One for `python`, and another one for `gitcommit`.

The `gitcommit` makes the commit messages break at 50 for the title, and 72 in the message.

_A pasted long url, will still be a long url (no break)_
