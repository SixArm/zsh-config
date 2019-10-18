# Z shell configuration

We use Z shell extensively, on many kinds of systems. We use a Z shell configuration and directory naming conventions that help with compatibility, flexibility, and portability. This repo describes our conventions and has our typical starter setup for Z shell aliases, functions, settings, etc. In practice this works well with other Z shell tools, such as oh-my-zsh.

Contents:

* [zsh startup files](#zsh-startup-files)
  * [zsh locations](#zsh-locations)
  * [zsh directories](#zsh-directories)
  * [zsh loading](#zsh-loading)
* [zsh startup files: when they load and what they do](#zsh-startup-files-when-they-load-and-what-they-do)
  * [zshenv](#zshenv)
  * [zprofile](#zprofile)
  * [zshrc](#zshrc)
  * [zlogin](#zlogin)
  * [zlogout](#zlogout)
  * [extras](#extras)
* [Repo files](#repo-files)
  * [Conventions](#conventions)
  * [Install](#install)
  * [Install system-wide](#install-system-wide)
  * [Contribute your files](#contribute-your-files)


## zsh startup files

There are five startup files that zsh will read commands from in order:

```zsh
zshenv
zprofile
zshrc
zlogin
zlogout
```

Below, we explain more about each of these files, when it is loaded, and what it does.


### zsh locations

The default location for zsh system-wide files is in `/etc`.

The default location for zsh user files is in `$HOME`; this can be customized by setting `$ZDOTDIR`.

Thus the default locations are:

```zsh
/etc/zshenv
/etc/zprofile
/etc/zshrc
/etc/zlogin
/etc/zlogout

$HOME/.zshenv
$HOME/.zprofile
$HOME/.zshrc
$HOME/.zlogin
$HOME/.zlogout
```


### zsh directories

We use the default locations, plus a convention of corresponding directories where we can put additional files:

```zsh
/etc/zshenv.d
/etc/zprofile.d
/etc/zshrc.d
/etc/zlogin.d
/etc/zlogout.d

$HOME/.zshenv.d
$HOME/.zprofile.d
$HOME/.zshrc.d
$HOME/.zlogin.d
$HOME/.zlogout.d
```

To create the directories:

```zsh
sudo mkdir -p /etc/zshenv.d
sudo mkdir -p /etc/zprofile.d
sudo mkdir -p /etc/zshrc.d
sudo mkdir -p /etc/zlogin.d
sudo mkdir -p /etc/zlogout.d

mkdir -p $HOME/.zshenv.d
mkdir -p $HOME/.zprofile.d
mkdir -p $HOME/.zshrc.d
mkdir -p $HOME/.zlogin.d
mkdir -p $HOME/.zlogout.d
```


### zsh loading

To make zsh to load the files from the directories, we edit each zsh file, and add a line like this:

```zsh
for f in /etc/zshenv.d/**/*.zsh(N); do [ -r "$f" ] && source "$f"; done
```

We must customize the above line for each specific path, such as this line for the user's file:

```zsh
for f in $HOME/.zshenv.d/**/*.zsh(N); do [ -r "$f" ] && source "$f"; done
```


## zsh startup files: when they load and what they do


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


### extras

Some zsh setups provide more files that are not read by zsh:

  * `.zsh-update`: contains a timestamp of the most recent update

  * `.zshrc-e`: an example file; the Z shell convention is example files end in `-e`.


## Repo files

This repo contains our Z shell conventions for subdirectories and also our files that we like to use with multiple teams.

Notable subdirectories:

  * `zshenv.d/functions` is for functions.

  * `zshenv.d/programs` is for configuring environment programs via environment variables, such as `$EDITOR`, `$PAGER`, etc.

  * `zshenv.d/settings` is for Z shell settings, such as for completion, history, etc.

  * `zshrc.d/aliases` is for aliases, such as `g` for `git`, `now` for printing the current time, etc.


### Conventions

Alias conventions:

  * For an alias that is a one-letter shortcut, we use a naming convention for the file: the letter, an equal sign, and the result. For example, the file `g=git.zsh` is the alias that sets `g` to run `git`.

  * For an alias that is intended to launch a program, we use a convention of trying probable locations for the tool. For example, for the alias `firefox`, we look in order in `/opt` (e.g. typical for our custom installs), then on the path, then in the typical macOS location.


Environment program conventions:

  * `$EDITOR` for editing text files, such as `vi` or `emacs`.

  * `$PAGER` for showing text files, such as `more` or `less`.
  
  * `$FINDER` for searching text files, such as `grep` or `rg`.

  * `$CLIPPER` for copying text to a clipboard, such as `xclip` or `pbcopy`.
  
  * `$DATER` for showing dates and times, such as `date` or `gdate`.

  * `$JUMPER` for moving among directories, such as `jump` or `jumpdir`.


Date/time format conventions:  

  * We default to nanoseconds precision (not seconds precision), because we use subsecond precision on some of our systems.

  * We default to UTC timezone and the format "+00:00" (not "Z"), because this maximizes our compatibility with fintech systems and logs.



### Install

Clone:

```zsh
git clone https://github.com/sixarm/sixarm_zsh_config
```

Move the directories and files as you like, to wherever you want.

For example, to copy all the files into your user directories:

```zsh
cd sixarm_zsh_etc_files
cp -R zshenv.d/* $HOME/.zshenv.d
cp -R zprofile.d/* $HOME/.zprofile.d
cp -R zshrc.d/* $HOME/.zshrc.d
cp -R zlogin.d/* $HOME/.zlogin.d
cp -R zlogout.d/* $HOME/.zlogout.d
```


### Install system-wide

For some of our systems, we prefer to install system-wide, so the repo files are available for all the system users.

We also prefer to keep the repo directory independent, so we can fetch changes when we want. 

To do this, we put the repo in our preferred directory `/opt`:


```zsh
git clone https://github.com/sixarm/sixarm_zsh_config /opt/sixarm_zsh_config
```

Each user can then use the files by editing the corresponding user file and adding a line like:

```zsh
for f in /opt/sixarm_zsh_config/zshenv.d/**/*.zsh(N); do [ -r "$f" ] && source "$f"; done
```


### Contribute your files

If you have zsh files that you like and that are good for many people, then send them along. We welcome additions, and also welcome pull requests.
