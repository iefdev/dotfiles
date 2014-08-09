#
# ~/.bashrc
#
# Aliases (except 1 python alias) and Functions are kept in their own files:
# (~/.bash_aliases and ~/.bash_functions)
#
# This file is also sourced from ~/.bash_profile
#

# Git
_GIT="/usr/local/git/bin"

# MySql, PgSql
_SQL="/usr/local/mysql/bin:/usr/local/pgsql/bin"

# PATH for Python 3.3 + alias
_PY="/Library/Frameworks/Python.framework/Versions/3.3/bin"
alias python='/usr/local/bin/python3'

# ShellScripts
_Sh="$HOME/ShellScripts"

# export PATH.
export PATH="/usr/local/bin:/usr/local/sbin:$_GIT:$_SQL:$_PY:$_Sh:$PATH"

#http://osxdaily.com/2013/04/03/keep-track-of-defaults-write-commands-used-in-mac-os-x-automatically/
PROMPT_COMMAND='echo "$(history 1 | grep "defaults")" | sed '/^$/d' >> $HOME/ShellScripts/__defaultsLog.txt'

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# No .DS_Store etc in "tar"
export COPY_EXTENDED_ATTRIBUTES_DISABLE=true

# Bash color
# Fix mmore later.... (http://it.toolbox.com/blogs/lim/how-to-fix-colors-on-mac-osx-terminal-37214)
# http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#
# Fix host issue (as superuser): "man scutil" + /etc/hostconfig (macpro.dev)
#
# Read                        |  Set new name
# ----------------------------|-----------------------------------------------
# scutil -–get LocalHostName  |  sudo scutil -–set LocalHostName Shortname
# scutil -–get ComputerName   |  sudo scutil -–set ComputerName "Shortname's Mac Pro"
# scutil -–get HostName       |  sudo scutil -–set HostName foobar.dev
#
# xtra: In "/etc/hostconfig", add (example): HOSTNAME=foobar.dev
#

# Bash name(s) ...

# colors used in PS1
_grn='\[\e[0;32m\]'    # green
_gry='\[\e[0;37m\]'    # grey
_red='\[\e[0;31m\]'    # red
_def='\[\e[m\]'        # default (clear)

# user & host
_user='\u'
_host='\h'

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


### Load .bash_* files

# Load: .bash_aliases
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Load: .bash_functions
[ -f ~/.bash_functions ] && . ~/.bash_functions

# Load archey (if installed)
[[ `which archey` && $UID != 0 ]] && archey

## http://www.twam.info/software/tune-terminal-in-os-x-lion
# Try to keep environment pollution down, EPA loves us. unset use_color improve bash history ;)
shopt -s histappend
#PROMPT_COMMAND=$PROMPT_COMMAND';history -a'

export HISTFILESIZE=15000
export HISTSIZE=15000

# No duplicates
export HISTCONTROL=ignoredups

# Set the default editor
export EDITOR=nano
