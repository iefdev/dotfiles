# Adding session...
history -a ~/.bash_history

# Clean up
# Need a few aliases...
if [ -f ~/.bash_aliases ]; then

	# Clean up download (hidden) history
	cleanDL

	# Clean up the Dropbox cache
	[ -d ~/Dropbox/.dropbox.cache ] && cleanDBC
fi

# Bye... (in Swedish ^^)
say -v Samantha Hey dauh
