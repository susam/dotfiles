set -e -x

[ -z "$hostname" ] && echo "error: hostname not set" >&2 && exit 1
[ -z "$userpass" ] && echo "error: userpass not set" >&2 && exit 1

# Add user.
adduser susam --gecos "Susam Pal,,," --disabled-password
echo "susam:$userpass" | chpasswd
adduser susam sudo
echo "susam ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers.d/nopasswd

# Install minimal set of tools.
apt-get update
apt-get -y install git make tmux tree

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

# Configure tmux.
cat > /etc/tmux.conf <<eof
set -g prefix2 C-j
bind-key C-j send-prefix -2
bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
bind c new-window -c "#{pane_current_path}"
set -g escape-time 0
set -g default-terminal screen-256color
set -g mode-keys vi
eof

# Reboot.
reboot
