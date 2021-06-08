# Browser is the shell program that launches a web browser.
#
# Example browsers:
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
# Example locations:
#
#   * /opt/firefox/firefox
#   * /Applications/Firefox.app/Contents/MacOS/firefox-bin
#   * /usr/local/bin/chromium
#   * /Applications/Safari.app/Contents/MacOS/Safari
#
(( ${+BROWSER} )) || export BROWSER=$( command -v /opt/firefox/firefox || command -v /Applications/Firefox.app/Contents/MacOS/firefox-bin || command -v firefox || command -v /usr/local/bin/chromium || command -v chromium || command -v chromium-browser || command -v chrome || command -v google-chrome || command -v /Applications/Safari.app/Contents/MacOS/Safari || command -v w3m || command -v lynx || "" )
