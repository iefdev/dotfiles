#
# ~/.bash_functions
#
#
# Description: Separate file for bash functions and helpers
#
# Load it in: ~/.bashrc with
# ------------------------------------------------------------------------------
#   # Load: ~/.bash_functions
#   [ -f ~/.bash_functions ] && . ~/.bash_functions
# ------------------------------------------------------------------------------
#


# File & folders
# --------------------

# locate in ext. disk (pics, docs etc)
#function Locate { locate $* | egrep "^/Volumes/NameOfDisk"; }

# Make a dir and cd into it
function mkdircd() { mkdir -p "$1" && cd "$1"; }

# Misc bak helpers (mbakd, for dirs)
#function mkbakd() { _dir=`echo "${1%/}"`; ditto -v "${_dir}"{,.bak}; }
function mkbak() { cp -iv "$1"{,.bak}; }
function mvbak() { mv -iv "$1"{,.bak}; }


# @todo: open | gedit... for now open (see 'open' in .bash_aliases)
# Usage: openBash [<letter>]
# Empty = .bashrc ($1 = 1st letter after .bash_)
function  openBash()
{
	[[ $1 == 'i' ]] && open -e ~/.inputrc;
	[ -z $1 ] && open -e ~/.bashrc || \
	for file in $(ls -d ~/.* | grep bash | grep -v -e 'bashrc' | sed -e 's/.*\://'); do
		[[ $(echo $1 | cut -c 1) == $(echo `basename $file` | cut -c 7) ]] && open -e $file && break;
	done;
}

# Usage: nanoBash [<letter>]
# Empty = .bashrc ($1 = 1st letter after .bash_)
function nanoBash()
{
	[[ $1 == 'i' ]] && nano ~/.inputrc;
	[[ $1 == 'n' ]] && sudo nano /etc/nanorc;
	[ -z $1 ] && nano ~/.bashrc || \
	for file in $(ls -d ~/.* | grep bash | grep -v -e 'bashrc' | sed -e 's/.*\://'); do
		[[ $(echo $1 | cut -c 1) == $(echo `basename $file` | cut -c 7) ]] && nano $file && break;
	done;
}

# Usage: reBash [<letter>]
# Empty = .bashrc ($1 = 1st letter after .bash_)
function reBash()
{
	[[ $1 == 'h' ]] && return;
	[[ $1 == 'i' ]] && . ~/.inputrc;
	[[ $1 == 'n' ]] && . /etc/nanorc;
	[ -z $1 ] && . ~/.bashrc || \
	for file in $(ls -d ~/.* | grep bash | egrep -v -e 'bashrc|history' | sed -e 's/.*\://'); do
		[[ $(echo $1 | cut -c 1) == $(echo `basename $file` | cut -c 7) ]] && . $file && break;
	done;
}


# Delete empty lines in a file
function mtLines() { [ -f "$1" ] && sed -i '/^$/d' "$1"; }

# Search/delete lines in history
function delHist() { sed -i '' "/$1/d" $HISTFILE; }

# Search history with grep
function hgrep() { history | grep -v 'grep' | egrep --color=auto "$@"; }

# cd directory of "foo"...
function cd2() { cd $(dirname $(which $1)); }

# cd directory and list
function cdl() {
    local _dir="$1"
    local _dir="${_dir:=$HOME}"
    [ -d "$_dir" ] && cd "$_dir" >/dev/null && ls || \
    echo "${0}: ${FUNCNAME}: ${_dir}: Directory not found";
}

# rsync folder2folder
function rsyncdir()
{
	# removing trailing "/" and adding our own
	# to make sure there is one, and not end up with "//"
	rsync -avzuc --delete "${1%/}/" "${2%/}/";
}

# Open
open() { xdg-open "$@" > /dev/null 2>&1 ;}

# Search and delete (recursively), using find. $1 = the regexp.
function searchFiles() { find . -name "$1" -type f; }
function rmFiles() { find . -name "$1" -type f -delete; }

function adminstall() { sudo install -v -m 0755 -o 0 -g 0 ${@}; }
function badminstall() { sudo install -vb -m 0755 -o 0 -g 0 ${@}; }
function Badminstall() { sudo install -vb -B .$(date '+%Y%m%d').bak -m 0755 -o 0 -g 0 ${@}; }


