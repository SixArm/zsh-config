# Firefox aliases
#
# Examples:
#
#   * /opt/firefox/firefox
#   * firefox
#   * /Applications/Firefox.app/Contents/MacOS/firefox-bin
#
alias firefox=$( command -v /opt/firefox/firefox || command -v /opt/firefox/firefox || command -v /Applications/Firefox.app/Contents/MacOS/firefox-bin || "" )
