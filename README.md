# SixArm.com » Z shell » <br> /etc/zsh* system setup


## To install for all users

To install for all users system-wide:

    sudo cp -R z* /etc/

Caution: this may overwrite you system's existing zsh files, so look first.


## zsh startup files

There are five startup files that zsh will read commands from in order:

    zshenv
    zprofile
    zshrc
    zlogin
    zlogout

We organize our files in corresponding directories:

    zshenv.d
    zprofile.d
    zshrc.d
    zlogin.d
    zlogout.d

The default location for zsh system-wide files is in `/etc`.

The default location for zsh user files is in $HOME. We can customize this by setting $ZDOTDIR.


### zshenv

`zshenv` is sourced on all invocations of the shell, unless the -f option is set.

What goes in it:

  * Set up the command search path
  * Other important environment variables
  * Commands to set up aliases and functions that are needed for other scripts

What does NOT go in it:

  * Commands that produce output
  * Anything that assumes the shell is attached to a tty


### zprofile

`zprofile` is sourced in login shells. It is meant as an alternative to `zlogin` for `ksh` fans; the two are not intended to be used together, although this could certainly be done if desired.

What goes in it:

  * Commands that should be executed only in login shells.
  * As a general rule, it should not change the shell environment at all.
  * As a general rule, set the terminal type then run a series of external commands e.g. fortune, msgs, etc.

What does NOT go in it:

  * Alias definitions
  * Function definitions
  * Options
  * Environment variable settings


### zshrc

`zshrc` is sourced in interactive shells.

What goes in it:

  * Commands to set up aliases, functions, options, key bindings, for interactive use etc.


### zlogin

`zlogin` is like `zprofile`, except sourced after zshrc.


### zlogout

`zlogout` is sourced when login shells exit.
