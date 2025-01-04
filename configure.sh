#!/bin/env bash

# set -x

dotfiles_dir=$(pwd)

rm $HOME/.tmux.conf
cp $dotfiles_dir/tmux/.tmux.conf $HOME/.tmux.conf

rm -fr $HOME/.config/nvim
cp -r $dotfiles_dir/nvim $HOME/.config/nvim

rm -fr $HOME/.config/ghostty
cp -r $dotfiles_dir/ghostty $HOME/.config/ghostty

rm -r $HOME/.local/scripts
cp -r $dotfiles_dir/scripts $HOME/.local/scripts

rm -r $HOME/.config/hypr
cp -r $dotfiles_dir/hypr $HOME/.config/hypr

bash_ext="$dotfiles_dir/bash_ext.sh"
if ! grep -Fq $bash_ext $HOME/.bashrc ; then
    echo "bash_ext.sh is not included in .bashrc. adding to .bashrc..."
    echo ". \"$bash_ext\"" >> $HOME/.bashrc
else
    echo "bash_ext.sh is already included in .bashrc. skip..."
fi

echo "Done."
