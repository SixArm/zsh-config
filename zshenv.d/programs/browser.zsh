# Browser is the shell program that launches a web browser.
#
# Example choices:
#
#   * firefox
#   * chromium
#   * chromium-browser
#   * chrome
#   * google-chrome
#   * safari
#   * w3m
#   * lynx
#
(( ${+BROWSER} )) || export BROWSER=$( command -v firefox || command -v chromium || command -v chromium-browser || command -v chrome || command -v google-chrome || command -v w3m || command -v lynx || "" )
