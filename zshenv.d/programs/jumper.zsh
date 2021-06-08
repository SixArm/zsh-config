# Jumper is the shell program that does a directory jump.
#
# Example choices:
#
#   * [jd](https://github.com/khansamad47/jumpdir)
#   * [jump](https://github.com/gsamokovarov/jump)
#
(( ${+JUMPER} )) || export JUMPER=$( command -v jd || command -v jump || "" )
