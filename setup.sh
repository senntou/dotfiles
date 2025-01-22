#!bin/bash

# .configディレクトリが無い場合作成する
if [ ! -d "$HOME/.config" ]; then
  mkdir -p "$HOME/.config"
fi

ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
