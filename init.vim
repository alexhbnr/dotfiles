" Vundle
set rtp^=~/.config/nvim
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()
call vundle#rc('~/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'
" GitHub plugins
" Color scheme
Plugin 'frankier/neovim-colors-solarized-truecolor-only' " Solarized color scheme
" General purpose plugins
Plugin 'Raimondi/delimitMate' " Automatic closing of brackets, quotes etc.
Plugin 'ncm2/ncm2' " Completion manager
Plugin 'roxma/nvim-yarp' " Remote plugin installer
Plugin 'ncm2/ncm2-bufword' " Completion from the current buffer
Plugin 'ncm2/ncm2-tmux' " Completion from other tmux panes
Plugin 'ncm2/ncm2-path' " Completion from paths
Plugin 'ncm2/ncm2-jedi' " Completion for python
Plugin 'neomake/neomake' " Run programs asynchronously e.g. Python linters
Plugin 'scrooloose/nerdcommenter' " Commenting functions
Plugin 'Vigemus/iron.nvim' " REPL commands for terminal buffer
Plugin 'godlygeek/tabular' " Aligning text functions
Plugin 'SirVer/ultisnips' " Snippet manager
Plugin 'tpope/vim-fugitive' " Git wrapper
Plugin 'airblade/vim-gitgutter' " Shows git diff in sign column
Plugin 'simnalamburt/vim-mundo' " Plugin to visualise the Undo tree
Plugin 'pgilad/vim-skeletons' " Quickly scaffold template files
" Plugin 'gabrielelana/vim-markdown' " Markdown highlighting
Plugin 'vim-pandoc/vim-pandoc-syntax' " advanced Markdown highlighting
Plugin 'w0rp/ale' " syntax checker
" R language
Plugin 'gaalcaras/ncm-R' " Asynchronous completion of the R language
Plugin 'jalvesaq/Nvim-R' " Enables R code
" Distraction-free writing
Plugin 'junegunn/limelight.vim' " Fades colors of paragraphs out of focus
Plugin 'junegunn/goyo.vim' " Removes distraction
Plugin 'ron89/thesaurus_query.vim' " Access to Manwholikespie's thesaurus
Plugin 'reedes/vim-wordy' " Uncover usage problems during writing
" Python
Plugin 'davidhalter/jedi-vim' " Python autocompletion with docstrings
Plugin 'ivan-krukov/vim-snakemake' " Syntax highlighting for snakemake
Plugin 'szymonmaszke/vimpyter' " Jupyter Notebook access
" Julia
Plugin 'JuliaEditorSupport/julia-vim'
" Previously used plugins
" Plugin 'LaTeX-Box-Team/LaTeX-Box'
" Plugin 'tpope/tpope-vim-abolish'
" Plugin 'tpope/vim-repeat'
" Plugin 'tpope/vim-unimpaired'
" Plugin 'benmills/vimux'
" Plugin 'vimwiki/vimwiki'
" Plugin "rhysd/vim-grammarous" alternative vim-wordy
" Plugin 'Valloric/YouCompleteMe' " Completion manager
call vundle#end()
filetype plugin indent on

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Basic behaviour changes "
set hidden
set number
set ruler
set mouse=a
set nowrap        " don't wrap lines
set ts=4 sts=4 expandtab     " a tab is four spaces
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
" removes search highlighting when pressing <ESC>
nnoremap <F3> :set hlsearch!<CR>
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
" no backup or swap files "
set nobackup
set noswapfile
" enable spell checking for english
nmap <leader>sc :setlocal spell spelllang=en_gb<CR>

" enter PASTE mode for allowing pasting with mouse "
set pastetoggle=<F2>
" copies text into the global clipboard "
set clipboard=unnamed

" Enabling solarized scheme
set termguicolors
set background=dark " dark scheme
" set background=light " light scheme
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

" Key mapping for toggling Gundone
nnoremap <F5> :MundoToggle<CR>
let g:mundo_prefer_python3=1

