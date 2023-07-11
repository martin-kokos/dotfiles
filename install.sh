#!/bin/sh
ln -s ~/repos/dotfiles/nvim/custom ~/.config/nvim/lua/custom
ln -s ~/repos/dotfiles/zsh ~/.zsh
ln -s ~/repos/dotfiles/tmux/.tmux ~/.tmux
ln -s ~/repos/dotfiles/tmux/.tmux.conf ~/.tmux.conf
mkdir ~/git/ && ln -s ~/repos/dotfiles/.gitignore ~/git/ignore
