#
# ~/.bashrc
#
#
# Aliases (except 1 python alias) and Functions are kept in their own files:
# (~/.bash_aliases and ~/.bash_functions)
#
# This file is also sourced from ~/.bash_profile
#
# > @todo: Bring in the xtra lines from Arch,
# > this is still the osx version.
#


# ShellScripts
_Sh="$HOME/ShellScripts"

# xbin for my own scripts
_xbin="/usr/local/xbin"

# export PATH.
export PATH="$_Sh:$_xbin:$PATH"

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# No .DS_Store etc in "tar"
export COPY_EXTENDED_ATTRIBUTES_DISABLE=true

# Bash color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export GREP_COLOR='1;33'

# Colors in man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;38;5;75m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[0;38;5;246m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[04;38;5;83m'


# Bash name(s)
# ------------------------------------------------------------------------------

# colors used in PS1
_grn='\[\e[0;32m\]'    # green
_gry='\[\e[0;37m\]'    # grey
_red='\[\e[0;31m\]'    # red
_def='\[\e[m\]'        # default (clear)

# user & host
_user='\u'
#_host='\h'
_host='\H'

# Tmp names (to hide real names for screenshots/casts etc)
#_user='test'
#_host='fooBar'

# root is red
[ $UID == 0 ] && _grn=${_red} && _user='\u'

# PS 1-4
PS1="[${_grn}${_user}${_def}@${_host}] ${_gry}\W${_def}\$ "
PS2=' :» '
PS3=' :? '
PS4=' :+ '


# Load .bash_* files + Archey
# ------------------------------------------------------------------------------

# Load: .bash_aliases
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Load: .bash_functions
[ -f ~/.bash_functions ] && . ~/.bash_functions

#Load: ~/.bash_git
[ -f ~/.bash_git ] && . ~/.bash_git

# Load archey (if installed)
[[ `which archey` && $UID != 0 ]] && archey


# Misc xtras
# ------------------------------------------------------------------------------

# Date & time to history
#export HISTTIMEFORMAT='%F %T '

export HISTFILESIZE=15000
export HISTSIZE=15000

export HISTIGNORE='&:[ ]*#'

# ignoreboth (= ignoredups + ignorespace)
export HISTCONTROL=ignoreboth:erasedups

shopt -s histappend
PROMPT_COMMAND="$PROMPT_COMMAND;history -a"

# Set the default editor
export EDITOR=nano


# Misc set & shopt settings
# ------------------------------------------------------------------------------

# Correct dir spellings
shopt -q -s cdspell

# Turn on the extended pattern matching features
shopt -q -s extglob

# Get immediate notification of background job termination
set -o notify

# Disable [CTRL-D] which is used to exit (logout) the shell
set -o ignoreeof

# globstar & autocd
shopt -q -s globstar
shopt -q -s autocd
