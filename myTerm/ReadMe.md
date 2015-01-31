myTerm
======

This is **my Term**inal theme in OS X.

 

### myTerm.terminal

_(Theme)_

The preference file for my Terminal settings. A modified version of the Pro theme.

**Install:** Just double click on the file, or chose import from the Terminal preference window.

_You can also install (and make it default) via Terminal:_

```
open "<path to>/myTerm.terminal"; \
sleep 2; \
defaults write com.apple.terminal "Default Window Settings" -string "myTerm"; \
defaults write com.apple.terminal "Startup Window Settings" -string "myTerm";
```

 

### myTerm_maingrp.terminal

_(Window Group)_

“Maingrp” has 3 windows. 1 big/tall on the left, and 2 in half on the right. I use it when Terminal starts.

**Install:** Just dubbelclick on the file and it will load. If you want the window group to load on start, look in: _Terminal preferences: Startup->Window group_

You can also add a shortcut in: _System Preferences -> Keyboard -> Shortcuts: Applications_

Add a new for Terminal:

- maingrp        ^⌘1



### Screenshot

The sizes are based on my screen: 1920x1200 (16:10), so it _might_ break (don't fit) on your screen.

![][scrap_maingrp]

_You can see more screenshots in the [Archey-OS-X][archey] repository_


<!-- Markdown: links & images -->

[scrap_maingrp]: https://raw.githubusercontent.com/iEFdev/dotfiles/master/myTerm/myTerm_maingrp.jpg "Window group: maingrp ^⌘1"
[archey]: https://github.com/iEFdev/Archey-OS-X "Archey :: OSX"
