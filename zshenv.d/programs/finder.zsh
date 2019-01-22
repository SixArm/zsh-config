# Example choices for finder:
#
#     rg
#     ag
#     grep
#
(( ${+FINDER} )) || export FINDER=$(command -v rg || command -v ag || command -v grep || "")
