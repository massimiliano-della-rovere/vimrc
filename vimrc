" https://github.com/massimiliano-della-rovere/vimrc/edit/main/vimrc

" GENERAL {{{
" set cmdheight=4
set nocompatible " enable vim new functions, making it 'NO COMPATIBLE' with vi
set history=1000 " history of :commands and search patters
if has('mouse')
	set mouse=a " use all mouse functions
endif
" if there is a git root, keep that as cwd
" autocmd BufEnter * Gcd
" }}}

" SYNTAX {{{
filetype on " enable the FILETYPE detection
filetype plugin on " enable the vim settings for thr current FILETYPE
filetype indent on " enable the INDENT setting for the current FILETYPE
if &t_Co > 1
	syntax on " enable SYNTAX highlightning
endif
" packadd! matchit
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
" set autochdir " the current DIR in the OS is AUTO CHanged to match the current window's buffer
set hidden " HIDDEN (:hide) buffers won't be unloaded
" set noswapfile " don't create a backup .swp file
nnoremap <M-Left> :bprevious<CR>
nnoremap <M-Right> :bnext<CR>
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
set foldcolumn=12 " show open and closed folds
" set foldtext=gitgutter#fold#is_changed()
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker " FOLDing METHOD (logic)
augroup END
nnoremap <space> za
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
	autocmd BufNewFile,BufRead *.py set colorcolumn=80 " draw a vertical line to visualize textwidth
	autocmd BufNewFile,BufRead *.py set textwidth=80 " linewidth is 80 chars, we respect you PEP8
	autocmd BufNewFile,BufRead *.py set expandtab " EXPAND TABs into spaces
	autocmd BufNewFile,BufRead *.py set shiftwidth=4 " SHIFT commands WIDTH in columns
	autocmd BufNewFile,BufRead *.py set softtabstop=4 " how may spaces are insert when <Tab> is pressed
	autocmd BufNewFile,BufRead *.py set tabstop=4 " number of spaces that a <Tab> in the file counts for
" 	packadd! SimpylFold
" 	packadd! indentpython.vim
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
set showbreak=⮎ " ⤷ " +++ 
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

" PACKAGES: configuration {{{
" PACKAGES: colors {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/lifepillar/vim-gruvbox8 ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/rafi/awesome-vim-colorschemes ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" }}}

" PACKAGES: interface and popups {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/frazrepo/vim-rainbow ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:rainbow_active = 1
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/ryanoasis/vim-devicons ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/vim-airline/vim-airline-themes ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" let g:airline_theme='<theme>'

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-dotenv ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/junegunn/vim-peekaboo ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" PACKAGES: misc {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/mg979/vim-visual-multi ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/dhruvasagar/vim-open-url ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-repeat ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/edkolev/promptline.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/christoomey/vim-tmux-navigator ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" https://www.rockyourcode.com/make-vim-work-with-tmux/
" TMUX
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/edkolev/tmuxline.vim ~ mi serve?
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" PACKAGES: undo {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/simnalamburt/vim-mundo ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo
nnoremap <Leader>u :MundoToggle<CR>
" }}}

" PACKAGES: folding {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/Konfekt/FastFold ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tmhedberg/SimpylFold ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" PACKAGES: marks {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/kshenoy/vim-signature ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" PACKAGES: text objects and matching {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/andymass/vim-matchup ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/valloric/MatchTagAlways ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/wellle/targets.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/machakann/vim-sandwich ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" this replaces https://github.com/tpope/surround-vim
" and partly overlaps with https://github.com/mattn/emmet-vim

" use vim-surround mappings
" runtime macros/sandwich/keymap/surround.vim

" if you have not copied default recipes
let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)

