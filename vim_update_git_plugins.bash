#!/usr/bin/env bash


ansi_bold="\e[1m"
ansi_normal="\e[0m"

plugins_path="$HOME/.vim/pack/git-plugins/start"


function display_help {
    echo -n "Usage: "
    echo -e "${BASH_SOURCE[0]} [ [-h] | [-A] [-p VIM_GITPLUGINS_PATH] ]"
    echo -e "\t-A\n\t\tdisable [A]NSI codes in output; DEFAULT enabled"
    echo -e "\t-h\n\t\tdisplay [h]elp and exit"
    echo -e "\t-p\n\t\tset VIM_GITPLUGINS_PATH; DEFAULT ${plugins_path}"
}


while getopts ":aAhp:" option; do
    case $option in
        "?")
            >&2 echo -e "Invalid option '-${OPTARG}'\n"
            display_help
            exit 3
            ;;
        ":")
            >&2 echo -e "Missing required argument for '-${OPTARG}'\n"
            display_help
            exit 2
            ;;
        "A")
            ansi_bold=""
            ansi_normal=""
            ;;
        "h")
            display_help
            exit 0
            ;;
        "p") plugins_path="${OPTARG}";;
        *)
            display_help
            exit 1
            ;;
    esac
done


for plugin_dir in "$plugins_path"/*; do
    echo -e "${ansi_bold}[${plugin_dir##*/}]${ansi_normal}"
    echo -e "$(git -C "$plugin_dir" pull)\n"
done
