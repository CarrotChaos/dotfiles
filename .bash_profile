# /etc/skel/.bash_profile
export EDITOR=nvim
export RANGER_LOAD_DEFAULT_RC=false
export PASS_KEYID=user@user.com
export PASS_LENGTH=25
export PASS_DIR=~/.password-store

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi
