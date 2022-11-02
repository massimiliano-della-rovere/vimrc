" https://github.com/massimiliano-della-rovere/vimrc/edit/main/vimrc

" GENERAL {{{
" set cmdheight=4
set nocompatible " enable vim new functions, making it "NO COMPATIBLE" with vi
set history=1000 " history of :commands and search patters
if has('mouse')
	set mouse=a " use all mouse functions
endif
" }}}

" SYNTAX {{{
filetype on " enable the FILETYPE detection
filetype plugin on " enable the vim settings for thr current FILETYPE
filetype indent on " enable the INDENT setting for the current FILETYPE
if &t_Co > 1
	syntax on " enable SYNTAX highlightning
endif
packadd! matchit
" }}}

" HARDCOPY/PRINT {{{
" printers: http://localhost:631/printers/
set printoptions=paper:A4,header:0
" }}}

" COLORS {{{
" set termguicolors
set antialias " if this file will ever be used by gvim, ANTIALIAS the font

augroup color_scheme
	" https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
	autocmd!
	autocmd ColorScheme * set bg=dark " set a color scheme optimized for the specified BackGround color
	autocmd ColorScheme * set cursorcolumn " highlight current CURSOR COLUMN
	autocmd ColorScheme * set cursorline " highlight current CURSOR LINE
	autocmd ColorScheme * highlight LineNr term=bold cterm=bold gui=bold
	autocmd ColorScheme * highlight CursorLineNr term=bold cterm=bold gui=bold
" 	autocmd ColorScheme * highlight CursorLine term=underline cterm=inverse gui=inverse
" 	autocmd ColorScheme * highlight CursorColumn term=underline cterm=inverse gui=inverse
	autocmd ColorScheme * highlight NonText term=italic cterm=italic ctermfg=242 gui=italic guifg=#6c6c6c
" 	autocmd ColorScheme * highlight SignColumn term=bold cterm=bold ctermfg=15 ctermbg=0 gui=bold guifg=#ffffff guibg=#000000
	autocmd ColorScheme * highlight SignColumn term=bold cterm=bold ctermbg=0 gui=bold guibg=#000000
" 	autocmd ColorScheme * highlight SignatureMarkText term=bold cterm=bold ctermfg=15 ctermbg=0 gui=bold guifg=#ffffff guibg=#000000
	autocmd ColorScheme * highlight SignatureMarkText term=bold cterm=bold ctermbg=0 gui=bold guibg=#000000
augroup END

if $COLORTERM =~# 'truecolor' || $COLORTERM =~# '24bit'
	colorscheme xoria256
else
	colorscheme matrix
endif
" set lazyredraw " redraw the screen after a macro/register/cmd ends
" }}}

" INFO LINE {{{
set laststatus=2 " how long the STATUS line must be displayed (2=LASTs forever)
set report=0 " always (min value=0) REPORT the quanity of lines affected by the last command
set ruler " show the info bar (a.k.a. RULER) in bottom row of the window
" set rulerformat= " FORMAT of the RULER bar
" set statusline=buf#%n\ %F%M%Y%R%H%W%=\ pos:%o\ ascii:%b\ hex:0x%B\ row:%l/%L\ col:%c%V\ percent:%p%% " show the specified info in the STATUS LINE
set showcmd " SHOW the CoMmanD we are typing on the bottom line
set showmode " SHOW the MODE we are on
" }}}

" BUFFERS {{{
set autochdir " the current DIR in the OS is AUTO CHanged to match the current window's buffer
set hidden " HIDDEN (:hide) buffers won't be unloaded
" set noswapfile " don't create a backup .swp file
" }}}

" ENCODING & FILESYSTEM {{{
set encoding=utf-8 " default ENCODING for reading a text file
set fileencoding=utf-8 " default ENCODING for writing a text FILE
set fileformat=unix " set the textFILE newline FORMAT to <NL> 
" }}}

" ERROR BELLS {{{
set errorbells " BELL as ERROR message
set visualbell " use a VISUAL BELL instead of beeping
" }}}

" WILDMENU {{{
set wildchar=<Tab> " what CHAR opens the WILD menu?
set wildmenu " when WILD char (<Tab>) is pressed a graphical menu opens to show items
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx " ignore files with these extensions
set wildmode=full " WILD menu MODE: always open
" }}}

" AUTOCOMPLETION {{{
" set omnifunc=syntaxcomplete#Complete " enable OMNIcompletion with complete syntax FUNCTION
set omnifunc=ale#completion#OmniFunc " use the A.L.E. plugin for ^X^O
" }}}

