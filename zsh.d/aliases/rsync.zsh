# Rsync aliases

# rs = rsync with settings for typical mirroring 
alias rs='rsync --archive --compress --progress --update --verbose'

# rsp => rsync with partial and partial-dir for fast resume of broken transfers (requires directory write permission)
alias rsp='rsync --archive --compress --progress --update --verbose --partial --partial-dir=.rsync-partial-dir'