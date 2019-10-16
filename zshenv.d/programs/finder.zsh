# Example choices for finder:
#
#   * rg (ripgrep)
#   * ag (the silver searcher)
#   * egrep (enhanced grep)
#   * grep (typical grep)
#
(( ${+FINDER} )) || export FINDER=$( command -v rg || command -v ag || command -v egrep || command -v grep || "" )
