# Rsync aliases

# rs => rsync with settings for typical mirroring 
alias rs='rsync -aHuOxzvi --progress'

# rsp => rsync with progress bar and and partial flags,
# suitable for fast resume of any broken transfers;
# the partial flags need directory write permission.
alias rsp='rsync -aHuOxzvi --progress --partial --partial-dir=.rsync-partial-dir'
