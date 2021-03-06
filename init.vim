""""""""""""""""""""""""""""""""""""
" Vim Configuration
" Last Updated: Apr 26, 2021
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

if has("nvim")
	call plug#begin(expand('~/.config/nvim/plugged/'))
else
	call plug#begin(expand('~/.vim/plugged/'))
endif

" General
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'xolox/vim-misc'
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/auto-pairs-gentle'

" Searching / File browsing
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Visuals
Plug 'lifepillar/vim-solarized8' " Solarized colorscheme
Plug 'itchyny/lightline.vim' " Status line

" Misc
" Highlight trailing whitespace
Plug 'bronson/vim-trailing-whitespace'

" Auto completion
Plug 'ervandew/supertab'

" Neomake can perform any task automatically and asynchronously
" Very powerful for build tools
" Plug 'neomake/neomake'

" if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
" endif

" Filetype specific plugins
"""""""""""""""""""""""""""

" HTML/CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" Markdown
Plug 'tpope/vim-markdown'

" CSV
Plug 'chrisbra/csv.vim'

" Rust
Plug 'rust-lang/rust.vim'

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

" Allows status line to always appear
set laststatus=2

let g:lightline = {}
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'readonly', 'relativepath', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
let g:lightline.mode_map = {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'V-LINE',
    \ "\<C-v>": 'V-BLOCK',
    \ 'c' : 'CMD',
    \ 's' : 'SELECT',
    \ 'S' : 'S-LINE',
    \ "\<C-s>": 'S-BLOCK',
    \ 't': 'TERM',
    \ }

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

" Auto completion rules
" Only insert the longest common text
" Show the menu also when there is only one match
set completeopt=longest,menuone,preview,noinsert
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

let g:deoplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""
" Colors and fonts
""""""""""""""""""""""""""""""""""""

syntax on
colorscheme solarized8
set background=dark
set t_Co=256
let g:solarized_use16 = 1

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

""" Session
let g:session_autosave='yes'
let g:session_autosave_to='autosave'
let g:session_autosave_periodic='2'
let g:session_autosave_silent=1
let g:session_default_to_last=1
let g:session_autoload = 'no'

" Fuzzy finding

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc.
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything
"         in the .git/ folder and CVS/ folder)
" --color: Search color options

if executable('rg')
	command! -bang -nargs=* Ripgrep call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!CVS/*" 2> /dev/null '.shellescape(<q-args>), 1, <bang>0)
	" --color "always"
endif

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
" autocmd! BufWritePost * Neomake

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Allow escaping from terminal using <C-(HJKL)>>
if has("nvim")
	tnoremap <C-J> <C-\><C-n><C-W>j
	tnoremap <C-K> <C-\><C-n><C-W>k
	tnoremap <C-L> <C-\><C-n><C-W>l
	tnoremap <C-H> <C-\><C-n><C-W>h
endif

" Switch buffers more easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use ; instead of : for commands
nnoremap : ;
nnoremap ; :

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


"
" Leader mappings
"

" Reload vim config file
nnoremap <Leader>` :source $MYVIMRC<CR>

" Delete trailing whitespace
nnoremap <Leader>d<space> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR><C-O>

" Delete Windows line endings
nnoremap <Leader>d$ :%s/\r//g<CR><C-O>

" Get rid of highlighting
nnoremap <Leader><space> :noh<CR>

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
nnoremap <Leader>f :Files<CR>
if executable('ag')
	nnoremap <Leader>g :Ag<CR>
endif
if executable('rg')
	nnoremap <Leader>g :Ripgrep<CR>
endif
nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>T :BTags<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>C :Commands<CR>
nnoremap <Leader>M :Maps<CR>

""""""""""""""""""""""""""""""""""""
" Language specific
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
" Computer specific
""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
" Overrides (hacks)
""""""""""""""""""""""""""""""""""""

" This shouldn't belong here, something is messing it up
colorscheme solarized8