" add spaces inside bracket like in tpope's vim-surround
let g:sandwich#recipes += [
	\ {
	\    'buns': ['{ ', ' }'],
	\    'nesting': 1,
	\    'match_syntax': 1,
	\    'kind': ['add', 'replace'],
	\    'action': ['add'],
	\    'input': ['{']
	\ },
	\ {
	\    'buns': ['[ ', ' ]'],
	\    'nesting': 1,
	\    'match_syntax': 1,
	\    'kind': ['add', 'replace'],
	\    'action': ['add'],
	\    'input': ['[']
	\ },
	\ {
	\    'buns': ['( ', ' )'],
	\    'nesting': 1,
	\    'match_syntax': 1,
	\    'kind': ['add', 'replace'],
	\    'action': ['add'], 'input': ['(']
	\ },
	\ {
	\    'buns': ['{\s*', '\s*}'],
	\    'nesting': 1,
	\    'regex': 1,
	\    'match_syntax': 1,
	\    'kind': ['delete', 'replace', 'textobj'],
	\    'action': ['delete'],
	\    'input': ['{']
	\ },
	\ {
	\    'buns': ['\[\s*', '\s*\]'], 
	\    'nesting': 1,
	\    'regex': 1,
	\    'match_syntax': 1,
	\    'kind': ['delete', 'replace', 'textobj'],
	\    'action': ['delete'],
	\    'input': ['[']
	\ },
	\ {
	\    'buns': ['(\s*', '\s*)'],
	\    'nesting': 1,
	\    'regex': 1,
	\    'match_syntax': 1,
	\    'kind': ['delete', 'replace', 'textobj'],
	\    'action': ['delete'],
	\    'input': ['(']
	\ },
	\ ]
" }}}

" PACKAGES: window {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/roman/golden-ratio ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" PACKAGES: find, replace, grep {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/brooth/far.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" activate the :Farundo command
let g:far#enable_undo=1
" use ripgrep to source for files
let g:far#source='rg'
" glob mode to use
let g:far#glob_mode='rg'

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/ggreer/the_silver_searcher ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/BurntSushi/ripgrep ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" use ripgrep to source for the :grep command
set grepprg='rg\ --vimgrep\ --smartcase\ --follow'

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/junegunn/fzf ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/junegunn/fzf.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
" let g:fzf_tags_command = 'ctags -R --language-all'
" see ~/.ctags

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/coreyja/fzf.devicon.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" PACKAGES: netrw & nerdtree {{{
" ~~~~~~~~~
" ~ NetRW ~
" ~~~~~~~~~
" https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
let g:netrw_keepdir = 0
let g:netrw_winsize = 25
let g:netrw_banner = 0
" ignore files starting with .
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_localcopydircmd = 'cp -r'
" Set the default listing style:
" = 0: thin listing (one file per line)
" = 1: long listing (one file per line with timestamp information and file size)
" = 2: wide listing (multiple files in columns)
" = 3: tree style listing
let g:netrw_liststyle = 3
" when browsing, <cr> will open the file by:
" =0: re-using the same window  (default)
" =1: horizontally splitting the window first
" =2: vertically   splitting the window first
" =3: open file in new tab
" =4: act like 'P' (ie. open previous window)
"     Note that |g:netrw_preview| may be used
"     to get vertical splitting instead of
"     horizontal splitting.
let g:netrw_browse_split = 4
" change from left splitting to right splitting
let g:netrw_altv = 1

highlight! link netrwMarkFile Search

" augroup ProjectDrawer
  " autocmd!
  " autocmd VimEnter * :Vexplore
" augroup END

nnoremap <Leader>dd :Lexplore %:p:h<CR>
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

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-vinegar ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
let NERDTreeHijackNetrw=1

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/preservim/nerdtree ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/Xuyuanp/nerdtree-git-plugin ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time
let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too
let g:NERDTreeGitStatusShowClean = 1 " show the 'clean' indicator

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tiagofumo/vim-nerdtree-syntax-highlight ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" PACKAGES: input {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-characterize ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" PACKAGES: programming {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/ludovicchabant/vim-gutentags ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/vim-scripts/taglist.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nnoremap <silent> <leader>is :TlistToggle<cr>

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-endwise ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-commentary ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/ycm-core/YouCompleteMe ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" create .ycm_extra_conf.py file at the root of your project with the following contents:
" def Settings(**kwargs):
"     return {
"         "interpreter_path": "/path/to/virtual/environment/python"
"     }

" }}}

" PACKAGES: language {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/othree/csscomplete.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/hail2u/vim-css3-syntax ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/ekalinin/Dockerfile.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/vim-scripts/indentpython.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/jmcantrell/vim-virtualenv ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/mattn/emmet-vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
let g:user_emmet_leader_key='<C-Z>'
" }}}

" PACKAGES: database {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-dadbod ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/lifepillar/pgsql.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" PACKAGES: git {{{
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

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-fugitive ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/junegunn/gv.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" }}}

" PACKAGES: help & tags {{{
" load all plugins now
" plugins need to be added to runtimepath before helptags can be generated
packloadall
" load all of the helptags now, after plugins have been loaded
" all messages and errors will be ignored
silent! helptags ++t ALL

let g:airline#extensions#ale#enabled = 1 " integrate a.l.e. errors in the airline statusline
" }}}

