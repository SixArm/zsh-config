# Pager is the shell program that prints text pages such as a text file.
#
# Example choices:
#
#   * bat (an improved `cat` written in Rust)
#   * most (an improved `more`)
#   * less (an improved `more`)
#   * more (the most widespread interactive pager on this list)
#   * cat (the simplest on this list)
#
(( ${+PAGER} )) || export PAGER=$( command -v bat || command -v most || command -v less || command -v cat || "" )
