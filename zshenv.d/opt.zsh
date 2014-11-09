# No beep ever
unsetopt BEEP

# AUTO_CD: If a command is issued that can't be run as a normal command,
# and the command is the name of a directory, then cd to that directory.
# Example: when we enter `/foo` then zsh actually does a `cd /foo`
setopt AUTO_CD

setopt autocd beep extendedglob nomatch notify
setopt AUTO_CD
