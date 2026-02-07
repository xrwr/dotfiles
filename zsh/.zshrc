export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.lmstudio/bin"
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:${LD_LIBRARY_PATH}"
export LANG=ja_JP.UTF-8

# zsh history settings
HISTFILE=$HOME/.zsh_history # 履歴を保存するファイル
HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ
setopt inc_append_history   # 実行時に履歴をファイルに追加していく
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(sheldon source)"

# aliases and functions
alias ls="eza -F --icons"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias cat="bat"
alias vim="nvim"
alias grep="rg"
alias du="dust"
if [[ "$(uname)" != "Darwin" ]]; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
    alias open='explorer.exe'
fi

function cdls() {
    \cd $1;
    ls;
}
alias cd=cdls

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

# Alt + d で zoxide のインタラクティブモードを起動
bindkey -s '^[d' 'zi\n'

# Alt + c で履歴検索
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER" --reverse)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^[c' fzf-select-history

# Zellij auto attach
if [[ "$TERM_PROGRAM" == 'vscode' ]]; then
  if [[ -z "$ZELLIJ" ]]; then
    zellij attach --create "$(basename "$(git rev-parse --show-toplevel 2>/dev/null || echo "$PWD")")"
    exit
  fi
else
  if [[ -z "$VSCODE_RESOLVING_ENVIRONMENT" ]]; then
    # export ZELLIJ_AUTO_ATTACH=true
    export ZELLIJ_AUTO_EXIT=true
    eval "$(zellij setup --generate-auto-start zsh)"
  fi
fi
