#
# ~/.bashrc
#
#
# Additional bash files are store in: ~/.bash.d/
# and sourced in by need.
#
# This file is also sourced from ~/.bash_profile
# ------------------------------------------------------------------------------
#

# interactively || bye-bye
case $- in
    *i*) ;;
      *) return;;
esac

# Source global definitions
[ -f /etc/bashrc ] && . /etc/bashrc

# Load: ~/.bash.d/bash_exports (PATH's and misc exports)
[ -f ~/.bash.d/exports ] && . ~/.bash.d/exports


# Colors
# ------------------------------------------------------------------------------
_red='\e[0;31m'     # red
_grn='\e[0;32m'     # green
_ylw='\e[0;33m'     # yellow
_blu='\e[0;34m'     # blue
_pur='\e[0;35m'     # purple
_cyn='\e[0;36m'     # cyan
_gry='\e[0;37m'     # grey
_bold='\e[1m'       # bold
_clr='\e[0m'        # clear/reset


# User, Hostname and PS{0..4}
# ------------------------------------------------------------------------------

# Prompt colors (\[ ... \])
_uCol='\[\e[1;32m\]'
[[ $UID == 0 ]] && _uCol='\[\e[1;31m\]'
[[ $SUDO_USER ]] && set -e && _uCol='\[\e[1;33m\]'

_W='\[\e[0;37m\]'
_e0='\[\e[0m\]'


# Function to manually set PS1 in different variations
# Good for when doing examples and screen{casts,shots}
function setPS() {
    [[ ${#} < 4 ]] || return 1;
    case "${1}" in
        s|simple) PS1="${2:-\\$} ";                                             ;;
        d|dir)    PS1="${_W}\W${_e0}\\$ ";                                      ;;
        b|basic)  PS1="${_uCol}${2:-\u}${_e0}:${_W}\W${_def}\\$ ";              ;;
        _default) PS1="[${_uCol}${2:-\u}${_e0}@${3:-\h} ${_W}\W${_def}]\\$ ";   ;;
        *|def|default) [ "${PS1}" = "\\s-\\v\\\$ " ] && PS1="[\u@\h] \W\\$ " || \
                  PS1="[${_uCol}${2:-\u}${_e0}@${3:-\h}] ${_W}\W${_e0}\\$ ";    ;;
    esac
}

_marker="${_W}::${_e0}"

# PS 1-4
setPS default
PS2="${_marker} » "
PS3="${_marker} ? "
PS4="${_marker} + "


# Load bash files from ~/.bash.d/, Archey and bash completion
# ------------------------------------------------------------------------------

# Bash files to load
if [[ ${__DARWIN__} ]]; then
    # Used with open -e (TextEdit): ${_e:-}
    _e='-e'

    bash_files=( ruby aliases functions git macports cheat adb venv );
    bashCompl='/opt/local/etc/profile.d/bash_completion.sh';
else
    bash_files=( ruby aliases functions git dnf_rpm adb venv );
    bashCompl='/etc/profile.d/bash_completion.sh'
fi

# Source the bash files
for _file in ${bash_files[@]}; do
    [ -f ~/.bash.d/${_file} ] && . ~/.bash.d/${_file};
done

# Load bash completion (if not already loaded)
[[ -z ${BASH_COMPLETION_VERSINFO} && -f ${bashCompl} ]] && . ${bashCompl};


# Load archeyX (if installed)
# If not running interactively (or inside tmux or vim), don't do anything
if [[ $- == *i* &&  ${EUID} != 0 && -z ${TMUX} && -z ${VIM} ]]; then
    [[ $(type archeyX 2> /dev/null) ]] && archeyX
fi


# Bash variables
# ------------------------------------------------------------------------------

# Trim dir to 1. (~/.../folder)
#PROMPT_DIRTRIM=1

# Date & time to history
#export HISTTIMEFORMAT='%F %T '

HISTFILE=~/.bash.d/history
HISTIGNORE=' *:#*'

HISTSIZE=50000
HISTFILESIZE=50000

# ignoreboth (= ignoredups + ignorespace)
HISTCONTROL=ignoreboth:erasedups
shopt -s cmdhist
shopt -s histappend

# Save'n'reload
export PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND}"
#export PROMPT_COMMAND="history -n; history -w; history -c; history -r; ${PROMPT_COMMAND}"


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
#[[ ${BASH_VERSINFO[0]} -gt 3 ]] && shopt -s autocd dotglob globstar
shopt -s autocd dotglob globstar
# Tab size (default: 8)
tabs 4


# Bash and readline behaviour
# ------------------------------------------------------------------------------

if [[ ${__LINUX__} ]]; then
    # Mimic readline's "clear-display (M-C-l)" behaviour,
    # and bind it to C-l (ie. replacing: "clear-screen (C-l)")
    function clear-display() {
        printf "\033c" && history -d $(history 1);
    }

    bind '"\C-l": "\C-e\C-uclear-display\C-m\C-y"'
fi

# Trap ERR
# https://wiki.archlinux.org/index.php/Bash/Functions#Display_error_codes
function EC () { echo -e "\e[1;33m${FUNCNAME}: ${?}\e[0m\n"; }
trap EC ERR
