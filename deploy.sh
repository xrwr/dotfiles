#!/bin/bash
# 配置したい設定ファイル
dotfiles=(.zshrc .latexmkrc .vimrc .gitconfig)

# 設定ファイルのシンボリックリンクを
# ホームディレクトリ直下に作成する
for file in "${dotfiles[@]}"; do
        ln -svf ~/dotfiles/$file ~/$file
done
