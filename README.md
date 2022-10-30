Bookmarks

http://vimdoc.sourceforge.net/htmldoc/help.html
https://jeffkreeftmeijer.com/vim-number/
https://web.archive.org/web/20151210012212/http://www.sontek.net/blog/2011/05/07/turning_vim_into_a_modern_python_ide.html
https://github.com/powerline/fonts
https://github.com/vim-airline/vim-airline
https://shapeshed.com/vim-netrw/
https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")
https://jip.dev/posts/a-simpler-vim-statusline/
https://www.reddit.com/r/vim/comments/yc4eqr/is_there_any_graphical_editor_to_create_vim_themes/?utm_source=share&utm_medium=android_app&utm_name=androidcss&utm_term=1&utm_content=share_button
http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/





apt list --installed | grep -P '^vim-' | cut -d / -f 1

vim-common
vim-doc
vim-gtk3
vim-gtk
vim-gui-common
vim-nox
vim-runtime
vim-scripts
