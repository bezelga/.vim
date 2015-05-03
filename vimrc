" Author: Fabiano Beselga Pereira
" Start Date: August 8th 2012 around 11am
" Description: After getting tired of using a lot configuration being done by other vimrc files
"              I decided to create my own vimrc from scratch with the objectives of having more
"              control of the features and add plugins and customization on demand

" pathtogen call https://github.com/tpope/vim-pathogen/
"exec pathogen#infect()

" Syntax highlight is needed to enjoy life
syntax on

set t_Co=256
set background=light
"set background=dark

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

"Vundle
filetype off "required by vundle
set rtp+=~/.vim/bundle/vundle/
set runtimepath+=$GOROOT/misc/vim
call vundle#rc() "call bundle
set colorcolumn=100

Bundle 'gmarik/vundle'

" PLUGINS
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'elzr/vim-json'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'thoughtbot/vim-rspec'
Bundle 'godlygeek/tabular'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tpope/vim-ragtag'
Bundle 'scrooloose/syntastic'
Bundle 'elixir-lang/vim-elixir'
Bundle 'ervandew/supertab'
Bundle "ekalinin/Dockerfile.vim"
" END PLUGINS

colorscheme solarized
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


" Rails.vim custom navigation commands
" :Rservice
"autocmd User Rails Rnavcommand service app/services -suffix=_service.rb

"" :Rpresenter
"autocmd User Rails Rnavcommand presenter app/presenters -suffix=_presenter.rb

"" :Rworker
"autocmd User Rails Rnavcommand worker app/workers -suffix=_worker.rb

"" :Rcalculation
"autocmd User Rails Rnavcommand calculation app/calculations -suffix=_calculation.rb

" :use F5 to test the current file with Rspec
nmap <F5> :!rspec %<CR>
map <F5> :!rspec %<CR>

" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rspec_command = "!bundle exec rspec --color {spec}"

set clipboard=unnamed


"easy motion leader
"let g:EasyMotion_leader_key = '<Leader>'

" copy and cut to clipboard
vmap <C-c> :w !pbcopy<CR><CR>
vmap <C-x> :!pbcopy<CR>

set pastetoggle=<Leader>g

autocmd BufNewFile,BufRead Gemfile set filetype=ruby


" JS linter:
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_scss_checkers = ['scss_lint']

"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
