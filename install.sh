#!/usr/bin/env bash
set -euo pipefail

# sudo 切替
if [ "${EUID:-$(id -u)}" -ne 0 ]; then SUDO=sudo; else SUDO=; fi

$SUDO apt-get update

# timezone
export DEBIAN_FRONTEND=noninteractive
export TZ=Asia/Tokyo
$SUDO ln -fs /usr/share/zoneinfo/$TZ /etc/localtime
$SUDO apt-get install -y tzdata >/dev/null 2>&1 || true
$SUDO apt-get install -y git curl zsh xsel neovim wget pkg-config libssl-dev build-essential stow unzip

# rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# rust tools
for p in bat eza ripgrep zoxide du-dust starship sheldon git-delta zellij cargo-update; do
    cargo install --locked $p
done

# fzf
if [ -d "$HOME/.fzf/.git" ]; then
    git -C "$HOME/.fzf" pull --ff-only
else
    git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
fi
~/.fzf/install --all

# uv
curl -LsSf https://astral.sh/uv/install.sh | sh
