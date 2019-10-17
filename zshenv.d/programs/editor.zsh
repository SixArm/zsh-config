# Example choices for editor:
#
#   * vi
#   * vim
#   * emacs -nw --color=no
#   * emacsclient --alternate-editor="" -c "$@"
#
(( ${+EDITOR} )) || export EDITOR=$( command -v vim || command -v vi || "" )
(( ${+ALTERNATE_EDITOR} )) || export ALTERNATE_EDITOR=$( command -v vim || command -v vi || "" )
(( ${+VISUAL} )) || export VISUAL=$( command -v vim || command -v vi || "" )
