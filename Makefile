install: vim
	@echo Installing ggrep to ~/bin
	@[ -d ~/bin ] || mkdir ~/bin
	@cp -f ggrep ~/bin
install-system: vim
	@echo Installing ggrep to /usr/local/bin
	@cp -f ggrep /usr/local/bin
vim:
	@if [ -d ~/.vim ]; then \
	  echo 'Default vim keymap for recursive git-grep:'; \
	  sed -rn 's/^nmap (.+) :.+$$/\1/p' git-grep-recursive.vim; \
	  read -p 'Set new keymap or Enter to leave default: ' MAP; \
	  echo Installing git-grep-recursive.vim to ~/.vim/plugin; \
	  [ -z "$$MAP" ] \
	  && cp -f git-grep-recursive.vim ~/.vim/plugin \
	  || sed -r "s/^(nmap ).+ :/\1$$MAP :/" git-grep-recursive.vim \
	     > ~/.vim/plugin/git-grep-recursive.vim; \
	fi
