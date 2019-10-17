# Alias for Chrome browser command
#
# Examples:
#
#   * chromium
#   * chromium-browser
#   * chrome
#   * google-chrome
#   * /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome
#
alias chrome=$( command -v chromium || command -v chromium-browser || command -v chrome || command -v google-chrome || command -v '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome ' || "" )
