#!/usr/bin/env bash

sudo apt-get install --assume-yes \
	vim-common vim-nox \
	vim-gui-common vim-gtk vim-gtk3 \
	vim-runtime vim-scripts \
	vim-doc

# grep -P '^~ https://github.com/' ~/.vim/vimrc | sed 's/["~ ]//g'

vim_dir="${HOME}/.vim"
colors_dir="${vim_dir}/colors"
pack_dir="${vim_dir}/pack"
plugins_dir="${pack_dir}/git-plugins/start"

mkdir -p "${colors_dir}"
cd "${colors_dir}"

git clone https://github.com/vim-scripts/xoria256.vim xoria256
ln -s xoria256/colors/xoria256.vim xoria256.vim

git clone https://github.com/lifepillar/vim-gruvbox8

git clone https://github.com/rafi/awesome-vim-colorschemes

mkdir -p "${plugins_dir}"
cd "${plugins_dir}"

git clone https://github.com/leafOfTree/vim-project

git clone https://github.com/machakann/vim-highlightedyank

git clone https://github.com/simnalamburt/vim-mundo

git clone https://github.com/frazrepo/vim-rainbow

git clone https://github.com/liuchengxu/vim-which-key

git clone https://github.com/ryanoasis/vim-devicons

git clone https://github.com/vim-airline/vim-airline

git clone https://github.com/vim-airline/vim-airline-themes

git clone https://github.com/tpope/vim-dotenv

git clone https://github.com/tpope/vim-unimpaired

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

sudo apt install --assume-yes silversearcher-ag
git clone https://github.com/ggreer/the_silver_searcher

sudo apt install --assume-yes ripgrep
git clone https://github.com/BurntSushi/ripgrep

git clone https://github.com/junegunn/fzf

sudo apt install --assume-yes cargo
cargo install devicon-lookup --force
[ -n "`grep 'PATH="$HOME/.cargo/bin:$PATH"' $HOME/.profile`" ] && cat << EOS >> $HOME/.profile
if [ -d "$HOME/.cargo/bin" ] ; then
    PATH="$HOME/.cargo/bin:$PATH"
fi
EOS
git clone https://github.com/coreyja/fzf.devicon.vim

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

# sudo apt install --assume-yes build-essential cmake python3-dev mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm universal-ctags
# git clone https://github.com/ycm-core/YouCompleteMe
# cd YouCompleteMe
# git submodule update --init --recursive
# python3 install.py --all
# cd ..

# git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1
# https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim#install-extensions-for-programming-languages-you-use-daily
# https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim#add-some-configuration

git clone https://github.com/sheerun/vim-polyglot

git clone https://github.com/othree/csscomplete.vim

git clone https://github.com/hail2u/vim-css3-syntax

git clone https://github.com/preservim/vim-markdown

git clone https://github.com/ekalinin/Dockerfile.vim

git clone https://github.com/vim-scripts/indentpython.vim

git clone https://github.com/markonm/traces.vim

git clone https://github.com/jmcantrell/vim-virtualenv

git clone https://github.com/mattn/emmet-vim

git clone https://github.com/tpope/vim-dadbod

git clone https://github.com/lifepillar/pgsql.vim

git clone https://github.com/airblade/vim-gitgutter

git clone https://github.com/tpope/vim-fugitive

git clone https://github.com/junegunn/gv.vim

git clone https://github.com/puremourning/vimspector

git clone https://github.com/kana/vim-textobj-user

git clone https://github.com/kana/vim-textobj-entire

for plugin_dir in *; do 
  cd $plugin_dir
  echo $plugin_dir
  git config pull.rebase false
  cd ..
done
