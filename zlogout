# /etc/zsh/zlogout: system-wide .zlogout file for zsh(1).

for f in /etc/zlogout.d/**/*.zsh(N); do; [ -r $f ] && source $f; done