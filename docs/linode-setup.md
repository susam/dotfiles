Change Hostname
---------------
Change hostname of the Linode system.

    NAME=foo
    echo "$NAME" > /etc/hostname
    echo 127.0.0.1 "$NAME" >> /etc/hosts
    reboot


Create User
-----------
Create an operator account.

    adduser master --gecos ""
    adduser master sudo

Log in with the new user.


Install Packages
----------------
Install necessary packages.

    sudo apt-get -y install nginx git make tmux tree

Install certbot.

    echo 'deb http://ftp.debian.org/debian jessie-backports main' | sudo tee /etc/apt/sources.list.d/backports.list
    sudo apt-get update
    sudo apt-get install certbot -t jessie-backports


Configure Vim
-------------
Set Vim as the default editor. Enter the following command and select `/usr/bin/vim.basic`.

    sudo update-alternatives --config editor

Configure Vim for all users.

```
sudo tee /etc/vim/vimrc.local <<eof
syntax on
colorscheme murphy
set textwidth=72
set tabstop=4
set shiftwidth=0
set expandtab
set autoindent
set guioptions=i
set number
set hlsearch
set showcmd
set hidden
set ruler
set autochdir
set modeline
autocmd BufNewFile,BufRead *.md,*.txt set filetype=markdown
autocmd BufNewFile,BufRead *.go,Makefile setlocal tabstop=8 noexpandtab
autocmd BufWinEnter * syntax keyword Todo TODO
autocmd BufWinEnter * syntax match Error /\s\+$/
eof
```


Configure tmux
--------------
Configure tmux for all users.

```
sudo tee /etc/tmux.conf <<eof
set -g prefix2 C-j
bind-key C-j send-prefix -2
set -g escape-time 0
set -g default-terminal screen-256color
set -g mode-keys vi
eof
```


Next Steps
----------
Perform Git configuration steps mentioned at
[common-setup.md](common-setup.md) for personal account only.
