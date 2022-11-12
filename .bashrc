# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~ set BASH line editing in vi mode ~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# https://catonmat.net/bash-vi-editing-mode-cheat-sheet
set -o vi

# ~~~~~~~~~~~~~~~
# ~ docker/tcwa ~
# ~~~~~~~~~~~~~~~
export DEVELOPMENT=1

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~ 'history' command output will contain timestamps ~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export HISTTIMEFORMAT="%F %T "

# ~~~~~~~~~~~~~~~~~~~~~~~~
# ~ powerline activation ~
# ~~~~~~~~~~~~~~~~~~~~~~~~
if [ -f `which powerline-daemon` ]
then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bindings/bash/powerline.sh
fi

# ~~~~~~~~~~~~~~
# ~ activate fzf
# ~~~~~~~~~~~~~~
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
if type rg &> /dev/null
then
	export FZF_DEFAULT_COMMAND='rg --files'
	export FZF_DEFAULT_OPTS='-m'
fi
