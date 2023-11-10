DOTPATH := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))

.DEFAULT_GOAL := help

.PHONY: install
install: preinstall ## Install all dotfiles in this repo.
	@bash $(DOTPATH)/scripts/install-brew.sh
	@bash $(DOTPATH)/scripts/install-nvim.sh
	@bash $(DOTPATH)/scripts/install-gitconfig.sh
	@bash $(DOTPATH)/scripts/install-bash.sh
	@bash $(DOTPATH)/scripts/install-zsh.sh
	@bash $(DOTPATH)/scripts/install-tmux.sh
	@bash $(DOTPATH)/scripts/install-wezterm.sh

	@printf 'You can change to Bash or Zsh.\n'
	@printf "If you want to change it, check out the shells available in '/etc/shells'.\n"

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

.PHONY: update
update: ## Update formula and individually installed applications.
	@bash $(DOTPATH)/scripts/update.sh

.PHONY: git
git: ## Setup git config
	@git config --global user.name "Saito Yuki"
	@git config --global user.email "phicyanoc@gmail.com"

.PHONY: skk
skk: ## Setup skk
	@bash $(DOTPATH)/scripts/install-skk.sh

.PHONY: proxy
proxy: ## Setup proxy
	@bash $(DOTPATH)/scripts/setup-proxy.sh

.PHONY: test
test: install clean ## For GitHub Actions (DO NOT RUN LOCALLY)

.PHONY: help
help: ## Self-documented Makefile.
	@printf 'Usage: make [target]\n'
	@grep -E '^[0-9a-zA-Z_-]+[[:blank:]]*:.*?## .*$$' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[1;32m%-15s\033[0m %s\n", $$1, $$2}'
