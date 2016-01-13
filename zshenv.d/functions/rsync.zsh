# Rsync functions

# rsync-mirror => rsync with settings for typical mirroring.
#
# Example:
#
#     rsync-mirror ~/foo/ ~/bar/
#
# Options:
#
#   -a, --archive           archive mode; same as -rlptgoD (no -H)
#   -H, --hard-links        preserve hard links
#   -O, --omit-dir-times    omit directories when preserving times
#   -x, --one-file-system   don't cross filesystem boundaries
#   -z, --compress          compress file data during the transfer
#   -v, --verbose           increase verbosity
#   -i, --itemize-changes   output a change-summary for all updates
#
rsync-mirror(){
    rsync -aHOxzvi "$@"
}

# rsync-mirror-update => rsync-mirror plus update.
#
# Example:
#
#     rsync-mirror ~/foo/ ~/bar/
#
# Options:
#
#   -a, --archive           archive mode; same as -rlptgoD (no -H)
#   -H, --hard-links        preserve hard links
#   -O, --omit-dir-times    omit directories when preserving times
#   -x, --one-file-system   don't cross filesystem boundaries
#   -z, --compress          compress file data during the transfer
#   -v, --verbose           increase verbosity
#   -i, --itemize-changes   output a change-summary for all updates
#   -u, --update            skip files that are newer on the receiver
#
rsync-mirror-update(){
    rsync -aHOxzviu "$@"
}

# rsync-mirror-exact => rsync-mirror then delete all extraneous dest items.
#
# Example:
#
#     rsync-mirror-exact ~/foo/ ~/bar/
#
# We use --delete-after, rather than --delete-before or --delete-during,
# because we want the command to be able to copy on top of existing items
# that may link to each other, such as a website that has many pages.
#
rsync-mirror-exact(){
    rsync -aHOxzvi --delete-after "$@"
}

# rsync-mirror-merge => rsync-mirror-update then delete all source items.
#
# Example:
#
#     rsync-mirror-merge ~/foo/ ~/bar/
#
# This can be useful for cleaning up filesystems and its directories.
#
rsync-mirror-merge(){
    rsync -aHOxzviu "$@" && rm -rf "$1"
}

# rsync-mirror-progressive => rsync-mirror-update plus progress bar and partials.
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
    rsync -aHOxzvi --progress --partial --partial-dir=.rsync-partial-dir "$@"
}
