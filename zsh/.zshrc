export PATH="/Users/ren/.local/bin:$PATH"
export PATH="/usr/local/cuda/bin:$PATH"
export PATH="$PATH:/home/ren/.lmstudio/bin"
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
alias pbcopy='xsel --clipboard --input'

function cdls() {
    \cd $1;
    ls;
}
alias cd=cdls

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)

# Ctrl+d で zoxide のインタラクティブモードを起動
bindkey -s '^[d' 'zi\n'

# Ctrl+f で履歴検索
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER" --reverse)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^[f' fzf-select-history
