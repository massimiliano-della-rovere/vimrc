alias vimrc="vim $HOME/.vim/vimrc"

alias fzf="fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'"

alias ls=exa

alias dir="exa --git --icons -al --color auto --color-scale"
alias ls="exa --git"

alias less="/usr/share/vim/vim90/macros/less.sh"

alias d="sudo docker"
alias dps="d ps --format '{{.Names}} @ {{.ID}} / {{.Image}} # {{.Status}} % {{.CreatedAt}}, {{.RunningFor}}'"

alias tcwarc="cat ~/.config/tcwa.json"