# Get this...
# --------------------

# Get site with wget
function wgetSite() { [ -n "$2" ] && _log="-o $2"; wget -ckpr "$1" $_log; }

# Get subdir of site with wget
# -np (--no-parent)
# -nH (--no-host-directories)
function wgetSub() { wget -ckpr -np "$1"; }
function wget2dir() { wget -ckpr -np -nH "$1"; }


# Manuals
# --------------------

# To avoid the d d o o u u b b l l e e and spaced letters use: col -b
# Usage: man2txt <foo> [ <path/to/output/file.txt> ]
function man2txt()
{
	[ -z $2 ] && _file="man_${1}.txt" || _file="$2";
	man $1 | col -b > $_file;
}


# Diff & Patching
# --------------------

# Create a patch file
# Usage: mkpatch original_file.ext my_modified.ext [patchname]
function mkpatch()
{
	_patch="$3";
	if [[ "$3" == '' ]]; then _patch="$2"; fi
	diff -Naur "$1" "$2" > "$_patch.patch";
}

# Apply patch
function patchfile() { patch < "$1"; }

# Patch a file
# Usage: patch1 patch_file
function patch1() { patch -p0 < "$1"; }

# version...
# Usage: patch21 filetopatch patch_file
function patch21() { patch "$1" < "$2"; }

# Sir Patchalot
function patchalot() { for file in $(ls *.patch); do patch -p0 < $file; done; }


# fail2ban
# --------------------------------------------------------------------------
# (help: fail2ban-client -h)
function f2bclient() { sudo fail2ban-client $@; }


# GPG
# --------------------------------------------------------------------------
function chksig() { gpg --verify "$1.sig" "$1"; }
function chkasc() { gpg --verify "$1.asc" "$1"; }
function mksig() { gpg -u 0x$1 -abo "$2.sig" "$2"; }
function mkasc() { gpg -u 0x$1 -ab "$2"; }
function signFile()
{
	[[ ! -f ${2} ]] && { echo "Usage: $FUNCNAME <id> <file> [sig]"; return 1; }
	[[ -z ${3} ]] && _out="-o ${2}.asc" || _out='';
	gpg2 -u "${1}" -sb ${2} file;
}


# Misc & Funsies
# --------------------

# comandline search
function ddg() { firefox "https://duckduckgo.com/?q=$1"; }

# Fix PDF file - title, author
# Usage: fixPDF "I'm a title" /path/to/pdf.
function fixPDF() {
    local _title="${1}";
    local _file="${2}";
    exiftool -overwrite_original -Author="" -Title="${_title}" "${_file}";
}

# Adminer :: Changing theme.
function chgAdminer()
{
	_theme="$1";
	sudo ln -s /usr/share/webapps/adminer/{themes/$_theme,adminer}.css
}

# youtube-dl
function ytdl() { youtube-dl -ci "$1"; }

# Most freq used commands
# usage: ctop 15
function ctop()
{
	if [ -z $1 ]; then echo 'Usage: ctop <int>';
	else
		local nr=$1;
		history | awk '{print $2}' | awk 'BEGIN {FS=" | "} {print $1}' | sort | uniq -c | sort -rn | head -$nr;
	fi
}

# Detailed information on an IP address or hostname in bash via http://ipinfo.io:
# https://wiki.archlinux.org/index.php/Bash/Functions#IP_info
# use “/json” incase users-agent set in ~/.curlrc
function ipInfo() {
	[[ $1 == '' ]] && _ip=$(dig +short myip.opendns.com @resolver1.opendns.com) || _ip=$1;
	if grep -P "(([1-9]\d{0,2})\.){3}(?2)" 2>/dev/null <<< "$_ip"; then
		curl https://ipinfo.io/"$_ip/json"
	else
		ipawk=($(host "$_ip" | awk '/address/ { print $NF }'))
		curl https://ipinfo.io/${ipawk[1]}/json
	fi
	echo
}

# Weather
function wttr() { curl -4 wttr.in/$1; }


# check %Sd
#function whatDisk()
#{
#    [[ -n "$1" ]] && _p="$1" || _p=.;
#    stat -f %Sd "${_p}";
#}