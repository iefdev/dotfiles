# Adding session...
history -a ~/.bash_history;

# Clean up the Dropbox cache
[ -d ~/Dropbox/.dropbox.cache ] && rm -rf ~/Dropbox/.dropbox.cache/*;

# Bye-bye...
mplayer "http://translate.google.com/translate_tts?tl=en&q=Bye%20bye";