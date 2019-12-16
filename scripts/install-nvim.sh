mkdir ~/.config/nvim
mkdir ~/.nvim
mkdir ~/vimfiles
mkdir ~/vimfiles/nvimbackup
mkdir ~/vimfiles/nvimundo

ln -sf ~/dotfiles/vim/vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/coc-settings.json ~/.config/nvim/coc-settings.json

touch ~/dotfiles/vim/local_init.vim