" ROW NUMBERING {{{
set number " show row NUMBERs on the left side of the screen
set numberwidth=4 " allocate 4-columns WIDTH for the row numbers
set relativenumber " show the row number of the cursor line and the RELATIVE distance of each other shown line
" }}}

" LINE WRAPPING {{{
set wrapscan " search wraps at top from bottom
set wrap " lines longer than screen width will be WRAPped, enabling some z· and g· commands
set wrapmargin=0 " how many columns does the MARGIN of WRAPped lines span?
"  b    <BS>	 Normal and Visual
"  s    <Space>	 Normal and Visual
"  h    "h"	 Normal and Visual (not recommended)
"  l    "l"	 Normal and Visual (not recommended)
"  <    <Left>	 Normal and Visual
"  >    <Right>	 Normal and Visual
"  ~    "~"	 Normal
"  [    <Left>	 Insert and Replace
"  ]    <Right>	 Insert and Replace
set whichwrap=b,s ",<,>,[,] " WHICH right/left keys may move to the next/prev WRAPped line?
" }}}

" FOLDING {{{
set foldlevel=0 " FOLDS with a higher LEVEL will be closed.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker " FOLDing METHOD (logic)
augroup END
" }}}

" EXTRA SPACES {{{
augroup BadWhitespace
	highlight BadWhitespace term=undercurl,reverse ctermfg=White ctermbg=Red guifg=White guibg=Red
	autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
augroup END
" }}}

" PROGRAMMING LANGUAGES: INDENTATION & TABS {{{
	set autoindent " the INDENT of a new line will be AUTOmatically copied from the current line's one
	set shiftround " SHIFT commands will ROUND indent to multiple of 'shiftwidth'
	set smartindent " try to SMARTly detect when and where to INDENT new text
	set smarttab " when on, a <Tab> in front of a line inserts blanks according to 'shiftwidth
                 " when off, a <Tab> always inserts blanks according to 'tabstop' or 'softtabstop'

augroup tab_python
	autocmd!
	autocmd BufNewFile,BufRead *.py set textwidth=80 " linewidth is 80 chars, we respect you PEP8
	autocmd BufNewFile,BufRead *.py set expandtab " EXPAND TABs into spaces
	autocmd BufNewFile,BufRead *.py set shiftwidth=4 " SHIFT commands WIDTH in columns
	autocmd BufNewFile,BufRead *.py set softtabstop=4 " how may spaces are insert when <Tab> is pressed
	autocmd BufNewFile,BufRead *.py set tabstop=4 " number of spaces that a <Tab> in the file counts for
	packadd! SimpylFold
	packadd! indent_python
	let python_highlight_all=1
	" python with virtualenv support
	python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
augroup END

augroup tab_javascript
	autocmd!
	autocmd BufNewFile,BufRead *.html *.js *.css set expandtab " EXPAND TABs into spaces
	autocmd BufNewFile,BufRead *.html *.js *.css set shiftwidth=2 " SHIFT commands WIDTH in columns
	autocmd BufNewFile,BufRead *.html *.js *.css set softtabstop=2 " how may spaces are insert when <Tab> is pressed
	autocmd BufNewFile,BufRead *.html *.js *.css set tabstop=2 " number of spaces that a <Tab> in the file counts for
augroup END
" }}}

" SEARCH {{{
set hlsearch " HighLight matching patterns during SEARCH commands
set ignorecase " IGNORE the CASE of search patterns
set incsearch " search INCrementally while the user is typing
set list " LIST mode: show tabs and eol ($)
set listchars=eol:$,tab:‹·›,trail:·,extends:›,precedes:‹,nbsp:×
set showbreak=+++ 
set smartcase " SMART search: if the search pattern contains upperCASE letters, the search becomes case sensitive
nnoremap n nzz
nnoremap N Nzz
" }}}

" CTRL-A & CTRL-X {{{
set nrformats=alpha,bin,octal,hex " NumbeRFORMATS recogninzed by CTRL-X and CTRL-A
" }}}

" YANK & PUT {{{
set pastetoggle=<Leader>p
" set selectmode=cmd,key,mouse " how SELECT MODE can be activated
nnoremap Y y$
" }}}

" TOKEN MATCHING {{{
set matchtime=5 " Tenths of seconds to show matching peer
set matchpairs=(:),[:],{:},«:»,<:>,‹:› " Characters that form pairs
set showmatch " Briefly jump to the matching bracket
" }}}

" WINDOWS {{{
set splitright
set splitbelow
" }}}

