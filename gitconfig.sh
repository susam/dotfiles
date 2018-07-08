git config --global core.editor vim
git config --global user.useConfigOnly true

FORMAT="%C(auto)%h %C(magenta)%ad %C(cyan)%an%C(auto)%d %s"
PRETTY="--pretty=format:'$FORMAT' --date=short"
git config --global alias.lga "log --graph --all $PRETTY"
git config --global alias.lg "log --graph $PRETTY"
git config --global alias.la "log --all $PRETTY"
git config --global alias.ll "log $PRETTY"
git config --global alias.lf "log --pretty=fuller --stat"
git config --global alias.ls "log --graph --all $PRETTY --simplify-by-decoration"

FORMAT="%C(auto)%h %C(magenta)%ad/%cd %C(cyan)%an/%cn%C(auto)%d %s"
PRETTY="--pretty=format:'$FORMAT' --date=short"
git config --global alias.lc "log $PRETTY"

git config --global alias.di "diff"
git config --global alias.dc "diff --cached"
git config --global alias.diffc "diff --cached"

git config --global alias.br "branch -vv"
git config --global alias.brr "branch -vva"

git config --global alias.co "checkout"
git config --global alias.cob "checkout -b"

git config --global alias.ci "commit"
git config --global alias.ca "commit --amend"

git config --global alias.st "status"
