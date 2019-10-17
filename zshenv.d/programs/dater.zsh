# Example choices for dater:
#
#   * /usr/local/opt/coreutils/libexec/gnubin/date
#   * gdate
#   * chrome
#   * google-chrome
#   * w3m
#   * lynx

# Note: the items above that use `coreutils` and `gdate` are typical of 
# macOS `brew install coreutils`, which puts the GNU command `date` in 
# a special location and with the name `gdate` in order to ensure the 
# GNU command does not accidentally shadow the existing macOS `date`.
#
(( ${+DATER} )) || export DATER=$( command -v /usr/local/opt/coreutils/libexec/gnubin/date || command -v gdate || command -v date || "" )
