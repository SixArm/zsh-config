# Firefox aliases
#
# Examples:
#
#   * firefox
#   * /opt/firefox/firefox
#   * /Applications/Firefox.app/Contents/MacOS/firefox-bin
#
alias firefox=$( command -v /opt/firefox/firefox || command -v firefox || command -v /Applications/Firefox.app/Contents/MacOS/firefox-bin || "" )
