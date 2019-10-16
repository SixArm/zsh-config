# Example choices for clipper:
#
#   * xclip on Linux
#   * pbcopy on macOS
#
(( ${+CLIPPER} )) || export CLIPPER=$( command -v xclip || command -v pbcopy || "" )
