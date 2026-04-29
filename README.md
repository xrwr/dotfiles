# 🧩 dotfiles

## Setup

```bash
git clone https://github.com/xrwr/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
stow */
```

## Local Git config

`~/.gitconfig.local` は Git 管理せず、環境ごとの user 情報を書く。

```gitconfig
[user]
    name = <your name>
    email = <your email>
```
