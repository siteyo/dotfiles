DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

.DEFAULT_GOAL := help

.PHONY: install
install: preinstall ## Install all dotfiles in this repo.
	@bash $(DOTPATH)/scripts/install-brew.sh
	@bash $(DOTPATH)/scripts/install-vim.sh
	@bash $(DOTPATH)/scripts/install-nvim.sh
	@bash $(DOTPATH)/scripts/install-git.sh
	@bash $(DOTPATH)/scripts/install-bash.sh
	@bash $(DOTPATH)/scripts/install-zsh.sh
	@bash $(DOTPATH)/scripts/install-tmux.sh
	@bash $(DOTPATH)/scripts/install-wezterm.sh

	@echo "You can change to Bash or Zsh."
	@echo "If you want to change it, check out the shells available in '/etc/shells'."

.PHONY: preinstall
preinstall: ## Setup symbolic link to ~/.config.
	@bash $(DOTPATH)/scripts/install-config.sh

.PHONY: reinstall
reinstall: uninstall install ## Run 'make clean' and 'make install'.

.PHONY: uninstall
uninstall: ## Uninstall all dotfiles.
	@bash $(DOTPATH)/scripts/uninstall.sh

.PHONY: clean
clean: uninstall ## Remove dotfiles data(~/.local, ~/.cache, and so on).
	@bash $(DOTPATH)/scripts/clean.sh

.PHONY: test
test: install clean ## For GitHub Actions (DO NOT RUN LOCALLY)

.PHONY: help
help: ## Self-documented Makefile.
	@echo 'Usage: make [target]'
	@grep -E '^[0-9a-zA-Z_-]+[[:blank:]]*:.*?## .*$$' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[1;32m%-15s\033[0m %s\n", $$1, $$2}'
