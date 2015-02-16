# tmux terminal multiplexer

# Create a tmux new session using the current directory and using its name.
alias tmux-new-session-pwd='tmux new -s $(basename $(pwd))'

# Attach to an existing sesion, which is handy because this does tab completion.
#
#   * If used outside tmux, then create a new client in the current terminal.
#   * If used inside tmux, switch the current client.
#   * If -d is specified, then detach any other clients attached to the session.
#
alias tmux-a='tmux attach -d -t'
