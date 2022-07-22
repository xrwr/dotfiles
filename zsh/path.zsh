export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Applications/Julia-1.8.app/Contents/Resources/julia/bin:$PATH"
export LANG=ja_JP.UTF-8

# --- pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# ---
