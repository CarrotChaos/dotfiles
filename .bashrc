# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
source ~/scripts/pass-completion.bash

set -o vi
bind -m vi-insert '"jj": vi-movement-mode'
bind 'set show-mode-in-prompt on'
bind 'set vi-cmd-mode-string "\1\e[2 q\2"'
bind 'set vi-ins-mode-string "\1\e[6 q\2"'
bind -m vi-insert '"\C-l": clear-screen'
bind -m vi '"\C-l": clear-screen'

# Aliases
alias ls='ls --color=auto'
alias sudo='doas'
alias sudoedit='doasedit'
alias pass='~/scripts/pass'
alias start-vm='~/scripts/start-vm.sh'
alias stop-vm='~/scripts/stop-vm.sh'

# Starship-ish Bash prompt
PS1='\[\e[1;36m\]\w ❯\[\e[0m\] '

# Add a blank line before each new prompt
PROMPT_COMMAND='printf "\n"'
