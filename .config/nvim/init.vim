set nocompatible
set completeopt+=noselect
filetype off
set hidden
set showtabline=0

" Specify a directory for plugins
set rtp+=~/.local/share/nvim/plugged
call plug#begin('~/.local/share/nvim/plugged')

" Add all your plugins here
"-------------------=== Code/Project navigation ===-------------

Plug 'scrooloose/nerdtree'                " Project and file navigation
Plug 'Xuyuanp/nerdtree-git-plugin'        " NerdTree git functionality
Plug 'neomake/neomake'                    " Asynchronous Linting and Make Framework
Plug 'Shougo/deoplete.nvim'               " Asynchronous Completion
Plug 'zchee/deoplete-go', { 'do': 'make'} " Asynchronous completion for go
Plug 'vim-ctrlspace/vim-ctrlspace'        " Tabs/Buffers/Fuzzy/Workspaces/Bookmarks
Plug 'mileszs/ack.vim'                    " Ag/Grep
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Uncomment if you want to use vim-airline over lightline
" Plug 'vim-airline/vim-airline'            " Lean & mean status/tabline for vim
" Plug 'vim-airline/vim-airline-themes'     " Themes for airline
Plug 'itchyny/lightline.vim'
Plug 'yuttie/comfortable-motion.vim'      " Smooth scrolling
Plug 'thaerkh/vim-indentguides'           " Visual representation of indents
Plug 'majutsushi/tagbar'                  " Class/module browser
Plug 'bling/vim-bufferline'               " Buffer-line vim - show list of buffers in command bar
Plug 'junegunn/limelight.vim'             " Hyperfocus-writing in Vim
Plug 'brooth/far.vim'                     " Find and replace
Plug 'junegunn/goyo.vim'                  " Distraction-free writing in Vim
Plug 'sheerun/vim-polyglot'               " A collection of language packs for Vim

"-------------------=== Fancy things ===----------------------------
Plug 'flazz/vim-colorschemes'             " Colorschemes
Plug 'jreybert/vimagit'                   " Git Operations
Plug 'chriskempson/base16-vim'            " Base 16 colors
Plug 'ryanoasis/vim-devicons'             " Dev Icons
Plug 'iCyMind/NeoSolarized'
Plug 'kamwitsta/flatwhite-vim'            " Flatwhite
Plug 'lifepillar/vim-colortemplate'       " Colortemplate
Plug 'nightsense/snow'                    " Snow
Plug 'ntk148v/vim-horizon'                " Horizon
Plug 'liuchengxu/space-vim-theme'         " Space-vim
Plug 'ntk148v/wal.vim'                    " PyWal vim

"-------------------=== Snippets support ===------------------------
Plug 'honza/vim-snippets'                 " snippets repo
Plug 'Raimondi/delimitMate'               " Auto-close brackets

"-------------------=== Languages support ===-----------------------
Plug 'scrooloose/nerdcommenter'           " Easy code documentation
Plug 'mitsuhiko/vim-sparkup'              " Sparkup(XML/jinja/htlm-django/etc.) support
Plug 'w0rp/ale'

"-------------------=== Python ===----------------------------------
Plug 'klen/python-mode'                   " Python mode (docs, refactor, lints...)
" Plug 'jmcantrell/vim-virtualenv'

"-------------------=== Go ===---------------------------------------
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'buoto/gotests-vim'                  " Generate table driven tests.

" Initialize plugin system
call plug#end()
filetype on
filetype plugin on
filetype plugin indent on

"-------------------
" General settings
"------------
set encoding=utf8
set t_Co=256
let base16colorspace=256
" Configure cursor
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
            \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
            \,sm:block-blinkwait175-blinkoff150-blinkon175
" NOTE: This is only compatible with Guake 3.X.
" Check issue: https://github.com/Guake/guake/issues/772
" if (has("termguicolors"))
" "   set termguicolors
" endif

syntax enable                             " enable syntaax highlighting

"let g:loaded_python_provider=1
let g:python2_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'
set shell=/bin/zsh
set number                                " show line numbers
set ruler
set ttyfast                               " terminal acceleration

set tabstop=4                             " 4 whitespaces for tabs visual presentation
set shiftwidth=4                          " shift lines by 4 spaces
set smarttab                              " set tabs for a shifttabs logic
set expandtab                             " expand tabs into spaces
set autoindent                            " indent when moving to the next line

set cursorline                            " show line under the cursor's line
set showmatch                             " show matching part of bracket parts (), [], {}

set enc=utf-8                             " utf-8 by default

set nobackup                              " no backup files
set noswapfile

set backspace=indent,eol,start            " backspace removes all

set scrolloff=20
set clipboard=unnamed                     " use system clipboard
set listchars=tab:>\ ,trail:•,extends:#,nbsp:." Indent guides settings

" Auto update
set autoread
set autowrite

" Uncomment it if you want to use mouse
" if has('mouse')
"     set mouse=a
" endif

" By the way, -- INSERT -- is unnecessary anymore because the mode information is displayed in the statusline.
set noshowmode

" -----------------------
" Tab / Buffers settings
" ----------------------
tab sball
set switchbuf=useopen
set laststatus=2
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap <silent> <leader>q: SyntasticCheck # <CR> :bp <BAR> bd #<CR>

" -----------------------
" Neomake settings
" -----------------------
call neomake#configure#automake('w')
let g:neomake_open_list=2

" -----------------------
" Deoplete settings
" -----------------------
let g:deoplete#enable_at_startup=1
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = '$GOPATH/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" -----------------------
" Search settings
" -----------------------
set incsearch	                            " incremental search
set hlsearch	                            " highlight search results

