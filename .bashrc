#
# ~/.bashrc
#
#
# Aliases (except 2) and Functions are kept in their own files:
# (~/.bash.d/bash_aliases and ~/.bash.d/bash_functions)
#
# This file is also sourced from ~/.bash_profile
# ------------------------------------------------------------------------------
#

# Load: ~/.bash.d/bash_exports (PATH's and misc exports)
[ -f ~/.bash.d/bash_exports ] && . ~/.bash.d/bash_exports


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
function setPS () {
    [[ $# < 4 ]] || return 1;
    case "${1}" in
        s|simple) export PS1="${2:-\$} ";                                                   ;;
        d|dir)    export PS1="${_gry}\W${_def}\$ ";                                         ;;
        b|basic)  export PS1="${_uCol}${2:-\u}${_def}:${_gry}\W${_def}\$ ";                 ;;
        _default) export PS1="[${_uCol}${2:-\u}${_def}@${3:-\h} ${_gry}\W]${_def}\$ ";      ;;
        *|def|default) export PS1="[${_uCol}${2:-\u}${_def}@${3:-\h}] ${_gry}\W${_def}\$ "; ;;
    esac
}

#PS0='Command started at: \t\n'
setPS1 default
PS2=' :» '
PS3=' :? '
PS4=' :+ '


# Load .bash_* files from ~/.bash.d/, Archey and bash completion
# ------------------------------------------------------------------------------

# Bash files to load
if [[ ${__DARWIN__} ]]; then
    # Used with open -e (TextEdit): ${_e:-}
    _e='-e'

    bash_files=( ruby aliases functions git macports cheat opo venv );
    bashCompl='/opt/local/etc/profile.d/bash_completion.sh';
else
    #add: pacman, dnf, yum etc
    bash_files=( ruby aliases functions git cheat opo venv );
    bashCompl='/etc/profile.d/bash_completion.sh'
fi

for _file in ${bash_files[@]}; do
    [ -f ~/.bash.d/${_file} ] && . ~/.bash.d/${_file};
done

# bash completion
[ -f ${bashCompl} ] && . ${bashCompl};


# Load archeyX (if installed)
# If not running interactively, don't do anything
if [[ $- == *i*  && ${UID} != 0 ]]; then
    [[ $(type archeyX 2> /dev/null) ]] && archeyX
fi


# Misc xtras
# ------------------------------------------------------------------------------

# Trim dir to 1. (~/.../folder)
export PROMPT_DIRTRIM=1

# Date & time to history
#export HISTTIMEFORMAT='%F %T '

export HISTFILESIZE=500000
export HISTSIZE=500000

export HISTIGNORE='&:[ ]*#'

# ignoreboth (= ignoredups + ignorespace)
export HISTCONTROL=ignoreboth:erasedups

shopt -s histappend
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# Set the default editor
export VISUAL="vim --clean"
export EDITOR="vim --clean"


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
[[ ${BASH_VERSINFO[0]} -gt 3 ]] && shopt -s globstar autocd


# Debugging and
# ------------------------------------------------------------------------------

# https://wiki.archlinux.org/index.php/Bash/Functions#Display_error_codes
EC() {
	echo -e "\e[1;31m${FUNCNAME}:\e[1;33m code: $? \e[m\n"
}
trap EC ERR