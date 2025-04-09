export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/ren/.local/bin:$PATH"
export PATH="/Applications/Julia-1.8.app/Contents/Resources/julia/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export LANG=ja_JP.UTF-8

# --- pyenv settings
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# ---


# --- nvm settings
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
# ---
