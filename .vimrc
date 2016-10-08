"
" VIMRC stewa02
"

"
" Colorscheme
"
set t_Co=256
"colorscheme wombat256
colorscheme buddy
let g:lightline = { 'colorscheme': 'wombat' }
"export TERM=xterm-256color

"
" Filetype
"
filetype on
filetype indent on
filetype plugin on
syntax enable

"
" Auto reload .vimrc/_vimrc
"
augroup Reload
autocmd!
autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
autocmd BufWritePost $MYVIMRC nested call lightline#update()
augroup END

"
" Settings
"
set number                              " Set linenumbers
set icon                                " Icon in GVim
set wrap                                " Wrap line if necessary
set wildmenu                            " Autocomplete in commandmode
set wildignore=*.o,*.dat,*.exe,*.com    " Exclude binaries from autocomplete
set wildmode=list:longest,full          " Bash-like preview on autocomplete
set infercase                           " Change completion to match case
set nomore                              " Kein More (global)
set hlsearch                            " Highlight all search results
set scrolloff=2                         " Show 2 more rows on scrolling
set sidescroll=5                        " Show 5 more columns in scrolling
set showcmd                             " CMD immer anzeigen
set showmatch                           " Highlight matching braces
set showmode                            " Show mode I'm in
set tabpagemax=15                       " Max. amount of tabpages
set showtabline=2                       " Always show tabline
set guitablabel=[%N]\ %t\ %M\ %X        " Label for tabpages
set guioptions-=e                       " use terminaltabline in gvim
set guioptions-=m                       " remove menu bar
set guioptions-=T                       " remove toolbar
set guioptions-=r                       " remove right-hand scroll bar
set guioptions-=L                       " remove left-hand scroll bar
set mousehide                           " Hide mouse while typing
set autowrite                           " Write before :next and :make
set hidden                              " Keep buffers hidden without saving
set cursorline                          " Show line of the cursor
set cursorcolumn                        " Show column of the cursor
highlight Cursor ctermbg=DarkGrey ctermfg=None
set colorcolumn=81                      " Show 81 column in red
highlight ColorColumn guibg=#B40404 ctermbg=red
set noerrorbells                        " Mute errorbells
set visualbell
set t_vb=
set list                                " Show tab characters
set listchars=nbsp:✖                    " U+2716 HEAVY MULTIPLICATION X
set listchars+=tab:»»                   " U+00BB DOUBLE ANGLE QUOTATION MARK
set listchars+=trail:•                  " U+2022 BULLET
"set listchars+=eol:¶                   " U+00B6 PILCROW SIGN
set listchars+=eol:↩                    " U+21A9 LEFTWARDS ARROW WITH HOOK
highlight NonText ctermbg=None guibg=NONE
highlight SpecialKey ctermbg=None guibg=NONE
highlight Comment cterm=italic          " Make terminal comments italic
set fillchars=vert:┃                    " U+2503 BOX DRAWINGS HEAVY VERTICAL
set ch=1                                " 1 line vim commandline
set complete-=i                         " disable includes for autocomplete
set completeopt=longest,menuone
if has("gui_running")
    set lines=999 columns=999           " keep GVim in fullscreen
    if has("win32")
        au GUIEnter * simalt ~x
    endif
endif
let &guioptions = substitute(&guioptions, "t", "", "g") " No cutting off menus
set linebreak                           " Do not break line within a word
set undolevels=999                      " Longer undo history
set history=999                         " Longer command history
set nocp                                " No compratible mode to vi
set mouse=a                             " Mouse support
set ruler                               " Show position of the cursor
set clipboard=unnamed                   " Use system clipboard
set backspace=2                         " Make backspace behave sane
set softtabstop=4                       " One tab is 4 spaces while editing
set tabstop=4
set shiftwidth=4
set expandtab                           " Simply replace tabs with spaces
set autoindent                          " Autoindent
set smartindent                         " Smart indenting
set ignorecase                          " Ignore case while searching
set smartcase                           " Don't ignore case if capitals incl.
set incsearch                           " Search for the pattern before <CR>
set ttyfast                             " fast connection
set formatoptions+=r                    " Autocomment
set formatoptions+=j                    " Delete comment char on join
set formatoptions+=n                    " Format numbered lists
set shellslash                          " Substitute backslashes w/ shellslash
set foldmethod=indent                   " Folding
set foldenable
set foldlevelstart=10
set foldnestmax=3
set omnifunc=syntaxcomplete#Complete    " Autocomplete using syntax
set lazyredraw                          " Don't redraw in macros -> faster
set copyindent
if v:version >= 800
    set breakindent                     " Breakindent for versions 8 and above
    set belloff=all                     " Turn all bells off with Vim 8 option
    set termguicolors                   " Use proper colours in terminal
endif
set splitright                          " Put new splits where they belong
set splitbelow
set printheader=%<%F%=Seite\ %N         " Printer settings
set printoptions=left:10pc,right:10pc,top:5pc,bottom:5pc,number:y
set viminfo=h,'500,<10000,s1000,/1000,:1000 " Make viminfo file remember more
set sessionoptions+=unix,slash          " Use shellslashes in sessions
if has("win32") || has("win16")         " Write backups in separate directory
    set backupdir=~/vimfiles/cache//    " and set path for swapfiles
    set directory=~/vimfiles/cache//
elseif has("unix") || has("linux")
    set backupdir=~/.vim/cache//
    set directory=~/.vim/cache//
