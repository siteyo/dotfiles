rem Execute with administrator authority

rem Set directory path to variables
set HOMEPATH=
set REPOPATH=%HOMEPATH%\dotfiles\vim

rem Create a directory
mkdir %HOMEPATH%\.vim
mkdir %HOMEPATH%\.vim\backup
mkdir %HOMEPATH%\.vim\swap
mkdir %HOMEPATH%\.vim\undo

rem Creates symbolic links
mklink %HOMEPATH%\init.vim %REPOPATH%\vim\vimrc
mklink %HOMEPATH%\ginit.vim %REPOPATH%\vim\gvimrc

pause
