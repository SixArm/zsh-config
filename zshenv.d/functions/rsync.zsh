# Rsync functions

# rsync-mirror => rsync with settings for typical mirroring.
#
# Example:
#
#     rsync-mirror ~/foo/ ~/bar/
#
# Flags:
#
#  * archive, including hardlinks
#  * update, i.e. only sync when the src file is newer than dst file
#  * omit directories when preserving times (necessary for some file systems)
#  * limit to one file system
#  * compress
#  * verbose
#  * itemize changes
#
rsync-mirror(){
    rsync -aHuOxzvi "$@"
}

# rsync-mirror-exact => rsync-mirror then delete all extraneous dest items.
#
# Example:
#
#     rsync-mirror-exact ~/foo/ ~/bar/
#
# This can be useful for making an exact copy of the source items,
# especially when source items may already exist in the destination.
#
# We use --delete-after, rather than --delete-before or --delete-during,
# because we want the command to be able to copy on top of existing items
# that may link to each other, such as publishing a website with many pages.
#
rsync-mirror-exact(){
    rsync -aHuOxzvi --delete-after "$@"
}

# rsync-mirror-merge => rsync-mirror then delete all source items.
#
# Example:
#
#     rsync-mirror-merge ~/foo/ ~/bar/
#
# This can be useful for cleaning up filesystems and its directories.
#
rsync-mirror-merge(){
    rsync -aHuOxzvi "$@" && rm -rf "$1"
}

# rsync-mirror-progressive => rsync-mirror with a progress bar and partials.
#
# Example:
#
#     rsync-mirror-progressive ~/foo/ ~/bar/
#
# This can be useful for interactive mirroring, when you want to watch
# the progress bar and also want to be able to resume broken transfers.
# Be aware that the partial flags necessitate directory write permissions.
#
rsync-mirror-progressive(){
    rsync -aHuOxzvi --progress --partial --partial-dir=.rsync-partial-dir "$@"
}
