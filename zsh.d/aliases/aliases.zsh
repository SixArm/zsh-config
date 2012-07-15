# Aliases for zsh

# d = directory jump
[ -d /d ] && alias d="cd /d/; cd "

# e => edit
alias e='emacs -nw'
# bash:
#   # e = edit with emacs || vi.
#   hash emacs 2>&- && alias e='emacs -nw' || alias e='vi'

# ee => emacsclient or email
alias ee='emacsclient -c -t -a emacs -nw'

# f => find in files
alias f='ack-grep'

# g => git
alias g='git'

# l => list files
alias l='ls -1AF'

# m => most (or more)
alias m='most'
# bash:
#   # m = most || more
#   hash most 2>&- && alias m='most' || alias m='more'

# shell = print the current shell, e.g. bash, csh, zsh
alias shell='ps -p $$ -o comm='

