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
function mkbakd() { _dir=`echo "$1" | sed 's/\/*$//g'`; ditto -v "$_dir"{,.bak}; }
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


# Remove sticky bit
function rmxattr()
{
	local _file="$1"
	xattr -d $(xattr "$_file") "$_file";
}

# Set dir to 755, files to 644
function fixfolder() { chmod u+rwX,go+rX "$1"; }


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

# open man-page(s) in its own window. Use: "manx" instead of "man" (OS X)
function manx() { local i; for i; do open x-man-page://$i; done; }

# comandline search
function ddg() { open -a Firefox "https://duckduckgo.com/?q=$1"; }

# Compression
# ------------------------------------------------------------------------------

# tar.gz ($1 = folder name)
function tarGZ()
{
	_pwd=`pwd`;
	_dir=`echo "$1" | sed -e 's/\/$//g'`;
	cd `dirname $_dir` && _dir=`basename $_dir`;
	tar -zcvf "$_dir".tar.gz --exclude ".DS_Store" --exclude "._*" "$_dir";
	cd $_pwd;
}
function untarGZ() { tar -zxvf "$1"; }

# tar.bz2
function tarBZ()
{
	_pwd=`pwd`;
	_dir=`echo "$1" | sed -e 's/\/$//g'`;
	cd `dirname $_dir` && _dir=`basename $_dir`;
	tar -jcvf "$_dir".tar.bz2 --exclude ".DS_Store" --exclude "._*" "$_dir";
	cd $_pwd;
}
function untarBZ() { tar -jxvf "$1"; }

# tar.xz
function tarXZ()
{
	_pwd=`pwd`;
	_dir=`echo "$1" | sed -e 's/\/$//g'`;
	cd `dirname $_dir` && _dir=`basename $_dir`;
	tar -cvf - "$_dir" | xz -4e > "$_dir".tar.xz;
	#tar -cvf - "$_dir" | xz -2e > "$_dir".tar.xz;
	cd $_pwd;
}
function untarXZ() { tar -jxvf "$1"; }


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

# Adminer :: Changing theme.
function chgAdminer()
{
	_theme="$1";
	sudo ln -s /usr/share/webapps/adminer/{themes/$_theme,adminer}.css
}

# GPG
function chksig() { gpg --verify "$1.sig" "$1"; }


# youtube-dl
function ytdl() { youtube-dl -ci "$1"; }

# ffmpeg - 320k mp3
function 2mp3()
{ 	
	local output=$(echo "$1" | sed -e 's/\.\(.*\)$/\.mp3/');
	ffmpeg -i "$1" -ab 320k "${output}";
}

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

# Thumbs (defaults) to 250px. Max 500.
function mkthumb()
{
	_msg="$FUNCNAME: Can't find 'convert'. Please install ImageMagick...";
	[[ ! `type convert 2> /dev/null` ]] && echo $_msg && return 1;
	[[ $2 && $2 -lt 501 ]] && _px=$2 || _px=250;
	local _file=$(basename "$1");
	_ext=$(echo $_file | sed -e "s/${_file%.*}//");
	convert -resize ${_px}x${_px} -quality 100 "$1" "${1%.*}_${_px}px$_ext";
}