" TABS {{{
" <NUL> means <C-Space>
nnoremap <expr> <NUL>e printf(":tabedit %s\n", v:count1)
nnoremap <expr> <NUL>n printf(":tabnew %s\n", v:count1)
nnoremap <NUL>f <C-W>gF
nnoremap <expr> <NUL>c printf(":tabclose %s\n", v:count1)
nnoremap <expr> <NUL>o printf(":tabonly %s\n", v:count1)
nnoremap <expr> <NUL>h printf(":tabprevious %s\n", v:count1)
nnoremap <expr> <NUL>l printf(":tabnext %s\n", v:count1)
nnoremap <expr> <NUL><Space> printf(":tabnext %s\n", v:count1)
nnoremap <expr> <NUL><NUL> printf(":tabprevious %s\n", v:count1)
nnoremap <expr> <NUL><Left> printf(":tabprevious %s\n", v:count1)
nnoremap <expr> <NUL><Right> printf(":tabnext %s\n", v:count1)
nnoremap <expr> <C-Left> printf(":tabprevious %s\n", v:count1)
nnoremap <expr> <C-Right> printf(":tabnext %s\n", v:count1)
nnoremap <NUL><Home> :tabfirst<CR>
nnoremap <NUL><End> :tablast<CR>
nnoremap <NUL>t :tabs<CR>
nnoremap <expr> <NUL>m printf(":tabmove %s\n", v:count1)
nnoremap <expr> <NUL>- printf(":tabmove -%s\n", v:count1)
nnoremap <expr> <NUL>+ printf(":tabmove +%s\n", v:count1)
" }}}

" INSERT MODE {{{
"   <BS>, <Del>, CTRL-W, CTRL-U
"   indent  allow backspacing over autoindent
"   eol  _  allow backspacing over line breaks (join lines)
"   start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"           stop once at the start of insert.
set backspace=
" }}}

" .vimrc {{{
autocmd BufWritePost .vimrc source %
nnoremap <leader>ev :edit ~/.vim/vimrc<cr>
nnoremap <leader>sv :source ~/.vim/vimrc<cr>
" }}}

" HELP {{{
augroup filetype_help
    autocmd!
    autocmd BufWinEnter * if &l:buftype ==# 'help' | setlocal nolist | endif
augroup END
" }}}

" ABBR {{{
abbr @@ massimiliano.dellarovere@gmail.com
" }}}

" NetRW {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/ ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:netrw_keepdir = 0
let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1

highlight! link netrwMarkFile Search

" augroup ProjectDrawer
  " autocmd!
  " autocmd VimEnter * :Vexplore
" augroup END

nnoremap <leader>dd :Lexplore %:p:h<CR>
nnoremap <Leader>da :Lexplore<CR>

function! NetrwMapping()
  nmap <buffer> H u
  nmap <buffer> h -^
  nmap <buffer> l <CR>

  nmap <buffer> . gh
  nmap <buffer> P <C-w>z

  nmap <buffer> L <CR>:Lexplore<CR>
  nmap <buffer> <Leader>dd :Lexplore<CR>

  nmap <buffer> <TAB> mf
  nmap <buffer> <S-TAB> mF
  nmap <buffer> <Leader><TAB> mu

  nmap <buffer> ff %:w<CR>:buffer #<CR>
  nmap <buffer> fe R
  nmap <buffer> fc mc
  nmap <buffer> fC mtmc
  nmap <buffer> fx mm
  nmap <buffer> fX mtmm
  nmap <buffer> f; mx

  nmap <buffer> fl :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>

  nmap <buffer> fq :echo 'Target:' . netrw#Expose("netrwmftgt")<CR>

  nmap <buffer> fd mtfq

  nmap <buffer> bb mb
  nmap <buffer> bd mB
  nmap <buffer> bl gb

  function! NetrwRemoveRecursive()
    if &filetype ==# 'netrw'
      cnoremap <buffer> <CR> rm -r<CR>
      normal mu
      normal mf

      try
        normal mx
      catch
        echo "Canceled"
      endtry

      cunmap <buffer> <CR>
    endif
  endfunction

  nmap <buffer> FF :call NetrwRemoveRecursive()<CR>
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
" }}}

" MAP {{{
    nnoremap <space> za
    nnoremap Y y$
" }}}

