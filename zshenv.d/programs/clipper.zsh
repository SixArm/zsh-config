# Clipper is the shell program that copies text to the clipboard.
#
## Example choices:
#
#   * xclip on Linux
#   * pbcopy on macOS
#
(( ${+CLIPPER} )) || export CLIPPER=$( command -v xclip || command -v pbcopy || "" )
