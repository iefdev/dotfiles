#
# ~/.bash_aliases
#
#
# Description: Separate file for alias
#
# Load it in ~/.bashrc with:
# ------------------------------------------------------------------------------
#   # Load: ~/.bash_aliases
#   [ -f ~/.bash_aliases ] && . ~/.bash_aliases
# ------------------------------------------------------------------------------
#


# File & folders
# ------------------------------------------------------------------------------

# Alias to cd the folder:
alias cdD='cd ~/Desktop'
alias cdS='cd ~/ShellScripts'
alias cdR='cd ~/Repos'
alias cdL='cd /usr/local'
alias site='cd ~/Sites'
alias srv='cd /srv'
alias www='cd /srv/www'
alias ..='cd ..'
alias ...='cd ../..'

alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -iv'

# alt cp with rsync (testing)
alias cpa='rsync -avhP'

# alt cp with rsync (testing)
alias cpa='rsync -avhP'

alias c='clear'
alias k="clear && printf '\e[3J'"
alias cx="clear && printf '\e[3J' && archey"
alias cxH="cd && clear && printf '\e[3J' && archey"

alias h='history'
alias j='jobs -l'
alias x='exit'
alias q='exit'

# top, show cpu and memory. 20 processes. (exit with: q)
alias top20='top -o cpu -O +rsize -s 5 -n 20'

# show 10 largest files/dirs in current directory
alias lsTop10='du -cks * | sort -rn | head -11'

# show the largest one
alias lsTop='du -ks * | sort -n'

# Prevents errors when path is not created.
alias mkdir='mkdir -pv'
alias rmdir='rm -rv'
alias rm='rm -v'
alias ls='ls --color=auto'
alias ls.='ls -d .*'
alias lsal='ls -Ahl'
alias lsless='ls -Ahl | less'

alias grep='grep -n --color=auto'
alias egrep='egrep -n --color=auto'
alias fgrep='fgrep -n --color=auto'

# Echo PATH on separate lines
alias lPath="echo $PATH | tr ':' '\n'"

# tree, w colors
alias tree='tree -C'

# locate home dir (llocate)
alias llocate='locate -d $HOME/Library/Locate/llocate.database'

# manually update (l)locate
alias locateupd='sudo /usr/libexec/locate.updatedb'
alias llocateupd='$HOME/Library/Locate/llocate.updatedb'

# Get external IP
alias myIP='dig +short myip.opendns.com @resolver1.opendns.com'

# qip netstat info
alias qip='netstat -rn | grep default'	# ip + interface
alias whatPorts='netstat -tulanp'	# open ports ($: whatPorts tcp)

# 3 ping is ok..
alias ping='ping -c 3'

# Do not wait interval 1 second, go fast #
alias fastping='ping -c 20 -s.2'

# Pwd+copy
alias cwd='pwd | xclip -selection clipboard'

# Mimic su
alias su='sudo bash'

# Admin Nano
alias suno='sudo nano'

# Fuck
alias fuck='sudo $(history -p \!\!)'

# Need this one for: sudo <alias>
alias sudo='sudo '

# Open & open here...
alias open='xgd-open'
alias oh='open .'

# Update Grub
alias update-grub='sudo grub2-mkconfig -o /boot/grub2/grub.cfg'

# copy, OS X style
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias pbselect='xclip -selection primary -o'

#alias pbcopy='xsel --clipboard --input'
#alias pbpaste='xsel --clipboard --output'

# +x on script
alias mkrun='chmod +x'

# Fix dir(s) with messy ACL: 755/644
alias fixacl='find ./ -type d -exec chmod -v 755 {} \; && find ./ -type f -exec chmod -v 644 {} \;'


# Cleaning up stuff...
# ------------------------------------------------------------------------------

# .DS_Store and ._files (universal UNIX way)
alias rmDS='find ./ "-name" ".DS_Store" -exec rm {} \;'
alias rmDF='find ./ "-name" "._*" -exec rm {} \;'


# ShellScripts
# ------------------------------------------------------------------------------


# Wget
# ------------------------------------------------------------------------------

# Wget continue
# (with curl: curl -o <incomplete_local_file> -C - <URL>)
alias wgetc='wget -c'

# Wget no-check
alias wgetnc='wget --no-check-certificate'


# Misc stuff
# ------------------------------------------------------------------------------

# List disks
alias disklist="mount | grep 'disk'"

# Links
alias LinX='links -g'

# Rainbow Stream
alias twistr='rainbowstream'
alias twiot='rainbowstream -iot'

# mkspace
alias mkspace='echo -e "\v\v"'


# Srv & Dev
# ------------------------------------------------------------------------------

alias mysqlstatus='ps aux | grep mysql | grep -v grep'
alias openSqlHistory='open ~/.mysql_history'


# Upgrade pip
alias pipup='pip install -U pip'


# GnuPG
# --------------------------------------------------------------------------
#alias gpg.restart="gpgconf --kill gpg-agent && gpgconf --launch gpg-agent"
#alias gpg.chk="echo RELOADAGENT | gpg-connect-agent"
