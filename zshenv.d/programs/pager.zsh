# Example choices for pager:
#
#   * bat
#   * most
#   * less
#   * more
#   * cat
#
(( ${+PAGER} )) || export PAGER=$( command -v bat || command -v most || command -v less || command -v cat || "" )
