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
syntax on " enable SYNTAX highlightning
filetype on " enable the FILETYPE detection
filetype plugin on " enable the vim settings for thr current FILETYPE
filetype indent on " enable the INDENT setting for the current FILETYPE
packadd! matchit
" }}}

" HARDCOPY/PRINT {{{
" printers: http://localhost:631/printers/
set printoptions=paper:A4,header:0
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
set path+=**
set encoding=utf-8 " default ENCODING for reading a text file
set fileencoding=utf-8 " default ENCODING for writing a text FILE
set fileformat=unix " set the textFILE newline FORMAT to <NL>
" }}}

" SPELL LANGUAGES {{{
" set spell
set nospell
set spelllang=en_us,it,eo
" }}}

" ERRORS & BELLS {{{
set errorbells " BELL as ERROR message
set visualbell " use a VISUAL BELL instead of beeping
set shortmess=a " avoid all the hit-enter prompts caused by file messages
" }}}

" WILDMENU {{{
set wildchar=<Tab> " what CHAR opens the WILD menu?
set wildmenu " when WILD char (<Tab>) is pressed a graphical menu opens to show items
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx " ignore files with these extensions
set wildmode=longest,full " WILD menu MODE: open, if match isn't longest and complete
set wildoptions=pum,tagfile " how command-line completion is done
" }}}

" AUTOCOMPLETION {{{
set omnifunc=syntaxcomplete#Complete " enable OMNIcompletion with complete syntax FUNCTION
" }}}

" TAB AND ENTER IN POPUP MENU {{{
" taken from https://github.com/w0rp/vim/blob/master/autoload/startup/keybinds.vim

function! SmartESC()
    " Make pressing ESC close the completion menu.
    if pumvisible()
        return "\<C-e>"
    endif

    return "\<ESC>"
endfunction

function! SmartEnter()
    " Make pressing Enter accept a completion entry.
    if pumvisible()
        return "\<C-y>"
    endif

    return "\<CR>"
endfunction

function! SmartTab() abort
    " Use Tab and Shift+Tab for either completion or SnipMate.
    if pumvisible()
        let l:keys = "\<C-n>"

        if get(b:, 'ale_last_completion_count') is 1
            let l:keys .= "\<Left>\<Right>"
        endif

        return l:keys
    endif

    " return snipMate#TriggerSnippet()
    return "\<Tab>"
endfunction

function! SmartShiftTab() abort
    if pumvisible()
        return "\<C-p>"
    endif

    " return snipMate#BackwardsSnippet()
    return "\<S-Tab>"
endfunction

function! SmartInsertCompletion() abort
    if pumvisible()
        return "\<C-n>"
    endif

    return "\<C-c>a\<C-n>"
endfunction

inoremap <silent> <CR> <C-R>=SmartEnter()<CR>
inoremap <silent> <ESC> <C-R>=SmartESC()<CR>
inoremap <silent> <Tab> <C-R>=SmartTab()<CR>
inoremap <silent> <S-Tab> <C-R>=SmartShiftTab()<CR>
inoremap <silent> <C-n> <C-R>=SmartInsertCompletion()<CR>
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
"  b    <BS>   Normal and Visual
"  s    <Space>   Normal and Visual
"  h    "h"   Normal and Visual (not recommended)
"  l    "l"   Normal and Visual (not recommended)
"  <    <Left>   Normal and Visual
"  >    <Right>   Normal and Visual
"  ~    "~"   Normal
"  [    <Left>   Insert and Replace
"  ]    <Right>   Insert and Replace
set whichwrap=b,s ",<,>,[,] " WHICH right/left keys may move to the next/prev WRAPped line?
" }}}

" FOLDING {{{
set foldlevel=0 " FOLDS with a higher LEVEL will be closed.
set foldcolumn=9 " show open and closed folds
" set foldtext=gitgutter#fold#is_changed()
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker " FOLDing METHOD (logic)
augroup END
nnoremap <space> za
vnoremap <space> zf
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

