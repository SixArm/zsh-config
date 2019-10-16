# rsync-mirror => rsync with settings for typical mirroring.
#
# Example:
#
#     rsync-mirror ~/foo/ ~/bar/
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
rsync-mirror(){
    rsync -aHOxzvi "$@"
}
