# dotfiles

![][license_badge]

Since I use both Mac and GNU/Linux, the commands/functions/aliases for each platform are different. Earlier I kept the dotfiles in 2 separate folder here (osx, linux), but I have merged them now to be able to use the same set of files on all computers. You'll notice a few if statements throughout the files, like:

```bash
[[ ${__DARWIN__} ]] && ...
[[ ${__LINUX__} ]] && ...
etc.
```

To clean up the home folder… Except the standard bash files, the additional bash files are located in: `~/.bash.d/<file>`. To load them - just add the name into the `bash_files` array:

```bash
bash_files=( ruby aliases functions git cheat opo venv );
```

- - -

Some of the content _(functions/aliases)_ are sometimes being removed and moved to their own scripts instead. You'll most likely find those scripts in the [junkyard][jy].


## Notes

###### Linux

At the moment… `~/.bash.d/dnf` and `~/.bash.d/yum` are empty.

Some aliases and functions are using `x-clip`. Look in your package manager, or download it [here][xclip].


###### OS X / macOS

...


## License

![][license_badge]

The content of this repository is released under the BSD Zero Clause License ([SPDX: 0BSD][spdx])

See [`LICENSE`][license] for more information.

<!--
## Contributing

1. Fork it (<https://gitlab.com/iefdev/vimfiles/forks/new>)
2. Create your feature branch (`git checkout -b feature/this`)
3. Commit your changes (`git commit -am 'Add this feature'`)
4. Push to the branch (`git push origin feature/this`)
5. Create a new Merge Request
-->

<!-- Markdown link & img dfn's -->
[license_badge]: https://img.shields.io/badge/License-0BSD-778899.svg?style=plastic "BSD Zero Clause License (SPDX: 0BSD)"
[license]: ./LICENSE "LICENSE"
[spdx]: https://spdx.org/licenses/0BSD.html "SPDX: 0BSD"

[jy]: https://gitlab.com/iEFdev/junkyard "Junkyard"
[xclip]: http://sourceforge.net/projects/xclip/ "xclip :: SourceForge"
