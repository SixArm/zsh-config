# Example choices for editor:
#
#     vim
#     emacs -nw --color=no
#     emacsclient --alternate-editor="" -c "$@"
#
(( ${+EDITOR} )) || export EDITOR="emacsclient -a '' -c"
(( ${+ALTERNARTE_EDITOR} )) || export ALTERNATE_EDITOR="emacs"
(( ${+VISUAL} )) || export VISUAL="emacsclient -a '' -c"
