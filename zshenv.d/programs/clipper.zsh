# Clipper is the shell program that copies text to the clipboard.
#
# Example choices:
#
#   * pbcopy on macOS
#   * xclip on Linux
#
(( ${+CLIPPER} )) || export CLIPPER=$( command -v pbcopy || command -v xclip || "" )
