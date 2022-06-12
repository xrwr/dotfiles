export PATH="/opt/homebrew/bin:$PATH"
export LANG=ja_JP.UTF-8

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ren/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ren/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/ren/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ren/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
