alias ls="ls -F --color"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias sl="ls"
alias cat="bat"
alias sed="gsed"
alias arm="exec arch -arch arm64e /bin/zsh --login"
alias x64="exec arch -arch x86_64 /bin/zsh --login"

function cdls() {
    \cd $1;
    ls;
}
alias cd=cdls
