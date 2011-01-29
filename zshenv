# /etc/zsh/zshenv: system-wide .zshenv file for zsh(1).
#
# This file is sourced on all invocations of the shell.
# If the -f flag is present or if the NO_RCS option is
# set within this file, all other initialization files
# are skipped.
#
# This file should contain commands to set the command
# search path, plus other important environment variables.
# This file should not contain commands that produce
# output or assume the shell is attached to a tty.
#
# Global Order: zshenv, zprofile, zshrc, zlogin

source /etc/environment

### CONSTANTS ###
 
# what counts as a word for completion and backspacing;
# notably we omit the slash because we want tcsh-like
# behavior of using alt-backspace to go up a file path.
export WORDCHARS='*?_-.[]~&;!#$%^(){}<>'


### HISTORY ###

# location of history
(( ${+HISTFILE} )) || export HISTFILE=~/.histfile

# number of lines kept in history
(( ${+HISTSIZE} )) || export HISTSIZE=10000

# number of lines saved in the history after logout
(( ${+SAVEHIST} )) || export SAVEHIST=10000 


### APPS ###

(( ${+BROWSER} )) || export BROWSER="w3m"
(( ${+EDITOR} ))  || export EDITOR="emacs"
(( ${+PAGER} ))   || export PAGER="most"


### OPTS ###

# Symlinks are there for a reason
unsetopt CHASE_LINKS

# Place the location of each command in the hash table.
setopt HASH_CMDS

# When a command runs, hash the directory containing it and parents.
setopt HASH_DIRS

# Share history between zsh processes
setopt INC_APPEND_HISTORY

# No beep ever
setopt NO_BEEP

#"running" `/etc` actually does a `cd /etc`
setopt AUTO_CD

setopt AUTO_LIST 

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

#tab completion moves to end of word
setopt ALWAYS_TO_END
setopt listtypes 

# %1 killed. will show up exactly when it is killed.
setopt interactivecomments
unsetopt flowcontrol


### FUNCTIONS ###

# csh compatibility
setenv() { export $1=$2 }


### MISC ###

setopt appendhistory autocd beep extendedglob nomatch notify

zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit


### SIXARM SPECIFIC SETUP ###

if [[ -x /home/sixarm/github/sixarm_unix_shell_scripts/ruby-versioner ]]
then
  source /home/sixarm/github/sixarm_unix_shell_scripts/ruby-versioner 192p136
fi
