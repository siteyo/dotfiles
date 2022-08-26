DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

.DEFAULT_GOAL := help

.PHONY: install
install: brew nvim git bash ## Install all dotfiles in this repo.

.PHONY: reinstall
reinstall: clean install ## Run 'make clean' and 'make install'.

.PHONY: update
update: ## Fetch changes in this repo.
	git pull origin master

.PHONY: clean
clean: ## [TODO] Remove dotfiles.
	@echo 'Remove dotfiles ...'

.PHONY: test
test: install update clean ## For GitHub Actions (DO NOT RUN LOCALLY)

.PHONY: help
help: ## Self-documented Makefile.
	@echo 'Usage: make [target]'
	@grep -E '^[0-9a-zA-Z_-]+[[:blank:]]*:.*?## .*$$' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[1;32m%-15s\033[0m %s\n", $$1, $$2}'


.PHONY: brew
brew: ## Install Homebrew and formula.
	@bash $(DOTPATH)/scripts/install-brew.sh

# .PHONY: vim
# vim: ## Create vimrc symlink to ~ and install plugin.
# 	@bash $(DOTPATH)/scripts/install-vim.sh

.PHONY: nvim
nvim: ## Create init.vim symlink to ~ and install plugin.
	@bash $(DOTPATH)/scripts/install-nvim.sh

.PHONY: git
git: ## Create .gitconfig symlink to ~.
	@bash $(DOTPATH)/scripts/install-gitconfig.sh

.PHONY: bash
bash: ## Create .bashrc symlink to ~.
	@bash $(DOTPATH)/scripts/install-bash.sh

.PHONY: tmux
tmux: ## [TODO] Create .tmux.conf symlink to ~.
	@echo ''
