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
