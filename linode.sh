set -e -x

# Check prerequisites.
[ -z "$hostname" ] && echo "error: hostname not set" >&2 && exit 1
[ -z "$username" ] && echo "error: username not set" >&2 && exit 1
[ -z "$userpass" ] && echo "error: userpass not set" >&2 && exit 1
[ ! -r /tmp/keys.txt ] && echo "error: keys missing" >&2 && exit 1

# Add user.
adduser "$username" --gecos '' --disabled-password
echo "$username:$userpass" | chpasswd
adduser "$username" sudo

# echo "$username ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers.d/nopasswd

# Copy SSH keys.
umask 077
mkdir -p /home/$username/.ssh
cat /tmp/keys.txt >> /home/$username/.ssh/authorized_keys
chown -R $username:$username /home/$username/.ssh
umask 022

# Disable root login.
passwd -d root
passwd -l root

# Disable SSH root login and SSH password login.
cp /etc/ssh/sshd_config /etc/ssh/original_sshd_config
sed -i 's/^PermitRootLogin/#PermitRootLogin/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication/#PasswordAuthentication/' /etc/ssh/sshd_config
echo 'PermitRootLogin no' >> /etc/ssh/sshd_config
echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config
systemctl restart ssh

# Install minimal set of tools.
apt-get update
apt-get -y install git make tmux tree emacs-nox

# Set timezone.
rm -f /etc/localtime
echo Asia/Kolkata > /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

# Set hostname.
echo "$hostname" > /etc/hostname
echo 127.0.0.1 "$hostname" >> /etc/hosts

# Configure Git.
git config --system user.name "Susam Pal"
git config --system user.email "susam@susam.in"

# Set default editor.
update-alternatives --set editor /usr/bin/vim.basic

# Configure Vim.
cat > /etc/vim/vimrc.local <<eof
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
set nojoinspaces
set modeline
set wildmenu
set listchars=eol:$,tab:>-,nbsp:~,trail:~
autocmd BufNewFile,BufRead *.md,*.txt set filetype=markdown
autocmd BufNewFile,BufRead *.html,*.css,*.js,*.json,*.yml,*.yaml set tabstop=2
autocmd BufNewFile,BufRead *.go,Makefile setlocal tabstop=8 noexpandtab
autocmd BufWinEnter * syntax keyword Todo TODO
autocmd BufWinEnter * syntax match Error /\s\+$/
eof

# Configure Emacs.
cat > /etc/emacs/site-start.d/90emacs.el <<EOF
(menu-bar-mode 0)
(column-number-mode)
(ido-mode 1)
(ido-everywhere)
(setq ido-enable-flex-matching t)
(setq sentence-end-double-space nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq js-indent-level 2)
(setq css-indent-offset 2)
(setq create-lockfiles nil)
(make-directory "~/.emacs.d/backup" t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/backup/" t)))
(setq backup-directory-alist '(("." . "~/.emacs.d/backup/")))
(setq apropos-sort-by-scores t)
(load-theme 'wombat)
(set-face-background 'default "#111")
(set-face-background 'cursor "#c96")
(set-face-background 'isearch "#c60")
(set-face-foreground 'isearch "#eee")
(set-face-background 'lazy-highlight "#960")
(set-face-foreground 'font-lock-comment-face "#fc0")
(setq show-paren-delay 0)
(show-paren-mode)
EOF

# Configure tmux.
cat > /etc/tmux.conf <<eof
set -g prefix C-j
bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
bind c new-window -c "#{pane_current_path}"
set -g default-terminal screen-256color
eof

# Reboot.
reboot
