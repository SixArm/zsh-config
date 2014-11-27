# Rsync functions

# rs => rsync with settings for typical mirroring.
#
#  * archive, including hardlinks
#  * update, i.e. only sync when the src file is newer than dst file
#  * omit directories when preserving times (necessary for some file systems)
#  * limit to one file system
#  * compress
#  * verbose
#  * itemize changes
#
rs(){
    rsync -aHuOxzvi "$@"
}

# rsp => rsync with settings for typical mirroring,
# plus a progress bar and and partial directory.
#
# This is suitable for fast resume of any broken transfers;
# the partial flags need directory write permission.
#
rs-p(){
    rsync -aHuOxzvi --progress --partial --partial-dir=.rsync-partial-dir "$@"
}

# rsrm => rsync with settings for typical mirroring, then rm the src.
#
# This is useful for normalizing our backups and naming conventions:
# we want to keep either the src or the dst depending on which is newer.
#
#    rsrm foo goo
#    #=> rs foo bar && rm foo
#
rs-rm(){
    rsync -aHuOxzvi "$@" && rm -rf "$1"
}
