cd "$(dirname $0)" || exit 1
cd "$(git rev-parse --show-toplevel)" || exit 1

echo '==> Install zsh ...'

mkdir -pv bak
touch ~/.zshrc.local

[ -e ~/.zshrc ] && mv -v ~/.zshrc bak/.zshrc
[ -e ~/.p10k.zsh ] && mv -v ~/.p10k.zsh bak/.p10k.zsh

ln -sfv ~/dotfiles/zshrc ~/.zshrc
ln -sfv ~/dotfiles/etc/.p10k.zsh ~/.p10k.zsh

echo ''
