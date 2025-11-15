#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
RANGER_LOAD_DEFAULT_RC=false
export EDITOR=nvim
alias suspend="loginctl suspend"
eval "$(starship init bash)"
