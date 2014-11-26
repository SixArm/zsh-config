# HASH_CMDS: Remember the location of each command the first time it runs.
# Subsequent invocations of the same command will use the saved location,
# thus avoiding a path search, thus making it faster to start a command.
setopt HASH_CMDS

# Allow comments even in interactive shells.
setopt INTERACTIVE_COMMENTS

# Enable output output flow control via start/stop characters,
# usually assigned to ^S/^Q, in the shell's editor.
setopt FLOW_CONTROL
