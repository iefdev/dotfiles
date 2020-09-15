"
" Vim-Plug
" https://github.com/junegunn/vim-plug
"
" Load with:
"
"   " -- Load plugins --
"   call LoadConf('vim_plug')
"

" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    au VimEnter * PlugInstall --sync | source ${MYVIMRC}
endif

" init
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'airblade/vim-gitgutter'
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'nvie/vim-flake8'
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'yggdroot/indentline'
call plug#end()

" Upgrade
command! PU PlugUpdate | PlugUpgrade

" https://github.com/junegunn/vim-plug#commands
" - - -
" PlugInstall [name ...] [#threads]     Install plugins
" PlugUpdate [name ...] [#threads]  Install or update plugins
" PlugClean[!]  Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade   Upgrade vim-plug itself
" PlugStatus    Check the status of plugins
" PlugDiff  Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]
