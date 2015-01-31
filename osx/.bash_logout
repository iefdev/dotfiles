# Adding session...
history -a ~/.bash_history;

# Delete the "hidden" download history
sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent';

# Clean up the Dropbox cache
[ -d ~/Dropbox/.dropbox.cache ] && rm -rf ~/Dropbox/.dropbox.cache/*;

# Bye... (in Swedish ^^)
say -v Samantha Hey dauh;
