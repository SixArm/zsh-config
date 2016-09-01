##
#
# zlogin
#
# This file is sourced only for login shells.
# It contains commands to execute only in login shells.
#
# It sets the terminal type and runs a series of external commands,
# such as fortune, msgs, from, etc.
#
##

for f in /etc/zlogin.d/**/*.zsh(N); do; [ -r $f ] && source $f; done