augroup tab_bash
  autocmd!
  autocmd BufNewFile,BufRead *.bash,*.sh setlocal filetype=sh
  autocmd BufNewFile,BufRead *.bash,*.sh setlocal foldmethod=syntax
  autocmd BufNewFile,BufRead *.bash,*.sh setlocal colorcolumn=80 " draw a vertical line to visualize textwidth
  autocmd BufNewFile,BufRead *.bash,*.sh setlocal textwidth=80 " linewidth is 80 chars, we respect you PEP8
  autocmd BufNewFile,BufRead *.bash,*.sh setlocal expandtab " EXPAND TABs into spaces
  autocmd BufNewFile,BufRead *.bash,*.sh setlocal shiftwidth=4 " SHIFT commands WIDTH in columns
  autocmd BufNewFile,BufRead *.bash,*.sh setlocal softtabstop=4 " how may spaces are insert when <Tab> is pressed
  autocmd BufNewFile,BufRead *.bash,*.sh setlocal tabstop=4 " number of spaces that a <Tab> in the file counts for
augroup END

augroup tab_python
  autocmd!
  autocmd BufNewFile,BufRead *.py setlocal foldmethod=syntax
  autocmd BufNewFile,BufRead *.py setlocal colorcolumn=80 " draw a vertical line to visualize textwidth
  autocmd BufNewFile,BufRead *.py setlocal textwidth=80 " linewidth is 80 chars, we respect you PEP8
  autocmd BufNewFile,BufRead *.py setlocal expandtab " EXPAND TABs into spaces
  autocmd BufNewFile,BufRead *.py setlocal shiftwidth=4 " SHIFT commands WIDTH in columns
  autocmd BufNewFile,BufRead *.py setlocal softtabstop=4 " how may spaces are insert when <Tab> is pressed
  autocmd BufNewFile,BufRead *.py setlocal tabstop=4 " number of spaces that a <Tab> in the file counts for
"   packadd! SimpylFold
"   packadd! indentpython.vim
  let python_highlight_all=1
  " python with virtualenv support
python3 << EOF
import os
import subprocess
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_script = os.path.join(project_base_dir, 'bin/activate')
    subprocess.run(f" bash {activate_script}", shell=True)
EOF
augroup END

" augroup tab_rust
"   autocmd!
"   setlocal makeprg=cargo\ build
"   autocmd BufNewFile,BufRead *.rs setlocal foldmethod=syntax
" autocmd BufNewFile,BufRead *.rs setlocal colorcolumn=80 " draw a vertical line to visualize textwidth
" autocmd BufNewFile,BufRead *.rs setlocal textwidth=80 " linewidth is 80 chars, we respect you PEP8
" autocmd BufNewFile,BufRead *.rs setlocal expandtab " EXPAND TABs into spaces
" autocmd BufNewFile,BufRead *.rs setlocal shiftwidth=4 " SHIFT commands WIDTH in columns
" autocmd BufNewFile,BufRead *.rs setlocal softtabstop=4 " how may spaces are insert when <Tab> is pressed
" autocmd BufNewFile,BufRead *.rs setlocal tabstop=4 " number of spaces that a <Tab> in the file counts for
" augroup END

augroup tab_javascript
  autocmd!
  autocmd BufNewFile,BufRead *.html,*.js,*.json,*.css setlocal foldmethod=syntax
  autocmd BufNewFile,BufRead *.html,*.js,*.json,*.css setlocal expandtab " EXPAND TABs into spaces
  autocmd BufNewFile,BufRead *.html,*.js,*.json,*.css setlocal shiftwidth=2 " SHIFT commands WIDTH in columns
  autocmd BufNewFile,BufRead *.html,*.js,*.json,*.css setlocal softtabstop=2 " how may spaces are insert when <Tab> is pressed
  autocmd BufNewFile,BufRead *.html,*.js,*.json,*.css setlocal tabstop=2 " number of spaces that a <Tab> in the file counts for
augroup END

augroup tab_xml
  autocmd!
"   autocmd BufNewFile,BufRead *.xml *.cda *.xslt set filetype=xml
  let g:xml_syntax_folding=1
  autocmd FileType xml setlocal foldmethod=syntax
  autocmd FileType xml syntax on " I do not understand why the previous line need this line to activate
  autocmd FileType xml highlight LineNr term=bold cterm=bold gui=bold
  autocmd FileType xml highlight CursorLineNr term=bold cterm=bold gui=bold
