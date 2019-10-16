# Set options - customize as you like
#
#  * extendedglob: Treat the ‘#’, ‘~’ and ‘^’ characters as part of 
#    patterns for filename generation, etc. (An initial unquoted ‘~’
#    always produces named directory expansion.)
#
#  * nomatch: If a pattern for filename generation has no matches, print
#    an error, instead of leaving it unchanged in the argument list. This
#    also applies to file expansion of an initial ‘~’ or ‘=’.
# 
#  * notify: Report the status of background jobs immediately, rather than
#    waiting until just before printing a prompt.

setopt extendedglob nomatch notify