" ---------------------------
" Comfortable Motion settings
" ---------------------------
let g:comfortable_motion_scroll_down_key="j"
let g:comfortable_motion_scroll_up_key="k"
let g:comfortable_motion_no_default_key_mappings=1
let g:comfortable_motion_impulse_multiplier=25  " Feel free to increase/decrease this value.
nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>

" --------------------------
" Airline settings - uncomment if you want to use vim-airline over lightline
" --------------------------
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#tabline#formatter='unique_tail'
" let g:airline_powerline_fonts=1
" let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#tabline#enabled = 1

" ---------------------
"  Bufferline settings
" ---------------------
let g:bufferline_active_buffer_left = ''
let g:bufferline_active_buffer_right = ''
let g:bufferline_rotate = 2

" --------------------
" Lightline settings
" --------------------
let g:lightline = {
    \ 'active': {
    \   'left': [ ['mode', 'paste'],
    \             ['gitbranch', 'filename', 'readonly', 'modified'],
    \             ['bufferline']],
    \  },
    \ 'inactive': {
    \   'left': [],
    \   'right': [],
    \  },
    \  'component': {
    \     'lineinfo': ' %3l:%-2v',
    \     'bufferline': '%{bufferline#refresh_status()}%{g:bufferline_status_info.before . g:bufferline_status_info.current . g:bufferline_status_info.after}'
    \  },
    \  'component_function': {
    \     'gitbranch': 'gitbranch#name'
    \  }
    \ }
" Set version automatically based on vim (neovim) launch time
if strftime('%H') >= 7 && strftime('%H') < 19
    set background=light
else
    set background=dark
endif
"colorscheme madeofcode
"let g:lightline.colorscheme = 'one'
colorscheme wal
let g:lightline.colorscheme = 'wal'

"------------------------
" NERDTree settings
" -----------------------
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let g:NERDTreeHijackNetrw=0
let NERDTreeCascadeOpenSingleChildDir=1
autocmd VimEnter * if !argc() | NERDTree | endif  " Load NERDTree only if vim is run without arguments
nmap " :NERDTreeToggle<CR>

" -----------------------
" TagBar
" -----------------------
let g:tagbar_autofocus=0
let g:tagbar_width=42
" Always open TagBar when open python files. I don't like it much so let's
" comment it.
" autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose
nmap <F8> :TagbarToggle<CR>

" -----------------------
" NERDComment settings
" -----------------------

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims=1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" -----------------------
" DevIcon settings
" -----------------------
" loading the plugin
let g:webdevicons_enable = 1

" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1

" adding to vim-airline's tabline
" let g:webdevicons_enable_airline_tabline = 1

" adding to vim-airline's statusline
" let g:webdevicons_enable_airline_statusline = 1

" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 1

" use double-width(1) or single-width(0) glyphs
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 0

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" change the default character when no match found
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'

" set a byte character marker (BOM) utf-8 symbol when retrieving file encoding
" disabled by default with no value
let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''

" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" enable open and close folder/directory glyph flags (disabled by default with 0)
let g:DevIconsEnableFoldersOpenClose = 1

" enable pattern matching glyphs on folder/directory (enabled by default with 1)
let g:DevIconsEnableFolderPatternMatching = 1

" enable file extension pattern matching glyphs on folder/directory (disabled by default with 0)
let g:DevIconsEnableFolderExtensionPatternMatching = 0

" -----------------------
" SnipMate settings
" -----------------------
let g:snippets_dir='~/.local/share/nvim/plugged/vim-snippets/snippets/'

" ------------------------
" CtrlSpace - Fuzzy search
" ------------------------
if has("gui_running")
    let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
endif

" Require install silversearcher-ag
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif
" Colors
hi link CtrlSpaceNormal   PMenu
hi link CtrlSpaceSelected PMenuSel
hi link CtrlSpaceSearch   Search
hi link CtrlSpaceStatus   StatusLine
hi link CtrlSpaceSearch IncSearch
" We need this line to work around with neovim: https://github.com/vim-ctrlspace/vim-ctrlspace/issues/188<Paste>
let g:CtrlSpaceDefaultMappingKey = "<C-space> "
" Fuzzy Search
nnoremap <silent><C-p> :CtrlSpace O<CR>
" Automatically Saving Workspace
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

" ----------------------
" Fuzzysearch - fzf
" ----------------------
map ; :Files<CR>

" -----------------------
" Python
" -----------------------

" python executables for different plugins
let g:pymode_python='python3'

" lints
let g:pymode_lint=0

" virtualenv
" let g:pymode_virtualenv=1

" breakpoints
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'

" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
let g:pymode_syntax_builtin_types=g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
let g:pymode_syntax_docstrings=g:pymode_syntax_all

augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
    autocmd FileType python,rst,c,cpp set nowrap
    autocmd FileType python,rst,c,cpp set colorcolumn=80
augroup END

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'
let g:ale_sign_column_always=0
let g:ale_emit_conflict_warnings=0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0

let b:ale_linters = ['pylakes', 'flake8', 'pylint']
let g:ale_python_flake8_executable = 'python3'   " or 'python' for Python 2
let g:ale_python_flake8_options = '-m flake8'

imap <F5> <Esc>:w<CR>:!clear;python %<CR>

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

let g:go_version_warning = 0

" -----
" Goyo
" -----

" Start Goyo immediately when starting neovim/vim
auto VimEnter * Goyo
function! s:goyo_enter()
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
    silent! call lightline#enable()
endfunction

function! s:goyo_leave()
    " Quit Vim if this is the only remaining buffer
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if b:quitting_bang
            qa!
        else
            qa
        endif
    endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
