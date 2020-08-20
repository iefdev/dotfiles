# dotfiles

![][license]

Since I use both Mac and GNU/Linux, the commands/functions/aliases for each platform are different. Earlier I kept the dotfiles in 2 separate folder here (osx, linux), but I have merged them now to be able to use the same set of files on all computers. You'll notice a few if statements throughout the files, like:

```bash
[[ ${__DARWIN__} ]] && ...
[[ ${__LINUX__} ]] && ...
etc.
```

To clean up the home folder… Except the standard bash files, the additional files lives in a subfolder: `~/.bash.d/bash_*`. To load them - just add the last part of the name into the `bash_file` array:

```bash
bash_files=( ruby aliases functions git cheat opo venv );
```


- - -


Some of the content _(functions/aliases)_ are sometimes being removed and moved to their own scripts instead. You'll most likely find those scripts in the [junkyard][jy].



### Notes

###### Linux

At the moment… `bash_dnf` and `bash_yum` are empty.

Some aliases and functions are using `x-clip`. Look in your package manager, or download it [here][xclip].



###### OS X / macOS

...


<!-- Markdown: link and img defs -->
[license]: https://img.shields.io/badge/License-0BSD-789.svg?style=plastic "BSD Zero Clause License (SPDX: 0BSD)"
[jy]: https://gitlab.com/iEFdev/junkyard "Junkyard"
[xclip]: http://sourceforge.net/projects/xclip/ "xclip :: SourceForge"