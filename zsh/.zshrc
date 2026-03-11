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
alias zj="zellij"
alias zja="zellij attach"
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

# zellij completion
_zellij() {
  local context state
  typeset -A opt_args

  _arguments -C \
    '1:subcommand:(attach a list-sessions ls kill-session k)' \
    '2:session:_zellij_session_names'

  return 0
}

_zellij_session_names() {
  local -a sessions
  sessions=(${(f)"$(zellij list-sessions --short 2>/dev/null)"})
  _describe 'zellij sessions' sessions
}

compdef _zellij zellij

fpath=(~/.zfunc $fpath)
autoload -Uz compinit
compinit