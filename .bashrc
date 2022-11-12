# ~~~~~~~~~~~~~~~~~~~
# ~ this is for git ~
# ~~~~~~~~~~~~~~~~~~~
export EDITOR=vim

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

# ~~~~~~~~~~~~~~~~~~~~~~~~~
# ~ promptline activation ~~~~~~~~~~~~~~~~~~~~~
# ~ https://github.com/edkolev/promptline.vim ~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# if [ -f ~/.promptline.sh ]
# then
#   . ~/.promptline.sh
# fi

# ~~~~~~~~~~~~~~~
# ~ fzf.devicon ~
# ~~~~~~~~~~~~~~~
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
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
