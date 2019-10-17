# Jumper to do directory jump.
#
# Examples:
#
#   * [jd](https://github.com/khansamad47/jumpdir)
#  
#   * [jump](https://github.com/gsamokovarov/jump)
#
(( ${+JUMPER} )) || export JUMPER=$( command -v jd || command -v jump || "" )
