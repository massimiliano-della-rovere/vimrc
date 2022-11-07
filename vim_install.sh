#!/usr/bin/env bash

github="https://github.com"
pack_dir="$HOME/.vim/pack"
plugin_dir="$pack_dir/git_plugins"

sudo apt-get install --assume-yes \
	vim-common vim-nox \
	vim-gui-common vim-gtk vim-gtk3 \
	vim-runtime vim-scripts \
	vim-doc

mkdir -p "$plugin_dir"

mkdir -p "$HOME/.vim"
git clone "${github}/vim-scripts/xoria256.vim/tree/master/colors" "$HOME/.vim/colors"

mkdir -p "$plugin_dir/start/rafi"
git clone "${github}/rafi/awesome-vim-colorschemes.git" "$plugin_dir/start/rafi/awesome-vim-colorschemes"

mkdir -p "$plugin_dir/start/adelarsq"
git clone "${github}/adelarsq/vim-matchit.git" "$plugin_dir/start/adelarsq/vim-matchit"

mkdir -p "$plugin_dir/start/lifepillar"
git clone "$github/lifepillar/vim-gruvbox8.git" "$plugin_dir/start/lifepillar/vim-gruvbox8"

mkdir -p "$plugin_dir/start/ggreer"
git clone "$github/ggreer/the_silver_searcher.git" "$plugin_dir/start/ggreer/the_silver_searcher"

mkdir -p "$plugin_dir/start/BurntSushi"
git clone "$github/BurntSushi/ripgrep.git" "$plugin_dir/start/BurntSushi/ripgrep"

mkdir -p "$plugin_dir/start/ekalinin"
git clone "$github/ekalinin/Dockerfile.vim.git" "$plugin_dir/start/ekalinin/Dockerfile.vim"

mkdir -p "$plugin_dir/start/junegunn"
git clone "$github/junegunn/fzf.git" "$plugin_dir/start/junegunn/fzf"

mkdir -p "$plugin_dir/start/junegunn"
git clone "$github/junegunn/fzf.vim.git" "$plugin_dir/start/junegunn/fzf.vim"

mkdir -p "$plugin_dir/start/vim-scripts"
git clone "$github/vim-scripts/indentpython.vim.git" "$plugin_dir/start/vim-scripts/indentpython.vim"

mkdir -p "$plugin_dir/start/vim-scripts"
git clone "$github/vim-scripts/taglist.vim.git" "$plugin_dir/start/vim-scripts/taglist.vim"

mkdir -p "$plugin_dir/start/tpope"
git clone "$github/tpope/vim-commentary.git" "$plugin_dir/start/tpope/vim-commentary"

mkdir -p "$plugin_dir/start/tpope"
git clone "$github/tpope/vim-characterize.git" "$plugin_dir/start/tpope/vim-characterize"

mkdir -p "$plugin_dir/start/tpope"
git clone "$github/tpope/vim-dotenv.git" "$plugin_dir/start/tpope/vim-dotenv"

mkdir -p "$plugin_dir/start/tpope"
git clone "$github/tpope/vim-dadbod.git" "$plugin_dir/start/tpope/vim-dadbod"

mkdir -p "$plugin_dir/start/tpope"
git clone "$github/tpope/vim-surround.git" "$plugin_dir/start/tpope/vim-surround"

mkdir -p "$plugin_dir/start/tpope"
git clone "$github/tpope/vim-vinegar.git" "$plugin_dir/start/tpope/vim-vinegar"

sudo apt install --assume-yes build-essential cmake python3-dev mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm
mkdir -p "$plugin_dir/start/ycm-core"
git clone "$github/ycm-core/YouCompleteMe.git" "$plugin_dir/start/ycm-core/YouCompleteMe"
pushd
cd "$plugin_dir/start/ycm-core/YouCompleteMe"
git submodule update --init --recursive
python3 install.py --all
popd

mkdir -p "$plugin_dir/start/dense-analysis"
git clone "$github/dense-analysis/ale.git" "$plugin_dir/start/dense-analysis/ale"

mkdir -p "$plugin_dir/start/preservim"
git clone "$github/preservim/nerdtree.git" "$plugin_dir/start/preservim/nerdtree"

mkdir -p "$plugin_dir/start/Xyuyanp"
git clone "$github/Xuyuanp/nerdtree-git-plugin.git" "$plugin_dir/start/Xuyuanp/nerdtree-git-plugin"

mkdir -p "$plugin_dir/start/ryanoasis"
git clone "$github/ryanoasis/vim-devicons.git" "$plugin_dir/start/ryanoasis/vim-devicons"

mkdir -p "$plugin_dir/start/tiagofumo"
git clone "$github/tiagofumo/vim-nerdtree-syntax-highlight.git" "$plugin_dir/start/tiagofumo/vim-nerdtree-syntax-highlight"

mkdir -p "$plugin_dir/start/Konfekt"
git clone "$github/Konfekt/FastFold.git" "$plugin_dir/start/Konfekt/FastFold"

mkdir -p "$plugin_dir/start/tmhedberg"
git clone "$github/tmhedberg/SimplyFold.git" "$plugin_dir/start/tmhedberg/SimplyFold"

mkdir -p "$plugin_dir/start/valloric"
git clone "$github/valloric/MatchTagAlways.git" "$plugin_dir/start/valloric/MatchTagAlways"

mkdir -p "$plugin_dir/start/mattn"
git clone "$github/mattn/emmet-vim.git" "$plugin_dir/start/mattn/emmet-vim"

mkdir -p "$plugin_dir/start/kshenoy"
git clone "$github/kshenoy/vim-signature.git" "$plugin_dir/start/kshenoy/vim-signature"

mkdir -p "$plugin_dir/start/vim-airline"
git clone "$github/vim-airline/vim-airline.git" "$plugin_dir/start/vim-airline/vim-airline"

mkdir -p "$plugin_dir/start/vim-airline"
git clone "$github/vim-airline/vim-airline-themes.git" "$plugin_dir/start/vim-airline/vim-airline-themes"

mkdir -p "$plugin_dir/start/airblade"
git clone "$github/airblade/vim-gitgutter.git" "$plugin_dir/start/airblade/vim-gitgutter"

mkdir -p "$plugin_dir/start/bling"
git clone "$github/bling/vim-bufferline.git" "$plugin_dir/start/bling/vim-bufferline"

