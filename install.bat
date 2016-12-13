copy _vimrc %HOMEPATH%
copy .gitignore %HOMEPATH%
mkdir %HOMEPATH%\.vim
xcopy .vim %HOMEPATH%\.vim /e
mkdir %HOMEPATH%\.git
xcopy .git %HOMEPATH%\.git /e
