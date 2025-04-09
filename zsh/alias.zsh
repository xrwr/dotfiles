alias ls="eza -F --icons"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias sl="ls"
alias cat="bat"
alias sed="gsed"
alias vim="nvim"

function cdls() {
    \cd $1;
    ls;
}
alias cd=cdls
