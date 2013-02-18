" Author: Fabiano Beselga Pereira
" Start Date: August 8th 2012 around 11am
" Description: After getting tired of using a lot configuration being done by other vimrc files
"              I decided to create my own vimrc from scratch with the objectives of having more
"              control of the features and add plugins and customization on demand

" pathtogen call https://github.com/tpope/vim-pathogen/
call pathogen#infect()

" Syntax highlight is needed to enjoy life
syntax on

set t_Co=256
"set background=dark
set background=light
colorscheme solarized

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" USABILITY -------------------------------------

"add some line space for easy reading
set linespace=4

" Use case insensitive search, except when using capital letters
set ignorecase

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" " While this behaviour deviates from that of Vi, it does what most users
" " coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" " line of a window
set ruler

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Enable use of the mouse for all modes
set mouse=a

" Display line numbers on the left
set number

" IDENTATION -----------------------------------

" Indentation settings for using 2 spaces instead of tabs.
" " Do not change 'tabstop' from its default value of 8 with this setup.
set ts=2 sw=2 sts=2
set expandtab

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" " next search
nnoremap <C-L> :nohl<CR><C-L>

" MAPPINGS --------------------------------------

" Mapping <tab> to change navigate on tabs
nmap <tab> :tabnext<CR>
" Mapping control + <tab> to go to the previous tab
nmap <S-tab> :tabprevious<CR>

" map to make it use to use zenconding
map! <C-Z>, <C-Y>,

" fuzzy finder shortcut to search for all files from the current folder until
" its subdirectories
map <leader>t :FufFile **/<CR>

" map leader p to open or close nerd tree
silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>


" BOOT
" open a NERDTree automatically when vim starts up if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif

" FOLDING
"set foldmethod=expr
"set foldexpr=getline(v:lnum)=~'^\\s*#'
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" max of open tabs opened
set tabpagemax=100


" Blank spaces killer
" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd WinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" Run to clean them all
command FixSpaces %s/\s\+$/

" reload the file on changes
set autoread
