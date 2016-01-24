# zstyle
#
# zstyle handles styles for context-sensitive configuration information.
# zstyle is used by zsh compsys, vcs_info, and oher shell subsystems.
#
# zstyle syntax:
#
#     zstyle "context-pattern" style value
#
# The system looks up the value of a style, and tries to match with pattern.
# The longer the pattern, the more specific it is, and higher the precendence.
#
# Style settings with broad context patterns are useful to set default values.
# Style setting with more-specific pattern are useful to override defaults.
#
# For example, when the zsh completion system is running, zstyle searches
# for all context patterns that starts with ":completion:".
#
# For example:
#
#     zstyle ':completion:*' verbose yes
#
# In the above command, anytime the `verbose' style is looked up in compsys,
# zstyle will yield the value `yes', unless there is another setting for the
# `verbose' style that is more specific, than ":completion:*", like:
#
#     zstyle ':completion:*:complete:ls:*:*' verbose no
#
# Our general preferences:
#
#   * Put settings for fonts and colors in personal files, not here.
#
# Credit:
#
#   * http://zsh.sourceforge.net/Guide/zshguide06.html
#   * http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/
#   * https://github.com/andreivolt/dotfiles/blob/master/zshrc
#
###

###
#
# Format
#
###

# zstyle can use format strings for typical output and errors:
#
#  * messages
#  * warnings
#  * corrections
#  * descriptions
#
# We prefer these global files to use format strings with plain text only,
# i.e. no font family (bold, underline, etc.), no colors, no escapes, etc.
# This is because we want maximum portability and maximum compatibility.
#
# If you prefer different format strings, please do not change these here;
# instead, set your own format strings by using your own user zshrc files.
#
# Font family format codes:
#
#     %B %b  Bold
#     %U %u  Underline
#
# Color ideas: https://wiki.archlinux.org/index.php/Color_Bash_Prompt
#
# For example to set purple messages and set red warnings:
#
#     zstyle ':completion:*:messages' format $'\e[01;35m%d\e[00;00m'
#     zstyle ':completion:*:warnings' format $'\e[01;31mNo match\e[00;00m'
#
# If you're doing font format strings in your own files, and want color,
# we suggest you set variables rather than using escape codes directly:
#
#     $fg           Use the foreground color
#     $reset_color  Reset the color
#
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "No match: %d"
zstyle ':completion:*:corrections' format '%d (errors: %e)%b'
zstyle ':completion:*:descriptions' format '%d'

###
#
# Menu
#
###

# menu select: do menu-driven completion. If an ambiguous completion
# produces at least <NUM> possibilities, menu selection is started.
#
# You can understand this best by trying it. One of the completions in
# the list, initially the top-leftmost, is highlighted and inserted
# into the line. By moving the cursor in the obvious directions (with
# wraparound at the edges), you change both the value highlighted and
# the value inserted into the line. When you have the value you want,
# hit return, which removes the list and leaves the inserted value.
#
# Hitting ^G (the editor function send-break) aborts menu selection,
# removes the list and restores the command line.
zstyle ':completion:*' menu select

###
#
# Misc
#
###

# verbose: many completion functions can generate matches in a simple
# form and a verbose form. zstyle uses the "verbose" style to decide
# which to use. We prefer always using the verbose form.
zstyle ':completion:*' verbose yes

# Continuously update completions
zstyle ':completion:*' rehash yes

###
#
# TODO: annotate everything below
#
###

zstyle ':completion:*' completer _complete _approximate

#TODO: manuals
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''

zstyle -e ':completion:*:approximate:*' max-errors \
          'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'

zstyle ':completion:*:sudo:*' command-path \
  /usr/local/sbin \
  /usr/local/bin \
  /usr/sbin \
  /usr/bin \
  /sbin \
  /bin \
  /usr/X11R6/bin

# Color completion for some things.
# http://linuxshellaccount.blogspot.com/2008/12/color-completion-using-zsh-modules-on.html
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*' group-name ''

## faster completion
#zstyle ':completion:*' accept-exact '*(N)'
#zstyle ':completion::complete:*' use-cache on
#zstyle ':completion::complete:*' cache-path ~/.tmp/.zsh-cache

## completion Styles
## list of completers to use
#zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

## allow selection from a menu
#zstyle ':completion:*' menu select=1 _complete _ignored _approximate
#zstyle -e ':completion:*' list-colors 'thingy=${PREFIX##*/} reply=( "=(#b)($thingy)(?)*=00=$color[blue]" )'

## match uppercase from lowercase, except for approximate completions
#zstyle ':completion:*:(^approximate):*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
## don't complete parent directory
#zstyle ':completion:*' ignore-parents parent pwd

##' # character that separates matches from their description
#zstyle ':completion:*' list-separator
#

## ignore completion functions for missing commands
#zstyle ':completion:*:functions' ignored-patterns '_*'

## fuzzy matching of mistyped completions
#zstyle ':completion:*' completer _complete _match _approximate
#zstyle ':completion:*:match:*' original only

## increase number of errors allowed with length of input
#zstyle -e ':completion:*:approximate:*' \
#  max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
#
#zstyle ':completion:*' group-name '' # group messages by group name
#zmodload zsh/complist
#zstyle ':completion:*:default' list-prompt '%S%M matches%s' # scroll long completion lists
#bindkey -M listscroll q send-break # quit pager with 'q'
#bindkey -M menuselect '\C-o' accept-and-menu-complete # in menu seletion, Ctrl-o to accept the match but remain in menu selection
#bindkey '^[[Z' reverse-menu-complete
#

## approximate completion
#zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
#zstyle ':completion::::' completer _complete _approximate
#zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) )' # allow one error for every three characters typed

## prefix completion
#setopt  complete_in_word
#zstyle ':completion::*:::' completer _complete _prefix
#zstyle ':completion:*:prefix:*' add-space true

## correct mistyped prefixes
#zstyle ':completion:::::' complete _complete _approximate
#zstyle ':completion::approximate*:*' prefix-needed false

## ignore already listed files
#zstyle ':completion:*:(mv|cp|diff|vi):*' ignore-line yes
