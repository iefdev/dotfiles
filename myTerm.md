myTerm
------

The preference file for my Terminal settings. A modified version of the Pro theme.

When downloaded - just double click on it, or chose import from the Terminal preference window.

_You can also install (and make it default) via Terminal:_

```
open "<path to>/myTerm.terminal"; \
sleep 2; \
defaults write com.apple.terminal "Default Window Settings" -string "myTerm"; \
defaults write com.apple.terminal "Startup Window Settings" -string "myTerm";
```