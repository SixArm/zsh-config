# SixArm.com » Z shell » /etc/zsh* system setup


## zsh startup files

There are five startup files that zsh will read commands from:

    .zshenv
    .zprofile
    .zshrc
    .zlogin
    .zlogout

The default location for this is in $HOME. We can customize this by setting $ZDOTDIR.


### .zshenv

.zshenv is sourced on all invocations of the shell, unless the -f option is set. It should contain commands to set the command search path, plus other important environment variables.

.zshenv should not contain commands that produce output or assume the shell is attached to a tty.


### .zshrc

.zshrc is sourced in interactive shells. It should contain commands to set up aliases, functions, options, key bindings, etc.


### .zlogin

.zlogin is sourced in login shells. It should contain commands that should be executed only in login shells. As a general rule, it should not change the shell environment at all. Rather, it should be used to set the terminal type and run a series of external commands (fortune, msgs, etc).

.zlogin is not the place for alias definitions, options, environment variable settings, etc.; 


### .zlogout

.zlogout is sourced when login shells exit.


### .zprofile

.zprofile is similar to .zlogin, except that it is sourced before .zshrc. 

.zprofile is meant as an alternative to .zlogin for ksh fans; the two are not intended to be used together, although this could certainly be done if desired. 
