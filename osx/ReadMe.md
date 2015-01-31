dotfiles :: OS X
================

This is a set of the dotfiles I use with OS X.

<br />

hostname
--------

In OS X, sometimes the hostname in Terminal ends up with a long serie of numbers and letters (ISP related).

To fix that, use [`scutil`][man] _(OS X link)_.

| Read                       | Set new name                                         |
| :------------------------- | :--------------------------------------------------- |
| scutil --get LocalHostName | sudo scutil --set LocalHostName Shortname            |
| scutil --get ComputerName  | sudo scutil --set ComputerName "Shortname's Mac Pro" |
| scutil --get HostName      | sudo scutil --set HostName foobar.dev                |


### Example

- Hostname: `foobar.dev`


Set with `scutil`:

	sudo scutil --set HostName foobar.dev


In `/etc/hostconfig`, add:

	HOSTNAME=foobar.dev


If you use a hostname with a dot _(like: foobar.dev)_. `PS1` will display different when using `\h` or `\H`:

	\h		# diplays foobar
	\H		# diplays foobar.dev

<!-- Markdown: link & image defs -->
[man]: x-man-page://scutil "Direct link to the manual page in OS X Terminal: x-man-page://scutil"