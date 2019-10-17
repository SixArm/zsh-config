# now: print the current time, using UTC time zone, and ISO format.
#
# Example:
#
#     $ now
#     2019-10-17T00:22:47.765401000+00:00
#
# ## macOS issue
#
# On vanilla macOS systems, the command `date` does not provide the 
# format character `N`, so will output the letter `N`.
#
# One way to get nanosecond formatting on macOS is to install the GNU 
# command `date`, such as via the tool `brew`, then use the path:
#
#     $ brew install coreutils
#
# The tool `brew` will install the command `gdate`, to protect you
# from accidentally shadowing the existing macOS command `date`. 
#
# To prefer the GNU commands with their normal names, you can add 
# a "gnubin" directory to your PATH from your bashrc like:
#
#     PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
#
# The alias below will look for the brew directory and GNU command,
# and will also look for the brew install of `gdate`.
#
alias now="$( command -v /usr/local/opt/coreutils/libexec/gnubin/date || command -v gdate || command -v date ) -u \"+%Y-%m-%dT%H:%M:%S.%N+00:00\""
