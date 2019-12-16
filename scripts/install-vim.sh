mkdir ~/.config/vim
mkdir ~/.vim
mkdir ~/vimfiles
mkdir ~/vimfiles/vimbackup
mkdir ~/vimfiles/vimundo

ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim/coc-settings.json ~/.config/vim/coc-settings.json

touch ~/dotfiles/vim/local_vimrc.vim
