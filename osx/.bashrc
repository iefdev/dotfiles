#
# ~/.bashrc
#
#
# Aliases (except 2) and Functions are kept in their own files:
# (~/.bash_aliases and ~/.bash_functions)
#
# This file is also sourced from ~/.bash_profile
# ------------------------------------------------------------------------------
#

# Load: ~/.bash_exports (PATH's and misc exports)
[ -f ~/.bash_exports ] && . ~/.bash_exports


# Colors
# ------------------------------------------------------------------------------

_red='\[\033[0;31m\]' # red
_grn='\[\033[0;32m\]' # green
_ylw='\[\033[0;33m\]' # yellow
_blu='\[\033[0;34m\]' # blue
_pur='\[\033[0;35m\]' # purple
_cyn='\[\033[0;36m\]' # cyan
_gry='\[\033[0;37m\]' # gray
_bold='\[\033[1m\]'   # bold
_def='\[\033[0m\]'    # default


# User, Hostname and PS{0..4}
# ------------------------------------------------------------------------------

# user & host
_user='\u'
_host='\H'          # \h = without ext

# Tmp names (to hide real names for screenshots/casts etc)
#_user='test'
#_host='fooBar'

[[ $UID == 0 ]] && _user='${_red}\u'
[[ $SUDO_USER ]] && _user='${_ylw}${_user}'

# PS 0-4
#PS0=''
PS1="[${_grn}${_user}${_def}@${_host}] ${_gry}\W${_def}\$ "
PS2=' :» '
PS3=' :? '
PS4=' :+ '


# Load .bash_* files, Archey and bash completion
# ------------------------------------------------------------------------------

# Load: .bash_aliases
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Load: .bash_functions
[ -f ~/.bash_functions ] && . ~/.bash_functions

# Load: ~/.bash_git
[ -f ~/.bash_git ] && . ~/.bash_git

# Load: ~/.bash_cheat
[ -f ~/.bash_cheat ] && . ~/.bash_cheat

# Load archey (if installed)
# If not running interactively, don't do anything
[[ ! -z "$PS1" && `which archey` && $UID != 0 ]] && archey

# bash completion (MacPorts)
bashCompl='/opt/local/etc/profile.d/bash_completion.sh';
[ -f ${bashCompl} ] && . ${bashCompl} &> /dev/null;


# Misc xtras
# ------------------------------------------------------------------------------

# Trim dir to 1. (~/.../folder)
export PROMPT_DIRTRIM=1

# Date & time to history
#export HISTTIMEFORMAT='%F %T '

export HISTFILESIZE=15000
export HISTSIZE=15000

export HISTIGNORE='&:[ ]*#'

# ignoreboth (= ignoredups + ignorespace)
export HISTCONTROL=ignoreboth:erasedups

shopt -s histappend
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

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

# bash >=4
[ ${BASH_VERSINFO[0]} -gt 3 ] && shopt -s globstar autocd
