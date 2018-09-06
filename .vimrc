" Vundle
set rtp^=~/.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
call vundle#rc('~/.vim/bundle/')
Plugin 'VundleVim/Vundle.vim'
" GitHub plugins
" Color scheme
Plugin 'frankier/neovim-colors-solarized-truecolor-only' " Solarized color scheme
" General purpose plugins
Plugin 'Raimondi/delimitMate' " Automatic closing of brackets, quotes etc.
Plugin 'ncm2/ncm2' " Completion manager
Plugin 'scrooloose/nerdcommenter' " Commenting functions
Plugin 'godlygeek/tabular' " Aligning text functions
Plugin 'SirVer/ultisnips' " Snippet manager
Plugin 'tpope/vim-fugitive' " Git wrapper
Plugin 'airblade/vim-gitgutter' " Shows git diff in sign column
Plugin 'simnalamburt/vim-mundo' " Plugin to visualise the Undo tree
Plugin 'pgilad/vim-skeletons' " Quickly scaffold template files
" Distraction-free writing
Plugin 'junegunn/limelight.vim' " Fades colors of paragraphs out of focus
Plugin 'junegunn/goyo.vim' " Removes distraction
Plugin 'ron89/thesaurus_query.vim' " Access to Manwholikespie's thesaurus
Plugin 'reedes/vim-wordy' " Uncover usage problems during writing
" Previously used plugins
" Plugin 'LaTeX-Box-Team/LaTeX-Box'
" Plugin 'kassio/neoterm' " REPL commands for terminal buffer
" Plugin 'tpope/tpope-vim-abolish'
" Plugin 'tpope/vim-repeat'
" Plugin 'tpope/vim-unimpaired'
" Plugin 'benmills/vimux'
" Plugin 'vimwiki/vimwiki'
" Plugin 'Valloric/YouCompleteMe'
" Plugin "rhysd/vim-grammarous" alternative vim-wordy
call vundle#end()
filetype plugin indent on

set guifont=Menlo:h14

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
let g:python2_host_prog = '/Users/huebner/.pyenv/versions/2.7.15/bin/python'
let g:python3_host_prog = '/Users/huebner/.pyenv/versions/3.7.0/bin/python'

" DelimitMate
au FileType rmd let b:delimitMate_matchpairs = "(:),[:],{:}"
