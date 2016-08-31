###
#
# autoload & compinit
#
###

# autoload:
#
#   -U Suppress the usual alias expansion during reading.
#      This is recommended for the use of functions supplied
#      with the zsh distribution.
#
#   -z use zsh native, not ksh emulation, as if the option
#      KSH_AUTOLOAD were unset or were set, respectively.

# compinit, i.e. man zshcompsys:
#
# For security reasons compinit checks if the completion system would
# use files not owned by root or by the current user, or files in
# directories that are world- or group-writable or that are not owned
# by root or by the current user. If such files or directories are
# found, compinit will ask if the completion system should really be
# used.
#
#   -u use all the files, without asking, avoiding these tests
#
#   -i ignore insecure files and directories, silently.
#
#   -C skip the entire security check
#
#   -d dump to cache

# We prefer to skip the entire security check, because our typical
# zsh setups deliberately use non-root users and non-root groups.
# For example, we use an "admin" group and group-writeable paths.
#
# This is different than what typical zsh expects i.e. the paths
# must be owned by root or the user, and must not be group write.
#
# Our opinion is zsh should not try to be responsible for path
# permissions, therefore we use compinit -C to skip checking.

# If you don't want compinit called here, place the line
# skip_global_compinit=1
# in your $ZDOTDIR/.zshenv or $ZDOTDIR/.zprofice

if [[ -z "$skip_global_compinit" ]]; then
   autoload -Uz compinit && compinit -C -d ~/.zcompdump
fi
