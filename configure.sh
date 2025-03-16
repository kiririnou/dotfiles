#!/bin/env bash

# set -x

dotfiles_dir=$(pwd)
backup_prefix="$dotfiles_dir/backup"
datetime=$(date '+%Y%m%d-%H_%M_%S')
config_list=("nvim" "ghostty" "scripts" "hypr" "tmux")
force_install=0

install_path() {
    case "$1" in
        "tmux")
            echo "$HOME/.tmux.conf"
            ;;
        "scripts")
            echo "$HOME/.local/scripts"
            ;;
        *)
            echo "$HOME/.config/$1"
            ;;
    esac
}

create_backup() {
    backup_path="$backup_prefix/backup_$datetime"
    mkdir -p $backup_path

    for config in "${config_list[@]}"; do
        cp -r $(install_path $config) $backup_path/$config.bak 
    done

    echo "Created backup in $backup_path"
}

compare_configs() {
    local status=0

    for config in "${config_list[@]}"; do
        diff -ur $(install_path $config) $dotfiles_dir/$config
        status="$?"

        if [ "$status" -ne 0 ]; then
            echo "Local configs were modified."
            echo "Please check if no important modifications are lost."
            [ "$force_install" -eq 0 ] && exit $status
        fi
    done
}

# check if request config exists in $dotfiles_dir
check_config_existence() {
    local path="$dotfiles_dir/$1"
    if [ -d "$path" ]  || [ -e "$path" ]; then
        echo ">$path config exists. all good"
        return 1
    else
        echo ">$path doesn't exists"
        return 0
    fi
}

# argument for specific config
install_config() {
    check_config_existence $1
    file_state=$?

    if [ "$file_state" -ne 0 ]; then
        echo ">instaling config for $1"
        rm -fr $(install_path $1)
        cp -r $dotfiles_dir/$1 $(install_path $1)
        echo ">$1 config installed"
    fi
}

install_bash_ext() {
    bash_ext="$dotfiles_dir/bash_ext.sh"
    if ! grep -Fq $bash_ext $HOME/.bashrc ; then
        echo "bash_ext.sh is not included in .bashrc. adding to .bashrc..."
        echo ". \"$bash_ext\"" >> $HOME/.bashrc
    else
        echo "bash_ext.sh is already included in .bashrc. skip..."
    fi
}

parse_opts() {
    while getopts "fc" options; do
        case "${options}" in
            f)
                force_install=1
                echo "Force install is enabled. Ignoring local modifications..."
                ;;
            c)
                compare_configs
                exit 0
                ;;
            :)
                echo "Missing arguments"
                exit 1
                ;;
            *)
                echo "Unknown argument"
                exit 1
                ;;
        esac
    done
}

run() {
    parse_opts "$@"
    # shift arguments to skip what processed by getopts
    shift $((OPTIND - 1))

    create_backup
    compare_configs

    if [ "$#" -gt 0 ]; then
        unset config_list
        IFS=" " read -ra config_list <<< "$@"
    fi
    
    for config in "${config_list[@]}"; do
        install_config $config
    done

    install_bash_ext
}

run "$@"
echo "Done."