"   autocmd FileType xml highlight CursorLine term=underline cterm=inverse gui=inverse
"   autocmd FileType xml highlight CursorColumn term=underline cterm=inverse gui=inverse
  autocmd FileType xml highlight NonText term=italic cterm=italic ctermfg=242 gui=italic guifg=#6c6c6c
"   autocmd FileType xml highlight SignColumn term=bold cterm=bold ctermfg=15 ctermbg=0 gui=bold guifg=#ffffff guibg=#000000
  autocmd FileType xml highlight SignColumn term=bold cterm=bold ctermbg=0 gui=bold guibg=#000000
"   autocmd FileType xml highlight SignatureMarkText term=bold cterm=bold ctermfg=15 ctermbg=0 gui=bold guifg=#ffffff guibg=#000000
  autocmd FileType xml highlight SignatureMarkText term=bold cterm=bold ctermbg=0 gui=bold guibg=#000000
augroup END
" }}}

" COLORS {{{
" set termguicolors
if ! has('nvim')
  set antialias " if this file will ever be used by gvim, ANTIALIAS the font
endif

augroup color_scheme
  " https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
  autocmd!
  autocmd ColorScheme * set bg=dark " set a color scheme optimized for the specified BackGround color
  autocmd ColorScheme * set cursorcolumn " highlight current CURSOR COLUMN
  autocmd ColorScheme * set cursorline " highlight current CURSOR LINE
  autocmd ColorScheme * highlight LineNr term=bold cterm=bold gui=bold
  autocmd ColorScheme * highlight CursorLineNr term=bold cterm=bold gui=bold
"   autocmd ColorScheme * highlight CursorLine term=underline cterm=inverse gui=inverse
"   autocmd ColorScheme * highlight CursorColumn term=underline cterm=inverse gui=inverse
  autocmd ColorScheme * highlight NonText term=italic cterm=italic ctermfg=242 gui=italic guifg=#6c6c6c
"   autocmd ColorScheme * highlight SignColumn term=bold cterm=bold ctermfg=15 ctermbg=0 gui=bold guifg=#ffffff guibg=#000000
  autocmd ColorScheme * highlight SignColumn term=bold cterm=bold ctermbg=0 gui=bold guibg=#000000
"   autocmd ColorScheme * highlight SignatureMarkText term=bold cterm=bold ctermfg=15 ctermbg=0 gui=bold guifg=#ffffff guibg=#000000
  autocmd ColorScheme * highlight SignatureMarkText term=bold cterm=bold ctermbg=0 gui=bold guibg=#000000
augroup END

" if $COLORTERM =~# 'truecolor' || $COLORTERM =~# '24bit'
  colorscheme xoria256
" else
"   colorscheme matrix
" endif
" set lazyredraw " redraw the screen after a macro/register/cmd ends
" }}}

" SEARCH {{{
set hlsearch " HighLight matching patterns during SEARCH commands
set ignorecase " IGNORE the CASE of search patterns
set incsearch " search INCrementally while the user is typing
set list " LIST mode: show tabs and eol ($)
" set listchars=precedes:❮,tab:‹·›,lead:⟩,trail:⟨,extends:❯,eol:↲,nbsp:␣,conceal:✘
set listchars=eol:¶,tab:‹·›,trail:·,extends:›,precedes:‹,nbsp:•,conceal:×
set showbreak=⮎ " ⤷ " +++
set smartcase " SMART search: if the search pattern contains upperCASE letters, the search becomes case sensitive
nnoremap n nzzzv
nnoremap N Nzzzv
" }}}

" CTRL-A & CTRL-X {{{
set nrformats=alpha,bin,octal,hex " NumbeRFORMATS recogninzed by CTRL-X and CTRL-A
" }}}

" YANK & PUT {{{
set pastetoggle=<Leader>p
" set selectmode=cmd,key,mouse " how SELECT MODE can be activated
nnoremap Y y$
nnoremap <C-y> <cmd>%yank "+<CR>
if has('unnamedplus')
    set clipboard=unnamedplus
endif
" }}}

" TOKEN MATCHING {{{
set matchtime=5 " Tenths of seconds to show matching peer
set matchpairs=(:),[:],{:},«:»,<:>,‹:› " Characters that form pairs
set showmatch " Briefly jump to the matching bracket
set showfulltag
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

" FORMAT OPTIONS {{{
set formatoptions+=1n " How automatic text formatting is done
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

