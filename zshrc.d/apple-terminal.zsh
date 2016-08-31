# Correctly display UTF-8 with combining characters.
# This code seems to come from the default OSX OhMyZsh.
if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
  setopt combiningchars
fi