" COLORSCHEME: gruvbox8 - lifepillar/vim-gruvbox8 {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/lifepillar/vim-gruvbox8 ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" ggreer/the_silver_searcher {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/ggreer/the_silver_searcher ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" ekalinin/Dockerfile.vim {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/ekalinin/Dockerfile.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" junegunn/fzf {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/junegunn/fzf ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" junegunn/fzf.vim {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/junegunn/fzf.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" " [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
" let g:fzf_tags_command = 'ctags -R'
" see ~/.ctags

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
" }}}

" BurntSushi/ripgrep {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/BurntSushi/ripgrep ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" mcsween/indent_python {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/vim-scripts/indentpython.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" tpope/vim-dadbod {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-dadbod ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~
" }}}
"
"  tpope/vim-surround {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-surround ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~
" }}}

" tpope/vim-vinegar {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-vinegar ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" ycm-core/YouCompleteMe {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/ycm-core/YouCompleteMe ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" create .ycm_extra_conf.py file at the root of your project with the following contents:

" def Settings(**kwargs):
"     return {
"         "interpreter_path": "/path/to/virtual/environment/python"
"     }
" }}}

" dense-analysis/ale {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/dense-analysis/ale ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:ale_sign_column_always = 1 " always show sign (error/warning) column
let g:airline#extensions#ale#enabled = 1 " show errors or warnings in my statusline
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']

" unicode
let g:ale_sign_error = '»»'
let g:ale_sign_warning = '--'

" nerdfonts
" let g:ale_sign_error = ''
let g:ale_sign_error = ''
" let g:ale_sign_warning = ''
let g:ale_sign_warning = ''

" navigate errors/warning
:nnoremap ]a :ALENextWrap<CR>
:nnoremap [a :ALEPreviousWrap<CR>
:nnoremap ]A :ALELast
:nnoremap [A :ALEFirst

" :help ale-lint-other-machines
" }}}

" preservim/nerdtree {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/preservim/nerdtree ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" autocmd VimEnter * NERDTree | wincmd p " Start NERDTree and put the cursor back in the other window

" Start NERDTree when Vim is started without file arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Exit Vim if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Function to open the file or NERDTree or netrw
"   Returns: 1 if either file explorer was opened; otherwise, 0
function! s:OpenFileOrExplorer(...)
    if a:0 == 0 || a:1 == ''
        NERDTree
    elseif filereadable(a:1)
        execute 'edit '.a:1
        return 0
    elseif a:1 =~? '^\(scp\|ftp\)://' " Add other protocols as needed
        execute 'Vexplore '.a:1
    elseif isdirectory(a:1)
        execute 'NERDTree '.a:1
    endif
    return 1
endfunction

" Auto commands to handle OS commandline arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc()==1 && !exists('s:std_in') | if <SID>OpenFileOrExplorer(argv()[0]) | wincmd p | enew | wincmd p | endif | endif

" Command to call the OpenFileOrExplorer function.
command! -n=? -complete=file -bar Edit :call <SID>OpenFileOrExplorer('<args>')

" Command-mode abbreviation to replace the :edit Vim command.
cnoreabbrev e Edit

" http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
let NERDTreeHijackNetrw=1
" }}}

" Xyuyanp/nerdtree-git-plugin {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/Xuyuanp/nerdtree-git-plugin ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time
let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too
let g:NERDTreeGitStatusShowClean = 1 " show the 'clean' indicator
" }}}

" ryanoasis/vim-devicons {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/ryanoasis/vim-devicons ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" tiagofumo/vim-nerdtree-syntax-highlight {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tiagofumo/vim-nerdtree-syntax-highlight ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" tmhedberg/SimplyFold {{{
" python specific-folding
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tmhedberg/SimpylFold ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" valloric/MatchTagAlways {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/Valloric/MatchTagAlways ~
" ~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" mattn/emmet-vim {{{
" ######################################
" # https://github.com/mattn/emmet-vim #
" ######################################
" https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
let g:user_emmet_leader_key='<C-Z>'
" }}}

" kshenoy/vim-signature {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/kshenoy/vim-signature ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" vim-airline/vim-airline {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/vim-airline/vim-airline ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" unicode symbols
let g:airline#extensions#tabline#left_sep = '»'
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#right_sep = '«'
let g:airline#extensions#tabline#right_sep = '◀'

" airline symbols
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1

" }}}

" vim-airline/vim-airline-themes {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/vim-airline/vim-airline-themes ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" let g:airline_theme='<theme>'
" }}}

" airblade/vimgitgutter {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/airblade/vim-gitgutter ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set signcolumn=yes
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_set_sign_backgrounds = 1
" let g:gitgutter_sign_added = 'xx'
" let g:gitgutter_sign_modified = 'yy'
" let g:gitgutter_sign_removed = 'zz'
" let g:gitgutter_sign_removed_first_line = '^^'
" let g:gitgutter_sign_removed_above_and_below = '{'
" let g:gitgutter_sign_modified_removed = 'ww'
" }}}

" PACKAGES {{{
" load all plugins now
" plugins need to be added to runtimepath before helptags can be generated
packloadall
" load all of the helptags now, after plugins have been loaded
" all messages and errors will be ignored
silent! helptags ++t all

let g:airline#extensions#ale#enabled = 1 " integrate a.l.e. errors in the airline statusline
" }}}
