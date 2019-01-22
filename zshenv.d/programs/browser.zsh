# Example choices for browser:
#
#     w3m
#     lynx
#
(( ${+BROWSER} )) || export BROWSER=$(command -v w3m || command -v lynx || "")
