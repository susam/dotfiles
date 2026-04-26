lsdots:
	ls -ld .*

push:
	git remote remove cb || :
	git remote remove gh || :
	git remote remove origin || :
	git remote add cb git@codeberg.org:susam/dotfiles.git
	git remote add gh git@github.com:susam/dotfiles.git
	git remote add origin $$(git remote get-url cb) || :
	git push cb main
	git push gh main
