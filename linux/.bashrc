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
# > this is still (pretty much) the osx version.
#

# Load: ~/.bash_exports (PATH's and misc exports)
[ -f ~/.bash_exports ] && . ~/.bash_exports


# Colors
# ------------------------------------------------------------------------------

red=$(tput setaf 1) # red
grn=$(tput setaf 2) # green
ylw=$(tput setaf 3) # yellow
blu=$(tput setaf 4) # blue
pur=$(tput setaf 5) # purple
cyn=$(tput setaf 6) # cyan
gry=$(tput setaf 7) # grey
bold=$(tput bold)
clear=$(tput sgr 0)


# User, Hostname and PS{1..4}
# ------------------------------------------------------------------------------

# user & host
_user='\u'
_host='\H'          # \h = without ext

# @todo: Make a funktion, if possible
# Tmp names (to hide real names for screenshots/casts etc)
#_user='test'
#_host='fooBar'

[[ $UID == 0 ]] && _user='${red}\u'
[[ $SUDO_USER ]] && _user='${ylw}${_user}'

# PS 1-4
PS1="[${grn}${_user}${clear}@${_host}] ${gry}\W${clear}\$ "
PS2=' :» '
PS3=' :? '
PS4=' :+ '


# Load .bash_* files + Archey
# ------------------------------------------------------------------------------

# Load: .bash_aliases
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Load: ~/.bash_pacman
[ -f ~/.bash_pacman ] && . ~/.bash_pacman

# Load: .bash_functions
[ -f ~/.bash_functions ] && . ~/.bash_functions

#Load: ~/.bash_git
[ -f ~/.bash_git ] && . ~/.bash_git

# Load: ~/.bash_cheat
[ -f ~/.bash_cheat ] && . ~/.bash_cheat

# Load archey (if installed)
[[ `which archey` && $UID != 0 ]] && archey


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

# globstar & autocd
shopt -q -s globstar autocd
