git config --global core.editor vim
git config --global user.useConfigOnly true

git config --global pretty.simple "%C(auto)%h %C(magenta)%ad %C(cyan)%an%C(auto)%d %s"
git config --global pretty.detail "%C(auto)%h %C(magenta)%ad %C(cyan)%an <%ae> / %C(magenta)%cd %C(cyan)%cn <%ce>%C(auto)%d %s"

git config --global alias.lga "log --pretty=simple --date=short --graph --all"
git config --global alias.lg  "log --pretty=simple --date=short --graph"
git config --global alias.la  "log --pretty=simple --date=short --all"
git config --global alias.ll  "log --pretty=simple --date=short --pretty=simple"
git config --global alias.ld  "log --pretty=detail --date=short"
git config --global alias.ls  "log --pretty=simple --date=short --graph --all --simplify-by-decoration"
git config --global alias.lf  "log --pretty=fuller --stat"

git config --global alias.di "diff"
git config --global alias.dc "diff --cached"
git config --global alias.diffc "diff --cached"

git config --global alias.br "branch -vv"
git config --global alias.brr "branch -vva"
git config --global alias.brd "branch -d"
git config --global alias.brdf "branch -D"
git config --global alias.brdo "!git branch -d \"\$1\" && git push -d origin"

git config --global alias.co "checkout"
git config --global alias.cob "checkout -b"

git config --global alias.ci "commit"
git config --global alias.ca "commit --amend"
git config --global alias.car "commit --amend --reset-author"

git config --global alias.st "status"
