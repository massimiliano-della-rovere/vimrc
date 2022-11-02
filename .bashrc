export DEVELOPMENT=1
export HISTTIMEFORMAT="%F %T "

if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bindings/bash/powerline.sh
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
