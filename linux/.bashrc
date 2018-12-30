#
# ~/.bashrc
#
#
# Aliases (except 2) and Functions are kept in their own files:
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

# user color
_uCol="${_grn}"
[[ $UID == 0 ]] && _uCol="${_red}"
[[ $SUDO_USER ]] && set -e && _uCol="${_ylw}"

# PS 0-4
function setPS1 () {
    [[ $# = 1 ]] || exit 255;
    case "${1}" in
        none)     export PS1="";                                                  ;;
        off)      export PS1="\$ ";                                               ;;
        demo)     export PS1="[${_uCol}demo${_def}@fooBar] ${_gry}\W${_def}\$ ";  ;;
        test)     export PS1="[${_uCol}test${_def}@foooBar] ${_gry}\W${_def}\$ "; ;;
        basic)    export PS1="${_uCol}\u${_def}:${_gry}\W${_def}\$ ";             ;;
        _default) export PS1="[${_uCol}${_user}${_def}@\h ${_gry}\W]${_def}\$ ";  ;;
        default)  export PS1="[${_uCol}\u${_def}@\h] ${_gry}\W${_def}\$ ";        ;;
        full)     export PS1="[${_uCol}\u${_def}@\H] ${_gry}\W${_def}\$ ";        ;;
    esac
}

#PS0='Command started at: \t\n'
setPS1 default
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

# Load: ~/.bash_git
[ -f ~/.bash_git ] && . ~/.bash_git

# Load: ~/.bash_cheat
[ -f ~/.bash_cheat ] && . ~/.bash_cheat

# Load archey (if installed)
# If not running interactively, don't do anything
[[ ! -z "$PS1" && `type archey 2> /dev/null` && $UID != 0 ]] && archey


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
