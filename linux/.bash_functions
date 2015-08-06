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
# ------------------------------------------------------------------------------

# locate in ext. disk (pics, docs etc)
#function Locate { locate $* | egrep "^/Volumes/NameOfDisk"; }

# Make a dir and cd into it
function mkdircd() { mkdir -p "$1" && cd "$1"; }

# Misc bak helpers (mbakd, for dirs)
#function mkbakd() { _dir=`echo "$1" | sed 's/\/*$//g'`; ditto -v "$_dir"{,.bak}; }
function mkbak() { cp -iv "$1"{,.bak}; }
function mvbak() { mv -iv "$1"{,.bak}; }

# Search/delete lines in history
function delHist() { sed -i '' "/$1/d" $HISTFILE; }

# cd directory of "foo"...
function cd2() { cd $(dirname `which $1`); }

# cd directory and list
function cdl() { cd "$1"; ls -Ahl; }

# rsync folder2folder
function rsyncdir() {
	# removing trailing "/" and adding our own
	# to make sure ther is one, and not end up with "//"
	_from_dir=`echo "$1" | sed 's/\/*$//g'`;
	_to_dir=`echo "$2" | sed 's/\/*$//g'`;
	rsync -avzuc --delete "$_from_dir/" "$_to_dir/";
}

# GPG
function chksig() { gpg --verify "$1.sig" "$1"; }

# Open
open() { xdg-open "$@" > /dev/null 2>&1 ;}


# Get this...
# ------------------------------------------------------------------------------

# Get site with wget
function wgets()
{
	if [ $2 ]; then logFile="-o $2"; else logFile=''; fi
	wget --convert-links -r "$1" $logFile;
}

# Get site with wget
function wgetsub() { wget -r -l1 --no-parent "$1"; }


# Manuals
# ------------------------------------------------------------------------------
# To avoid the d d o o u u b b l l e e and
# spaced letters use: col -b
# Usage:
# manOut grep				// grep_manual.txt (in pwd)
# manOut grep ~/foo/grep	// ~/foo/grep_manual.txt
function man2txt()
{
	_path="$2";
	if [[ "$2" == '' ]]; then _path="$1"; fi
	man $1 grep | col -b > $_path_manual.txt
}


# Compression
# ------------------------------------------------------------------------------

# tar.gz ($1 = folder name)
function tarGZ()
{
	_dir=`echo "$1" | sed -e 's/\/$//g'`;
	tar -zcvf "$_dir".tar.gz --exclude ".DS_Store" --exclude "._*" "$_dir";
}
function untarGZ() { tar -zxvf "$1"; }

# tar.bz2
function tarBZ()
{
	_dir=`echo "$1" | sed -e 's/\/$//g'`;
	tar -jcvf "$_dir".tar.bz2 --exclude ".DS_Store" --exclude "._*" "$_dir";
}
function untarBZ() { tar -jxvf "$1"; }

# Function extract
# (using 7za instead of 7z)
extract ()
{
	if [ -f $1 ]; then
		case $1 in
			*.tar.xz | *.tar.bz2 | *.tbz2) tar -jxvf $1 ;;
			*.tar.gz | *.tgz) tar -zxvf $1 ;;
			*.bz2) bunzip2 $1	;;
			*.rar) unrar -e $1	;;
			*.gz) gunzip $1		;;
			*.tar) tar -xf $1	;;
			*.zip) unzip $1		;;
			*.Z) uncompress $1	;;
			*.7z) 7za -x $1		;;
			*)
				echo "'$1' cannot be extracted via extract()";
				;;
		esac;
	else
		echo "'$1' is not a valid file";
	fi
}


# Diff & Patching
# ------------------------------------------------------------------------------

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


# Misc & Funsies
# ------------------------------------------------------------------------------

# OSX "say" for Linux
# http://jacobsalmela.com/raspberry-pi-and-the-say-command-from-osx-how-to-make-your-pi-speak-at-will/
function say() { mplayer "http://translate.google.com/translate_tts?tl=en&q=$1"; }

# youtube-dl
function ytdl() { youtube-dl -ci "$1"; }

# Most freq used commands
# usage: ctop 15
function ctop()
{
	local nr=$1;
	history | awk '{print $2}' | awk 'BEGIN {FS=" | "} {print $1}' | sort | uniq -c | sort -rn | head -$nr;
}

# Thumbs to 250px
function athumb()
{
	local _ext=$(echo $1 | sed -e "s/${1%.*}//");	
	convert -resize 250x250 -quality 100 $1 ${1%.*}_250px$_ext;
}
