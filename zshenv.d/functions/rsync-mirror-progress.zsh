# rsync-mirror-progress => what rsync-mirror does, 
# plus progress bar and work-in-progress partial files.
#
# Example:
#
#     rsync-mirror-progress ~/foo/ ~/bar/
#
# Settings:
#
#   -a, --archive           archive mode; same as -rlptgoD (no -H)
#   -H, --hard-links        preserve hard links
#   -O, --omit-dir-times    omit directories when preserving times
#   -x, --one-file-system   don't cross filesystem boundaries
#   -z, --compress          compress file data during the transfer
#   -v, --verbose           increase verbosity
#   -i, --itemize-changes   output a change-summary for all updates
#
# This can be useful for interactive mirroring, when you want to watch
# the progress bar and also want to be able to resume broken transfers.
#
# Be aware that the partial flags necessitate directory write permissions.
#
rsync-mirror-progressive(){
    rsync -aHOxzvi --progress --partial --partial-dir=.rsync-partial-dir "$@"
}