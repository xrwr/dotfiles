# 各種設定ファイルの読み込み
SCRIPT_DIR=$HOME/dotfiles
source $SCRIPT_DIR/zsh/path.zsh
source $SCRIPT_DIR/zsh/config.zsh
source $SCRIPT_DIR/zsh/alias.zsh
source $SCRIPT_DIR/zsh/fzf.zsh

eval "$(starship init zsh)"
eval "$(sheldon source)"
