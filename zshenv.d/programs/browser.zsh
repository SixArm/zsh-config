# Example choices for browser:
#
#   * chromium
#   * chromium-browser
#   * chrome
#   * google-chrome
#   * w3m
#   * lynx

(( ${+BROWSER} )) || export BROWSER=$( command -v chromium || command -v chromium-browser || command -v chrome || command -v google-chrome || command -v w3m || command -v lynx || "" )
