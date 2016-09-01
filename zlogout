##
#
# zlogout
#
# This is the logout file for zsh. 
#
##

for f in /etc/zlogout.d/**/*.zsh(N); do; [ -r $f ] && source $f; done
