##
# macOS path_helper utility
#
# The path_helper aims to simplify path management.
#
# The path_helper is located in /usr/libexec. 
#
# The path_helper reads the contents of the files in the 
# directories `/etc/paths.d` and `/etc/manpaths.d` and appends
# their contents to the PATH and MANPATH environment variables.
# Files in these directories contain one path element per line.
#
# See http://www.softec.lu/site/DevelopersCorner/MasteringThePathHelper
##

if [ -x /usr/libexec/path_helper ]; then
  eval `/usr/libexec/path_helper -s`
fi
