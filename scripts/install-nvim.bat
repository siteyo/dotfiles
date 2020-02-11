rem Execute with administrator authority

rem Set directory path to variables
set HOMEPATH=
set NVIMPATH=%HOMEPATH%\AppData\Local\nvim
set REPOPATH=%HOMEPATH%\dotfiles\vim

rem Create a directory
mkdir %NVIMPATH%
mkdir %HOMEPATH%\.nvim
mkdir %HOMEPATH%\.nvim\backup
mkdir %HOMEPATH%\.nvim\swap
mkdir %HOMEPATH%\.nvim\undo

rem Creates symbolic links
mklink %NVIMPATH%\init.vim %REPOPATH%\vimrc
mklink %NVIMPATH%\ginit.vim %REPOPATH%\gvimrc
mklink %NVIMPATH%\coc-settings.json %REPOPATH%\coc-settings.json

pause
