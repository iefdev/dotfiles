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
alias www='cd ~/Sites'
alias srv='cd /srv'
alias srw='cd /srv/www'
alias ..='cd ..'

alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -iv'

# alt cp with rsync (testing)
alias cpa='rsync -avhP'

alias c='clear'
alias cx='clear && archey'
alias cxH='cd && clear && archey'

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

# Open here...
alias oh='open .'

# Update Grub
alias update-grub='sudo grub2-mkconfig -o /boot/grub2/grub.cfg'

# copy, OS X style
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias pbselect='xclip -selection primary -o'

#alias pbcopy='xsel --clipboard --input'
#alias pbpaste='xsel --clipboard --output'


# Cleaning up stuff...
# ------------------------------------------------------------------------------

# .DS_Store and ._files (universal UNIX way)
alias rmDS='find ./ "-name" ".DS_Store" -exec rm {} \;'
alias rmDF='find ./ "-name" "._*" -exec rm {} \;'

# Read/Delete the Dropbox cache folder (= more space).
alias readDBC='ls -Ahl ~/Dropbox/.dropbox.cache/'
alias cleanDBC='rm -rf ~/Dropbox/.dropbox.cache/*'


# ShellScripts
# ------------------------------------------------------------------------------

# Dropbox Uploader
alias dbUpload='~/ShellScripts/dropbox_uploader.sh'


# Wget
# ------------------------------------------------------------------------------

# Wget continue
# (with curl: curl -o <incomplete_local_file> -C - <URL>)
alias wgetc='wget -c'

# Wget no-check
alias wgetnc='wget --no-check-certificate'


# Misc stuff
# ------------------------------------------------------------------------------

# Links 2.8
alias LinX='links -g'




# Srv & Dev
# ------------------------------------------------------------------------------

alias mysqlstatus='ps aux | grep mysql | grep -v grep'
alias openSqlHistory='open ~/.mysql_history'


#
# pyWeb
# --------------------------------------------------------------------------
# With Python you can start a simple web server to text files.
# Can be used/started from any folder, but this one uses one folder: (~/pyWeb)
#
# Based on version of Python, it will chose an alias.
# --------------------------------------------------------------------------
# URL (examples)     : http://localhost:8000/
#                    : http://localhost:8000/index.html
#                    : http://127.0.0.1:8000/test.html
#                    : (or outside IP)
# --------------------------------------------------------------------------
# Start with: pyWeb
# Stop with: ctrl+C
#
# (think I'll will move this to a function instead)

# Check version
py3=`python -c 'import sys; print(sys.version_info[:3])' | sed 's/.*\(3\).*/\1/'`

# Create folder: ~/pyWeb
[[ ! -d ~/pyWeb ]] && mkdir ~/pyWeb && echo '<pre>pyWeb &hellip;</pre>' > ~/pyWeb/index.html

if [[ $py3 == "3" ]]; then
	# Python 3.*
	alias pyWeb='cd ~/pyWeb && python -m http.server 8000';
else
	# Python 2.*
	alias pyWeb='cd ~/pyWeb && python -m SimpleHTTPServer 8000';
fi
