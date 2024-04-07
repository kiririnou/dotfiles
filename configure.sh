#!/bin/env bash

dotfiles_dir=$(pwd)

unlink $HOME/.tmux.conf
ln -s $dotfiles_dir/tmux/.tmux.conf $HOME/.tmux.conf

unlink $HOME/.config/nvim
ln -s $dotfiles_dir/nvim $HOME/.config/nvim

echo 'alias vim="nvim"' >> $HOME/.bashrc
echo 'alias ll="ls -l"' >> $HOME/.bashrc
echo 'alias la="ls -la"' >> $HOME/.bashrc
echo 'alias l="ls"' >> $HOME/.bashrc

unlink $HOME/.local/scripts
ln -s $dotfiles_dir/scripts $HOME/.local/scripts
echo bind \'\"\\C-f\":\"$HOME/.local/scripts/tmux-sessionizer\\n\"\' >> $HOME/.bashrc
