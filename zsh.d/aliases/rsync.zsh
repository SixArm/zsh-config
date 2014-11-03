# Rsync aliases

# rs => rsync with settings for typical mirroring 
alias rs='rsync -aHuOxzvi --progress'

# rsp => rsync with partial and partial-dir,
# for fast resume of any broken transfers;
# this needs directory write permission.
alias rsp='rsync --archive --compress --progress --update --verbose --partial --partial-dir=.rsync-partial-dir'

