#
# ~/.bash_profile
#

# Adding session...
history -a ~/.bash_history;

# Clean up the Dropbox cache
[ -d ~/Dropbox/.dropbox.cache ] && rm -rf ~/Dropbox/.dropbox.cache/*;
