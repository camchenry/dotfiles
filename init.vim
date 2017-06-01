""""""""""""""""""""""""""""""""""""
" Vim Configuration
" Last Updated: May 16, 2017
""""""""""""""""""""""""""""""""""""

" Make vim incompatible with vi
set nocompatible

""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""
" Automatically install vim-plug if it does not exist
if has("nvim")
	let vimplug_exists = expand('~/.config/nvim/autoload/plug.vim')

	if !filereadable(vimplug_exists)
		echo "Installing Vim-Plug..."
		echo ""
		silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

		autocmd VimEnter * PlugInstall | source $MYVIMRC
	endif
else
	let vimplug_exists = expand('~/.vim/autoload/plug.vim')

	if !filereadable(vimplug_exists)
		echo "Installing Vim-Plug..."
		echo ""
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

		autocmd VimEnter * PlugInstall | source $MYVIMRC
	endif
endif

call plug#begin(expand('~/.config/nvim/plugged/'))

" General
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'xolox/vim-misc'
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/auto-pairs-gentle'

" Searching / File browsing
Plug 'scrooloose/nerdTree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Visuals
Plug 'lifepillar/vim-solarized8' " Solarized colorscheme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Misc
" Highlight trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

" Neomake can perform any task automatically and asynchronously
" Very powerful for build tools
Plug 'neomake/neomake'

" Filetype specific plugins
"""""""""""""""""""""""""""

" PHP
Plug 'stanangeloff/php.vim'
Plug 'shawncplus/phpcomplete.vim'

" Lua
Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-lua-inspect'

" HTML/CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" Markdown
Plug 'tpope/vim-markdown'

" CSV
Plug 'chrisbra/csv.vim'

call plug#end()

" Enable filetype plugins and different indentation for filetypes
filetype plugin indent on

""""""""""""""""""""""""""""""""""""
" User interface
""""""""""""""""""""""""""""""""""""

" Set leader key
let mapleader=","

" Make backspace work as expected
set backspace=indent,eol,start
" Make H and L wrap to next/prev line
set whichwrap+=<,>,h,l

" Line numbering
set number
set relativenumber
set cursorline

" Allows airline to appear
set laststatus=2

" Show last command run
" (Conflicts with airline)
set showcmd

" Highlight search results
set hlsearch
" Incremental search
set incsearch
" Search ignores case
set ignorecase
" .. unless the pattern has caps in it
set smartcase

" Enabling this will make the tab key (in insert mode) insert spaces or tabs to
" go to the next indent of the next tabstop when the cursor is at the beginning
" of a line (i.e. the only preceding characters are whitespace).
set smarttab
" Enabling this will make the tab key (in insert mode) insert spaces instead
" of tab characters. This also affects the behavior of the retab command.
set expandtab
" The size of an "indent". It's also measured in spaces, so if your code base
" indents with tab characters then you want shiftwidth to equal the number of
" tab characters times tabstop. This is also used by things like the =, > and
" < commands.
set shiftwidth=4
" The width of a hard tabstop measured in "spaces"
" effectively the (maximum) width of an actual tab character.
set tabstop=4
" Setting this to a non-zero value other than tabstop will make the tab key (in
" insert mode) insert a combination of spaces (and possibly tabs) to simulate
" tab stops at this width.
set softtabstop=4

" Auto indent
set ai
" Line wrapping
set wrap
" Smart indent
set breakindent

" Always show n lines around the current line
set so=7

if has("gui_running")
	" (GUI) Set gvim options, disabling all the annoying things about it
	set go=egmt

	" (GUI) Set mouse to console mode (disable)
	set mouse=c

	" (GUI) Suppress errors
	set noerrorbells
	set novisualbell
	set t_vb=
	set tm=500
endif

""""""""""""""""""""""""""""""""""""
" Colors and fonts
""""""""""""""""""""""""""""""""""""

syntax on
colorscheme solarized8_dark
set background=dark
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_visibility="low"

let g:airline_powerline_fonts = 0


""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

" Vim only
if !has("nvim")
	" Change where swap files are stored
	set directory=~/.vim/swap//
	set undodir=~/.vim/undo//
endif

set tags=./tags;,tags;
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Whitespace chars
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:⎵,trail:·
set showbreak=↪\ 
set fillchars+=vert:│
match ErrorMsg '\s\+$'

" Whitespace highlights
highlight Whitespace ctermfg=10 guifg=#4a4a59
highlight NonText ctermfg=10 guifg=#4a4a59

" 80 character limit highlight
if exists('+colorcolumn')
	set colorcolumn=80
end

""""""""""""""""""""""""""""""""""""
" Macros, remaps
""""""""""""""""""""""""""""""""""""

" map {lhs} {rhs}
"
"    Map the key sequence {lhs} to {rhs} for the modes
"    where the map command applies.  The result, including
"    {rhs}, is then further scanned for mappings.  This
"    allows for nested and recursive use of mappings.

" remap {lhs} {rhs}
"
"    Map the key sequence {lhs} to {rhs} for the modes
"    where the map command applies.  Disallow mapping of
"    {rhs}, to avoid nested and recursive mappings.  Often
"    used to redefine a command.

" unmap {lhs}
"
"    Remove the mapping of {lhs} for the modes where the
"    map command applies.  The mapping may remain defined
"    for other modes where it applies.

" Map modes
"<Space>    Normal, Visual, Select and Operator-pending
"    n        Normal
"    v        Visual and Select
"    s        Select
"    x        Visual
"    o        Operator-pending
"    !        Insert and Command-line
"    i        Insert
"    l        ":lmap" mappings for Insert, Command-line and Lang-Arg
"    c        Command-line

" Auto-run neomake
autocmd! BufWritePost * Neomake

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Terminal emulator remaps

tnoremap <C-J> <C-\><C-n><C-W>j
tnoremap <C-K> <C-\><C-n><C-W>k
tnoremap <C-L> <C-\><C-n><C-W>l
tnoremap <C-H> <C-\><C-n><C-W>h

" Switch buffers more easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use ; instead of : for commands
nnoremap : ;
nnoremap ; :

" Copy to clipboard
vnoremap <leader>y  "+y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Fuzzy finding
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>g :Ag<CR>
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>T :BTags<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nnoremap <Leader>` :source $MYVIMRC<CR>

""""""""""""""""""""""""""""""""""""
" Language specific
""""""""""""""""""""""""""""""""""""

" TODO
set expandtab