function! IsPluginInstalled(plugin_name, mode='start')
  if index(['start', 'opt'], a:mode) == -1
    throw 'invalid mode: ' . a:mode
  endif
  return isdirectory(expand('~/.vim/pack/git-plugins/' . a:mode . '/' . a:plugin_name))
endfunction

function! IsPluginLoaded(plugin_name)
  return len(filter(split(execute('scriptnames'), '\n'), 'v:val =~ "start/' . a:plugin_name . '"'))
endfunction

" PACKAGES: environment, sessions, projects {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/leafOfTree/vim-project ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-dotenv ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" PACKAGES: colors {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/lifepillar/vim-gruvbox8 ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/rafi/awesome-vim-colorschemes ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" }}}

" PACKAGES: interface and popups {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/liuchengxu/vim-which-key ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" nnoremap <silent> <leader> :WhichKey '<Backslash>'<CR>
" nnoremap <silent> <NUL> :WhichKey '<CTRL-Space>'<CR>

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
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#tabline#buffer_nr_show = 1

" let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#gutentags#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#nerdtree_statusline = 1
" let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#whitespace#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" " unicode symbols
"   let g:airline_left_sep = '»'
"   let g:airline_left_sep = '▶'
"   let g:airline_right_sep = '«'
"   let g:airline_right_sep = '◀'
"   let g:airline_symbols.colnr = ' ㏇:'
"   let g:airline_symbols.colnr = ' ℅:'
"   let g:airline_symbols.crypt = '🔒'
"   let g:airline_symbols.linenr = '☰'
"   let g:airline_symbols.linenr = ' ␊:'
"   let g:airline_symbols.linenr = ' ␤:'
"   let g:airline_symbols.linenr = '¶'
"   let g:airline_symbols.maxlinenr = ''
"   let g:airline_symbols.maxlinenr = '㏑'
"   let g:airline_symbols.branch = '⎇'
"   let g:airline_symbols.paste = 'ρ'
"   let g:airline_symbols.paste = 'Þ'
"   let g:airline_symbols.paste = '∥'
"   let g:airline_symbols.spell = 'Ꞩ'
"   let g:airline_symbols.notexists = 'Ɇ'
"   let g:airline_symbols.notexists = '∄'
"   let g:airline_symbols.whitespace = 'Ξ'

"   " powerline symbols
"   let g:airline_left_sep = ''
"   let g:airline_left_alt_sep = ''
"   let g:airline_right_sep = ''
"   let g:airline_right_alt_sep = ''
"   let g:airline_symbols.branch = ''
"   let g:airline_symbols.colnr = ' ℅:'
"   let g:airline_symbols.readonly = ''
"   let g:airline_symbols.linenr = ' :'
"   let g:airline_symbols.maxlinenr = '☰ '
"   let g:airline_symbols.dirty='⚡'

"   " old vim-powerline symbols
"   let g:airline_left_sep = '⮀'
"   let g:airline_left_alt_sep = '⮁'
"   let g:airline_right_sep = '⮂'
"   let g:airline_right_alt_sep = '⮃'
"   let g:airline_symbols.branch = '⭠'
"   let g:airline_symbols.readonly = '⭤'
"   let g:airline_symbols.linenr = '⭡'

" " airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''

" " unicode symbols
" let g:airline#extensions#tabline#left_sep = '»'
" let g:airline#extensions#tabline#left_sep = '▶'
" let g:airline#extensions#tabline#right_sep = '«'
" let g:airline#extensions#tabline#right_sep = '◀'

" " airline symbols
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/vim-airline/vim-airline-themes ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" let g:airline_theme='<theme>'
" }}}

" PACKAGES: yank, regs, repeat {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/machakann/vim-highlightedyank ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if !exists('##TextYankPost')
  nmap y <Plug>(highlightedyank)
  xmap y <Plug>(highlightedyank)
  omap y <Plug>(highlightedyank)
endif

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/junegunn/vim-peekaboo ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-repeat ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" PACKAGES: integration with external programs {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-unimpaired ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/dhruvasagar/vim-open-url ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/markonm/traces.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
" ~ https://github.com/mg979/vim-visual-multi ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-characterize ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" PACKAGES: programming {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/puremourning/vimspector ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" let g:vimspector_enable_mappings = 'HUMAN'
" Key Mapping Function
" nmap <F2> <Plug>VimspectorToggleConditionalBreakpoint " Toggle conditional line breakpoint or logpoint on the current line.
" nmap <F3> <Plug>VimspectorStop " Stop debugging.
" nmap <F4> <Plug>VimspectorRestart " Restart debugging with the same configuration.
" nmap <F5> <Plug>VimspectorContinue " When debugging, continue. Otherwise start debugging.
" nmap <F6> <Plug>VimspectorPause " Pause debuggee.
" nmap <F7> <Plug>VimspectorRunToCursor " Run to Cursor
" nmap <F8> <Plug>VimspectorAddFunctionBreakpoint " Add a function breakpoint for the expression under cursor
" nmap <F9> <Plug>VimspectorToggleBreakpoint " Toggle line breakpoint on the current line.
" nmap <F10> <Plug>VimspectorStepOver " Step Over
" nmap <F11> <Plug>VimspectorStepInto " Step Into
" nmap <F12> <Plug>VimspectorStepOut " Step out of current function scope
" nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
" nmap <LocalLeader><F12> <Plug>VimspectorDownFrame
" " for normal mode - the word under the cursor
" nmap <Leader>di <Plug>VimspectorBalloonEval
" " for visual mode, the visually selected text
" xmap <Leader>di <Plug>VimspectorBalloonEval
" nmap <LocalLeader>B <Plug>VimspectorBreakpoints
" nmap <LocalLeader>D <Plug>VimspectorDisassemble
" nmap <Leader>db <Plug>VimspectorBreakpoints

nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/ludovicchabant/vim-gutentags ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:gutentags_project_root = ['LICENSE', 'README.md']
let g:gutentags_ctags_tagfile = 'tags'

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
if IsPluginInstalled("ale")
  set omnifunc=ale#completion#OmniFunc " use the A.L.E. plugin for ^X^O
  let g:ale_lsp_suggestions = 1 " show hints/suggestions from LSP servers or tsserver, in addition to warnings and errors
  let g:ale_floating_preview = 1 " Vim with |popupwin| will use a floating window for ale's preview window
  let g:ale_completion_enabled = 1 " ALE own completion
  let g:ale_sign_column_always = 1 " always show sign (error/warning) column
  let g:ale_change_sign_column_color = 1 " set different highlights for the sign column itself when ALE reports problems with a file
  let g:ale_completion_autoimport = 1 " ALE will try to automatically import completion results from external modules
  let g:ale_fix_on_save = 1 " ALE will fix files when they are saved
  if IsPluginInstalled("airline")
    let g:airline#extensions#ale#enabled = 1 " show errors or warnings in my statusline
  endif
  let g:ale_set_balloons = 1 " hover information also show up when you move the mouse over a symbol in a buffer
  let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
  let g:ale_completion_symbols = {
    \ 'text': '',
    \ 'method': '',
    \ 'function': '',
    \ 'constructor': '',
    \ 'field': '',
    \ 'variable': '',
    \ 'class': '',
    \ 'interface': '',
    \ 'module': '',
    \ 'property': '',
    \ 'unit': 'unit',
    \ 'value': 'val',
    \ 'enum': '',
    \ 'keyword': 'keyword',
    \ 'snippet': '',
    \ 'color': 'color',
    \ 'file': '',
    \ 'reference': 'ref',
    \ 'folder': '',
    \ 'enum member': '',
    \ 'constant': '',
    \ 'struct': '',
    \ 'event': 'event',
    \ 'operator': '',
    \ 'type_parameter': 'type param',
    \ '<default>': 'v'
    \ }

  " unicode
  " let g:ale_sign_error = '»»'
  " let g:ale_sign_warning = '--'

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
  if IsPluginInstalled("coc.nvim")
    let g:ale_disable_lsp = 1
  endif

  " disabled linters already contained in pylama:
  "    \ 'flake8',
  "    \ 'pycodestyle',
  "    \ 'pyflakes',
  "    \ 'pylint',
  "    \ 'vulture',
"      \ 'pylsp',
"      \ 'mypy',
"      \ 'pyright',
      " \ 'jedils',
"
"      \ 'rustc'
  let g:ale_linters={
    \ 'dockerfile': [
      \ 'dockerfile_linter'
    \ ],
    \ 'javascript': [
      \ 'importjs',
      \ 'prettier',
      \ 'xo'
    \ ],
    \ 'python': [
      \ 'pyright',
      \ 'bandit',
      \ 'pycln',
      \ 'pylama'
    \ ],
    \ 'rust': [
      \ 'analyzer',
      \ 'cargo',
      \ 'rls'
    \ ],
    \ 'sh': [
      \ 'bashate',
      \ 'shell',
      \ 'shellcheck'
    \ ]
  \ }

  let g:ale_fixers={
    \ 'javascript': [
      \ 'prettier',
      \ 'remove_trailing_lines',
      \ 'trim_whitespace',
      \ 'xo'
    \ ],
    \ 'python': [
      \ 'add_blank_lines_for_python_control_statements',
      \ 'black',
      \ 'isort',
      \ 'reorder-python-imports',
      \ 'remove_trailing_lines',
      \ 'ruff',
      \ 'trim_whitespace',
      \ 'yapf'
    \ ],
    \ 'rust': [
      \ 'remove_trailing_lines',
      \ 'rustfmt',
      \ 'trim_whitespace'
    \ ],
    \ 'sh': [
      \ 'remove_trailing_lines',
      \ 'shfmt',
      \ 'trim_whitespace'
    \ ],
    \ 'vim': [
      \ 'remove_trailing_lines',
      \ 'trim_whitespace'
    \ ]
  \ }

" https://docs.openstack.org/bashate/latest/man/bashate.html
" https://docs.openstack.org/bashate/latest/readme.html#currently-supported-checks
" let g:ale_sh_bashate_options = "--verbose --ignore E006"
let g:ale_sh_bashate_options = "--verbose"
let g:ale_sh_shfmt_options = "-i 4 -bn -ci -sr -kp"

endif

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/neoclide/coc.nvim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" https://github.com/neoclide/coc.nvim/wiki

if IsPluginInstalled("coc.nvim")
  let g:airline#extensions#coc#enabled = 1

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: There's always complete item selected by default, you may want to enable
  " no select by `"suggest.noselect": true` in your configuration file.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  " Make <CR> to accept selected completion item or notify coc.nvim to format
  " <C-g>u breaks current undo, please make your own choice.
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call ShowDocumentation()<CR>

  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Run the Code Lens action on the current line.
  nmap <leader>cl  <Plug>(coc-codelens-action)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of language server.
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocActionAsync('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings for CoCList
  " Show all diagnostics.
  nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
endif

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/ycm-core/YouCompleteMe ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
if IsPluginInstalled("YouCompleteMe")
  " create .ycm_extra_conf.py file at the root of your project with the following contents:
  " def Settings(**kwargs):
  "     return {
  "         "interpreter_path": "/path/to/virtual/environment/python"
  "     }
endif

" }}}

" PACKAGES: language {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/preservim/vim-markdown ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
" let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_leader_key='<Tab>'

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/sheerun/vim-polyglot ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
" set signcolumn = yes
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_set_sign_backgrounds = 1
" let g:gitgutter_sign_added = 'xx'
" let g:gitgutter_sign_modified = 'yy'
" let g:gitgutter_sign_removed = 'zz'
" let g:gitgutter_sign_removed_first_line = '^^'
" let g:gitgutter_sign_removed_above_and_below = '{'
" let g:gitgutter_sign_modified_removed = 'ww'
nnoremap <Leader>hd <Plug>(GitGutterDiffOrig)
nnoremap <Leader>hf <Plug>(GitGutterFold)
nnoremap <Leader>hu <Plug>(GitGutterUndoHunk)
nnoremap <Leader>hp <Plug>(GitGutterPreviewHunk)
nnoremap <Leader>hs <Plug>(GitGutterStageHunk)
nnoremap [h <Plug>(GitGutterPrevHunk)
nnoremap ]h <Plug>(GitGutterNextHunk)
omap ic <Plug>(GitGutterTextObjectInnerPending)
omap ac <Plug>(GitGutterTextObjectOuterPending)
xmap ic <Plug>(GitGutterTextObjectInnerVisual)
xmap ac <Plug>(GitGutterTextObjectOuterVisual)

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
