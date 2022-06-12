# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# 各種設定ファイルの読み込み
SCRIPT_DIR=$HOME/dotfiles
source /opt/homebrew/opt/zinit/zinit.zsh
source $SCRIPT_DIR/zsh/path.zsh
source $SCRIPT_DIR/zsh/plugins.zsh
source $SCRIPT_DIR/zsh/config.zsh
source $SCRIPT_DIR/zsh/alias.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $SCRIPT_DIR/zsh/p10k.zsh ]] || source $SCRIPT_DIR/zsh/p10k.zsh
