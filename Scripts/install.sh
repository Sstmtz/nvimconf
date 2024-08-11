#!/usr/bin/env bash


# TODO: restore old configs

mv ~/.config/nvim/ ~/.config/nvim.backup
mv ~/.local/share/nvim/ ~/.local/share/nvim.backup
mv ~/.local/state/nvim/ ~/.local/state/nvim.backup 

# TODO: git clone and start nvim 

git clone https://github.com/Sstmtz/nvim ~/.config/nvim && nvim 

