## Notes about this folder

To clean up the home folder we use `.config/tmux` - which is equal to
`XDG_CONFIG_HOME/tmux`.

To manage the tmux settings more easily, the settings are split into
different files - just like the settings for Bash, Vim, etc.

Keep the main config file here (`tmux.conf`) and then put a symlink to it from `HOME`.

```
$ ln -s .config/tmux/tmux.conf .tmux.conf
```

In that way you can access the file both from here and `HOME`:

