# File managed by SaltStack
#
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# one command per line
shopt -s cmdhist
# Store history immediately
PROMPT_COMMAND='history -a'

# Record timestamps
HISTTIMEFORMAT='%F %T '
