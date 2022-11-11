#!/usr/bin/env bash

# grep -P '^~ https://github.com/' ~/.vim/vimrc | sed 's/["~ ]//g'
#

github="https://github.com"

pack_dir="$HOME/.vim/pack"
plugin_dir="$pack_dir/git-plugins"


sudo apt-get install --assume-yes \
	vim-common vim-nox \
	vim-gui-common vim-gtk vim-gtk3 \
	vim-runtime vim-scripts \
	vim-doc

mkdir -p "${plugin_dir}"
cd "${plugin_dir}"

git clone https://github.com/lifepillar/vim-gruvbox8

git clone https://github.com/rafi/awesome-vim-colorschemes

git clone https://github.com/ryanoasis/vim-devicons

git clone https://github.com/vim-airline/vim-airline

git clone https://github.com/vim-airline/vim-airline-themes

git clone https://github.com/tpope/vim-dotenv

git clone https://github.com/junegunn/vim-peekaboo

git clone https://github.com/mg979/vim-visual-multi

git clone https://github.com/dhruvasagar/vim-open-url

git clone https://github.com/tpope/vim-repeat

git clone https://github.com/edkolev/promptline.vim

git clone https://github.com/christoomey/vim-tmux-navigator

git clone https://github.com/edkolev/tmuxline.vim

git clone https://github.com/Konfekt/FastFold

git clone https://github.com/tmhedberg/SimpylFold

git clone https://github.com/kshenoy/vim-signature

git clone https://github.com/andymass/vim-matchup

git clone https://github.com/valloric/MatchTagAlways

git clone https://github.com/wellle/targets.vim

git clone https://github.com/machakann/vim-sandwich

git clone https://github.com/roman/golden-ratio

git clone https://github.com/brooth/far.vim

git clone https://github.com/ggreer/the_silver_searcher

git clone https://github.com/BurntSushi/ripgrep

git clone https://github.com/junegunn/fzf

git clone https://github.com/junegunn/fzf.vim

git clone https://github.com/tpope/vim-vinegar

git clone https://github.com/preservim/nerdtree

git clone https://github.com/Xuyuanp/nerdtree-git-plugin

git clone https://github.com/tiagofumo/vim-nerdtree-syntax-highlight

git clone https://github.com/tpope/vim-characterize

git clone https://github.com/ludovicchabant/vim-gutentags

git clone https://github.com/vim-scripts/taglist.vim

git clone https://github.com/tpope/vim-endwise

git clone https://github.com/tpope/vim-commentary

git clone https://github.com/dense-analysis/ale

git clone https://github.com/ycm-core/YouCompleteMe
sudo apt install --assume-yes build-essential cmake python3-dev mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm universal-ctags
cd YouCompleteMe
git submodule update --init --recursive
python3 install.py --all
cd ..

git clone https://github.com/othree/csscomplete.vim

git clone https://github.com/hail2u/vim-css3-syntax

git clone https://github.com/ekalinin/Dockerfile.vim

git clone https://github.com/vim-scripts/indentpython.vim

git clone https://github.com/jmcantrell/vim-virtualenv

git clone https://github.com/mattn/emmet-vim

git clone https://github.com/tpope/vim-dadbod

git clone https://github.com/lifepillar/pgsql.vim

git clone https://github.com/airblade/vim-gitgutter

git clone https://github.com/tpope/vim-fugitive

git clone https://github.com/junegunn/gv.vim