" Vimcasts.org tips
" Change symbol of invisible characters
set listchars=tab:▸\ ,eol:¬
" Change intendation to the keymapping of Textmate
nmap <Leader>[ <<
nmap <Leader>] >>
vmap <Leader>[ <gv
vmap <Leader>] >gv
" Make it easier to open multiple files in the same vim window
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
" Allow moving text line up and down by one line
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" " Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" Interactive substitutions
set inccommand=nosplit

" NeoVim Terminal Mode
:tnoremap <Esc> <C-\><C-n>

" NeoVim NeoTerm
"let g:neoterm_default_mod = 'belowright'
"let g:neoterm_automap_keys = ',tt'

"nnoremap <silent> ,t :TREPLSendLine<CR>
"vnoremap <silent> ,t :TREPLSendSelection<CR>
"vnoremap <silent> ,ls "+y <C-W>l a %paste <CR>

" Useful maps
" open terminal
"nnoremap <silent> ,to :Topen<CR>
" toggle terminal
"nnoremap <silent> ,tv :Ttoggle<CR>
" hide/close terminal
"nnoremap <silent> ,th :call neoterm#close()<CR>
" clear terminal
"nnoremap <silent> ,tl :call neoterm#clear()<CR>
" kills the current job (send a <c-c>)
"nnoremap <silent> ,tc :call neoterm#kill()<CR>

" NeoVim NeoMake
" neomake is async => it doesn't block the editor
" It's a syntastic alternative. Syntastic was slow for me on python files.
" $ sudo pip2/pip3 install flake8 -U
" $ sudo pip2/pip3 install vulture -U
"let g:neomake_python_enabled_makers = ['flake8', 'pep8', 'vulture']
let g:neomake_python_enabled_makers = ['flake8', 'pydocstyle']
" E501 is line length of 80 characters
let g:neomake_python_flake8_maker = { 'args': ['--ignore=E115,E266,E501'], }
let g:neomake_python_pep8_maker = { 'args': ['--max-line-length=120', '--ignore=E115,E266'], }
" R
let g:neomake_r_lintr_maker = {
    \ 'exe': 'R',
    \ 'args': ['-e lintr::lint("%:p")'], 
    \ 'errorformat': 
        \ '%W%f:%l:%c: style: %m,' .
        \ '%W%f:%l:%c: warning: %m,' .
        \ '%E%f:%l:%c: error: %m,'
    \ }
let g:neomake_r_enabled_makers = ['lintr']

" run neomake on the current file on every write:
autocmd! BufWritePost * Neomake

" NeoVim Nvim-R
let R_assign = 0
let R_rconsole_width = 0
let R_pdfviewer = "evince"
" Custom mappings for R functions
map <silent> \xh :call RAction("head")<CR>
map <silent> \xo :call RAction("class")<CR>

" Limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" Default: 0.5
let g:limelight_default_coefficient = 0.7
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1
" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" Vim skeletons
let skeletons#autoRegister = 1
let skeletons#skeletonsDir = "~/.config/nvim/skeletons"

" Set up Python programs
let g:python2_host_prog = '/Users/huebner/miniconda3/envs/py27/bin/python'
let g:python3_host_prog = '/Users/huebner/miniconda3/bin/python'

" Iron.nvim
" deactivate default mappings
let g:iron_map_defaults=0
luafile $HOME/.config/nvim/plugins.lua
" define custom mappings for the python filetype
augroup ironmapping
    autocmd!
    autocmd Filetype python nmap \l :lua require("iron").core.send_line()<CR>
    autocmd Filetype python vmap \l :lua require("iron").core.visual_send()<CR>
    autocmd Filetype julia nmap \l :lua require("iron").core.send_line()<CR>
    autocmd Filetype julia vmap \l :lua require("iron").core.visual_send()<CR>
augroup END

" DelimitMate
au FileType rmd let b:delimitMate_matchpairs = "(:),[:],{:}"

" Ncm2
" Use <TAB> to select the popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANTE: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" enable debugging for ncm_yarp
let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_PYTHON_LOG_LEVEL="DEBUG"

