##
#
# zprofile
#
# The zprofile file is sourced only for login shells (i.e. shells
# invoked with "-" as the first character of argv[0], and shells
# invoked with the -l flag.)
#
##

for f in /etc/zprofile.d/**/*.zsh(N); do; [ -r $f ] && source $f; done
