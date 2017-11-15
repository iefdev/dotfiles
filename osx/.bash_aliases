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
alias cdT='cd ~/.Trash'
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
alias ls='ls -G'
alias ls.='ls -d .*'
alias lsal='ls -Ahl'
alias lsless='ls -Ahl | less'

alias grep='grep -n --color=auto'
alias egrep='egrep -n --color=auto'
alias fgrep='fgrep -n --color=auto'

alias forceTrash='rm -rv ~/.Trash/{.*,*}'

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
alias cwd='pwd | pbcopy'

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

# +x on script
alias mkrun='chmod +x'

# Fix dir(s) with messy ACL: 755/644
alias fixacl='find ./ -type d -exec chmod -v 755 {} \; && find ./ -type f -exec chmod -v 644 {} \;'


# Cleaning up stuff...
# ------------------------------------------------------------------------------

# .DS_Store and ._files (universal UNIX way)
alias rmDS='find ./ "-name" ".DS_Store" -exec rm {} \;'
alias rmDF='find ./ "-name" "._*" -exec rm {} \;'

# Kill/Flush (DNS)cache (10.7/8/9)
alias flushDNS='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;'

# Kill/Flush (DNS)cache (10.10)
# Read more: http://osxdaily.com/2008/03/21/how-to-flush-your-dns-cache-in-mac-os-x/
alias flushdns='sudo discoveryutil mdnsflushcache;sudo discoveryutil udnsflushcaches;'

# Read the "hidden" download history
alias readDL="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'select LSQuarantineDataURLString from LSQuarantineEvent' | uniq | more"

# Delete the "hidden" download history
alias cleanDL="sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Clean Out LaunchPad
alias cleanLPad="sqlite3 ~/Library/Application\ Support/Dock/*.db \"DELETE from apps; DELETE from groups WHERE title <> ''; DELETE from items WHERE rowid > 2;\"; killall Dock"

# Reset LaunchPad
alias resetLPad='rm ~/Library/Application\ Support/Dock/*.db && killall Dock'

# Reset LaunchServises
alias resetOpenWith='cd /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/ && ./lsregister -kill -domain local -domain system -domain user'

# Fix broken "open with" menu
alias fixOW='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'


# ShellScripts
# ------------------------------------------------------------------------------

# Usage: cleanDisk "Name of Disk"
alias cleanDisk='~/ShellScripts/cleanDisk.sh'

# Alias for web2png.sh
alias web2png='~/ShellScripts/web2png.sh'


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

# Check why it doesn't go to sleep
alias whatsOpen='pmset -g assertions'

# List connected hardware
alias whatHW='networksetup -listallhardwareports'

# Screen Saver Engine
alias sse='open -a ScreenSaverEngine'

# the defaults log
alias openDeflog='open $HOME/ShellScripts/__defaultsLog.txt'

# Password assistant
alias passist='open -a Password\ Assistant'

# Links X11
alias LinX='links -g'

# Rainbow Stream
alias twistr='rainbowstream'
alias twiot='rainbowstream -iot'

# ImageOptim
alias imageoptim='/Applications/ImageOptim.app/Contents/MacOS/ImageOptim'

# mkspace
alias mkspace='echo -e "\v\v"'


# Srv & Dev
# ------------------------------------------------------------------------------

# PHP 5.4, 7.0 (5.6 is in PATH)
alias php54='/usr/local/php54/bin/php'
alias phpize54='/usr/local/php54/bin/phpize'
alias pear54='/usr/local/php54/bin/pear'
alias pecl54='/usr/local/php54/bin/pecl'

alias php70='/usr/local/php70/bin/php'
alias phpize70='/usr/local/php70/bin/phpize'
alias pear70='/usr/local/php70/bin/pear'
alias pecl70='/usr/local/php70/bin/pecl'
alias fpmctl70='/usr/local/php70/sbin/fpmctl'

# Composer
alias phpmem="php -r \"echo ini_get('memory_limit').PHP_EOL;\""
alias memposer='php -d memory_limit=-1 $(which composer)'


# MySQL
alias mysql.server='sudo /opt/local/share/mariadb-10.1/support-files/mysql.server'
alias mysqlstatus='ps aux | grep mysql | grep -v grep'
alias openSqlHistory='open ~/.mysql_history'


# PostgreSQL
# Usage: postgres.server (initdb|start|stop|restart|reload|status)
alias postgres.server='/opt/local/etc/LaunchDaemons/org.macports.postgresql95-server/postgres.server'


# Upgrade pip
alias pipup='pip install -U pip'


# Macports
# --------------------------------------------------------------------------
alias portup='sudo port -v selfupdate && echo -e "\v--->  Outdated:\n" && port echo outdated'
alias portout='echo -e "--->  Outdated:\n" && port echo outdated'
alias portupgrade='sudo port upgrade'
alias portupall='sudo port upgrade outdated and not go'
#alias portupall='sudo port upgrade outdated and not \( go mongo-tools \)'

alias portclean='sudo port clean --all'
alias portmaintainer='port info --maintainer'

alias lsOutdated='port echo outdated'
alias lsPorts='port echo installed'
alias lsLeaves='port echo leaves'
alias rmLeaves='sudo port uninstall leaves'
alias lsInactive='port echo inactive'
alias rmInactive='sudo port uninstall inactive'

alias lsDistBuild='ls -Ahl /opt/local/var/macports/{distfiles,build}'
alias rmDistBuild='sudo rm -rvf /opt/local/var/macports/{distfiles,build}/*'

alias setReq='sudo port setrequested'

alias fail2ban.start='sudo port load fail2ban'
alias fail2ban.stop='sudo port unload fail2ban'


# GnuPG
# --------------------------------------------------------------------------
alias gpg.restart="gpgconf --kill gpg-agent && gpgconf --launch gpg-agent"
alias gpg.chk="echo RELOADAGENT | gpg-connect-agent"