endif
set backup                              " Actually turn backups on
set writebackup
set swapfile                            " Turn on swapfiles explicitly
if has("win32") || has("win16")         " Turn on persistent undo and
    set undodir=~/vimfiles/cache//      " set undo directory
elseif has("unix") || has("linux")
    set undodir=~/.vim/cache//
endif
set undofile                            " Actually turn on undofiles
set conceallevel=2                      " Replace certain characters with the
set concealcursor=nvc                   " proper symbol in normalmode
hi Conceal guibg=NONE guifg=white ctermbg=NONE ctermfg=white
set guifont=DejaVu\ Sans\ Mono          " Set the font for GVim
augroup numbering                       " Only show relative line numbers in 
autocmd!
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber
augroup END                             " in normal mode
let cobol_legacy_code=1                 " Enable useful defaults for COBOL
let g:netrw_liststyle=3                 " Make netrw a little more pleasant

"
" Statusline
"
set laststatus=2
hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222
set statusline=
set statusline+=%1*\ %n\ %*             " buffer number
set statusline+=%5*%{&ff}%*             " file format
set statusline+=%3*%y%*                 " file type
set statusline+=%4*\ %<%F%*             " full path
set statusline+=%2*%m%*                 " modified flag
set statusline+=%1*%=%5l%*              " current line
set statusline+=%2*/%L%*                " total lines
set statusline+=%1*%4v\ %*              " virtual column number
set statusline+=%2*0x%04B\ %*           " character under cursor

"
" Locale
"
set encoding=utf-8                      " Use UTF-8 encoding in buffers
setglobal fileencoding=utf-8            " Use UTF-8 encoding when writing file
set spelllang=de                        " Use German as spelllang
set spellsuggest=double,10              " Configure spelling suggestions

"
" Mappings
"
let mapleader="\<Space>"
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>e :tabnew<CR>:Explore<CR>
nnoremap <leader>n :nohl<CR>
" show different aspects of the with the buffer associated file
nnoremap <leader>fp :echo expand("%:p")<CR>
nnoremap <leader>fn :echo expand("%:t")<CR>
" Toggle folding
nnoremap <leader>f za
" Mappings for tabpages
nnoremap <F4> :tabn<CR>
nnoremap <F3> :tabp<CR>
" Mappings for movement between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Disable arrowkeys in normalmode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>
" Use visual lines for movement
nnoremap j gj
nnoremap k gk
" make Y behave like D and C
nnoremap Y y$
"inoremap <Down> <C-o>gj
"inoremap <Up> <C-o>gk
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>
inoremap <Left> <Nop>
" Use very-magic mode in regexes (Perl-like)
nnoremap / /\v
vnoremap / /\v
nnoremap Q <Nop>
" Indent with < and >
vnoremap < <gv
vnoremap > >gv
" Enter key for completion selection
inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" map omnicomp to jump to prev location
inoremap <C-o> <C-x><C-o>
" mappings for navigation in popup menu
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
" Don't jump to next match with * operator
nnoremap * *<C-o>

"
" Commands
"
command! WQ wq
command! Wq wq
command! W w
command! Q q

"
" Resize all splits when resizing the window
"
augroup Resize
autocmd!
autocmd VimResized * :wincmd =
augroup END

"
" Perl
"
augroup perl
autocmd!
autocmd BufNewFile,BufRead *.pl,*.pm,*.t  setlocal filetype=perl
autocmd FileType perl setlocal keywordprg=perldoc\ -f     " Perldoc for shift-K
autocmd FileType perl setlocal makeprg=perl\ -c\ %\ $*    " Set tool for :make
autocmd FileType perl setlocal comments=sl:#,mb:#,elx:#   " Autocomment chars
augroup END
let perl_include_pod = 1                " Plain Old Documentation
let perl_extended_vars = 1              " Highlight variable structures well
let perl_fold = 1                       " Perl specific folding
let perl_fold_blocks = 1

"
" Vimscript
"
augroup vimscript
autocmd!
autocmd FileType vim setlocal comments=sl:\",mb:\",elx:\"
augroup END

"
" Gnuplot
"
augroup gnuplot
autocmd!
autocmd BufNewFile,BufRead *.gp setlocal filetype=gnuplot
augroup END

"
" LaTEX and plain text files
"
augroup latex_and_plaintext
autocmd!
autocmd BufEnter,BufNewFile,BufRead *.txt,*.tex,mutt*,*.log setlocal nolist
autocmd BufEnter,BufNewFile,BufRead *.txt,*.tex,mutt*,*.log setlocal colorcolumn=
augroup END
let g:tex_conceal="adgms"               " Replace LaTeX with Unicode symbols
if has("win32")                         " Set texcompile.vim settings
    let g:tex_readerpath = 
        \'C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe'
    let g:tex_readerproc = 'AcroRd32.exe'
else
    let g:tex_readerpath = 'evince'
    let g:tex_readerproc = 'evince'
endif

"
" Markdown
"
augroup markdown
autocmd!
autocmd BufNewFile,BufRead,BufEnter *.md setlocal filetype=markdown
augroup END

"
" Create backup directory, if it doesn't exists
"
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif

"
" Colorizer
"
let g:colorizer_nomap = 1
if has("gui_running")
    augroup colorizer
    autocmd!
    autocmd VimEnter * ColorHighlight
    augroup END
endif

