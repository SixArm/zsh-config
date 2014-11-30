# /etc/zsh/zshenv: system-wide .zshenv file for zsh(1).
#
# The First Law of Zsh Administration: put as little as possible in this file,
# because every single zsh which starts up has to read it. In particular, if
# a script assumes that only the basic zsh options are set but /etc/zshenv
# has altered them, then the script might not work.
#
# This file is sourced on all invocations of the shell.
#
# Credit for much of this: http://zsh.sourceforge.net/Guide/zshguide02.html
#
# If the -f flag is present or if the NO_RCS option is set within this file,
# all other initialization filesare skipped. See below for details on RCS.
#
# This file should contain commands to set the command
# search path, plus other important environment variables.
#
# This file should not contain setting for interactive shells, such as prompts,
# nor commands that produce output, nor assume the shell is attached to a tty,
# unless you insist that all users have them as defaults for every single shell.
#
# Script writers who want to get round problems with any options being changed
# in /etc/zshenv should put `emulate zsh' at the top of the script.
#
# Global Order: zshenv, zprofile, zshrc, zlogin


### RCS ###

# This file /etc/zshenv is always run at the start of any zsh.
# However, if the option NO_RCS is set (or, equivalently, the RCS
# option is unset) then none of the other zsh files are run.
#
# The typical way of setting this option is with command line flag: if you
# start the shell as `zsh -f', the option becomes set, so only /etc/zshenv
# is run and the others are skipped. Often, scripts do this as a way of
# trying to get a basic shell with no frills, but if something is set
# in /etc/zshenv, there's no way to avoid it.

. /etc/environment
[[ -o norcs ]] && exit 0

# System-wide environment settings for zsh(1).
# This block comes from Mac OSX 10.9.
if [ -x /usr/libexec/path_helper ]; then
        eval `/usr/libexec/path_helper -s`
fi

### CONSTANTS ###

# what counts as a word for completion and backspacing;
# notably we omit the slash because we want tcsh-like
# behavior of using alt-backspace to go up a file path.
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'


### APPS ###

(( ${+BROWSER} )) || export BROWSER="w3m"
(( ${+EDITOR} ))  || export EDITOR="emacs -nw --color=no"
(( ${+PAGER} ))   || export PAGER="most"


### FUNCTIONS ###

# csh compatibility
setenv() { export $1=$2 }


### MISC ###

zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit


### INCLUDE ###

for f in /etc/zshenv.d/**/*.zsh(N); do; [ -r $f ] && source $f; done
