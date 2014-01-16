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


### HISTORY ###

# location of history
(( ${+HISTFILE} )) || export HISTFILE=~/.histfile

# number of lines kept in history
(( ${+HISTSIZE} )) || export HISTSIZE=10000

# number of lines saved in the history after logout
(( ${+SAVEHIST} )) || export SAVEHIST=10000 


### HISTORY SAVE ###

# APPEND_HISTORY: zsh appends  new history to the old. Good for most people to use.
# The shell will make an effort not to write out lines which should be there already. 
# However, this can get complicated if you have lots of zshs running at once. 
#
# INC_APPEND_HISTORY means that instead of writing history when the shell exits, 
# each line is added to the history in this way as it is executed; this means, 
# for example, that if you start up a zsh inside the main shell its history will 
# look like that of the main shell, which is quite useful. It also means the 
# ordering of commands from different shells running at the same time is much 
# more logical --- basically just the order they were executed --- so for 3.1.6
# and higher this option is recommended.
#
# SHARE_HISTORY takes this one stage further: as each line is added, the history 
# file is checked to see if anything was written out by another shell, and if so
# it is included in the history of the current shell too. This means that zsh's 
# running in different windows but on the same host (or more generally with the
# same home directory) share the same history. Note that zsh tries not to confuse
# you by having unexpected history entries pop up: if you use !-style history,
# the commands from other session don't appear in the history list until you
# explicitly type the history command to display them, so that you can be sure 
# what command you are actually reexecuting.

setopt INC_APPEND_HISTORY


### HISTORY DUPS ###

# These options give ways of dealing with duplicates that appear in the history. 
#
# HIST_IGNORE_DUPS is the simplest: it tells the shell not to store a history line
# if it's the same as the previous one, thus collapsing repeated commands to one;
# this is a very good option to have set. It does nothing when dups are not adjacent.
#
# HIST_IGNORE_ALL_DUPS: removes copies of lines still in the history list, 
# keeping the newly added one. 
#
# HIST_EXPIRE_DUPS_FIRST: preferentially removes duplicates when 
# the history fills up, but does nothing until then. 
#
# HIST_SAVE_NO_DUPS: whatever options are set for the current session, 
# the shell is not to save duplicated lines more than once.
#
# HIST_FIND_NO_DUPS: even if duplicate lines have been saved, searches 
# backwards with editor commands don't show them more than once.

setopt HIST_IGNORE_DUPS


### HISTORY IGNORE ###

# These options allow you to say that certain lines shouldn't go into the history. 
#
# HIST_IGNORE_SPACE: lines which begin with a space don't go into the history;
# the idea is that you deliberately type a space, which is not otherwise 
# significant to the shell, before entering any line you want to be forgotten.
# In zsh 4.0.1 this is implemented so that you can always recall the immediately
# preceding line for editing, even if it had a space; but when the next line is
# executed and entered into the history, the line with a space is forgotten.
#
# HIST_NO_STORE: skip history or fc commands. 
#
# HIST_NO_FUNCTIONS: skip function definitions; these can be tiresomely long. 
# These are anything beginning `function funcname {...' or `funcname () { ...'.

# NO_HIST_BEEP: if you try to scroll  beyond the end of the history list, 
# the shell will beep. It is on by default, so use NO_HIST_BEEP to turn it off.

setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_NO_FUNCTIONS


### APPS ###

(( ${+BROWSER} )) || export BROWSER="w3m"
(( ${+EDITOR} ))  || export EDITOR="emacs -nw --color=no"
(( ${+PAGER} ))   || export PAGER="most"


### OPTS ###

# Symlinks are there for a reason
unsetopt CHASE_LINKS

# Place the location of each command in the hash table.
setopt HASH_CMDS

# When a command runs, hash the directory containing it and parents.
setopt HASH_DIRS

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

setopt autocd beep extendedglob nomatch notify
setopt AUTO_CD

zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit


### INCLUDE ###

for f in /etc/zsh.d/**/*; do; [ -r $f ] && source $f; done
