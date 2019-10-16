# Example choices for editor:
#
#     vim
#     emacs -nw --color=no
#     emacsclient --alternate-editor="" -c "$@"
#
(( ${+EDITOR} )) || export EDITOR="vim"
(( ${+ALTERNARTE_EDITOR} )) || export ALTERNATE_EDITOR="vim"
(( ${+VISUAL} )) || export VISUAL="vim"
