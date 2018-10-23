"
" VIMRC stewa02
"

"
" First things first
"
set nocompatible                        " No compratible mode to vi
set encoding=utf-8                      " Use UTF-8 encoding in buffers
setglobal fileencoding=utf-8            " Use UTF-8 encoding when writing file

"
" Colorscheme
"
colorscheme buddy
let g:lightline = { 'colorscheme': 'buddy' }
if has("win32")
    let g:buddy_notermitalics = 1
endif

"
" Filetype
"
filetype plugin indent on
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
set relativenumber                      " And relative line numbering
set icon                                " Icon in GVim
set wrap                                " Wrap line if necessary
set wildmenu                            " Autocomplete in commandmode
set wildignore=*.o,*.dat,*.exe,*.com    " Exclude binaries from autocomplete
set wildmode=list:longest,full          " Bash-like preview on autocomplete
set infercase                           " Change completion to match case
set nomore                              " Kein More (global)
set hlsearch                            " Highlight all search results
set scrolloff=5                         " Show 2 more rows on scrolling
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
set colorcolumn=81                      " Show 81 column in red
set noerrorbells                        " Mute errorbells
set visualbell
set t_vb=
set list                                " Show tab characters
set listchars=nbsp:✖                    " U+2716 HEAVY MULTIPLICATION X
set listchars+=tab:»»                   " U+00BB DOUBLE ANGLE QUOTATION MARK
set listchars+=trail:•                  " U+2022 BULLET
"set listchars+=eol:¶                   " U+00B6 PILCROW SIGN
set listchars+=eol:↩                    " U+21A9 LEFTWARDS ARROW WITH HOOK
set fillchars=vert:┃                    " U+2503 BOX DRAWINGS HEAVY VERTICAL
set ch=1                                " 1 line vim commandline
"set complete-=i                         " disable includes for autocomplete
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
    if !has("win32") && !has("gui_running")
        set termguicolors               " Use proper colours in terminal
    endif
endif
set splitright                          " Put new splits where they belong
set splitbelow
set printheader=%<%F%=Seite\ %N         " Printer settings
set printoptions=left:10pc,right:10pc,top:5pc,bottom:5pc,number:y
set viminfo=h,'500,<10000,s1000,/1000,:1000 " Make viminfo file remember more
set sessionoptions+=unix,slash          " Use shellslashes in sessions
set backupdir=~/.vim/cache//,~/vimfiles/cache//
set directory=~/.vim/cache//,~/vimfiles/cache//
set backup                              " Actually turn backups on
set writebackup
set swapfile                            " Turn on swapfiles explicitly
set undodir=~/.vim/cache//,~/vimfiles/cache//
set undofile                            " Actually turn on undofiles
set conceallevel=2                      " Replace certain characters with the
set concealcursor=nvc                   " proper symbol in normalmode
set guifont=DejaVu\ Sans\ Mono          " Set the font for GVim
augroup numbering                       " Only show relative line numbers in 
autocmd!
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber
augroup END                             " in normal mode
let g:netrw_liststyle=3                 " Make netrw a little more pleasant
let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_browse_split=4
let g:netrw_altv=1

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
" Locale, spell checker and thesaurus
"
set spelllang=en                        " Use English as spelllang
set spellsuggest=double,10              " Configure spelling suggestions
" Include thesaurus files for German and English:
" German: https://www.openthesaurus.de/about/download
" English: http://www.gutenberg.org/ebooks/3202
set thesaurus+=~/.vim/thesaurus/de.txt,~/vimfiles/thesaurus/de.txt
set thesaurus+=~/.vim/thesaurus/en.txt,~/vimfiles/thesaurus/en.txt

"
" Mappings
"
let mapleader="\<Space>"
nnoremap <leader>e :Vexplore<CR>
nnoremap <leader>n :nohl<CR>
" show different aspects of the with the buffer associated file
nnoremap <leader>fp :echo expand("%:p")<CR>
nnoremap <leader>fn :echo expand("%:t")<CR>
" Toggle folding
nnoremap <leader><Space> za
" Mappings for movement between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Disable arrowkeys
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Right> <Nop>
inoremap <Left> <Nop>
" Mappings for tabpages and buffers
nnoremap <Right> :tabn<CR>
nnoremap <Left> :tabp<CR>
nnoremap <Down> :bn<CR>
nnoremap <Up> :bp<CR>
" Use visual lines for movement
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
" make Y behave like D and C
nnoremap Y y$
" Use very-magic mode in regexes (Perl-like)
" nnoremap / /\v
" vnoremap / /\v
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
" Spelling mappings
nnoremap <leader>de :set spelllang=de<CR>
nnoremap <leader>en :set spelllang=en<CR>
nnoremap <leader>sp z=
nnoremap <leader>ok zg
nnoremap <leader>st :set spell!<CR>
" Buffer management
nnoremap <leader>ls :ls!<CR>:buffer<Space>

"
" Resize all splits when resizing the window
"
augroup Resize
autocmd!
autocmd VimResized * :wincmd =
augroup END

"
" Filetypes
"
augroup Filetypes
autocmd!
autocmd BufNewFile,BufRead *.pl,*.pm,*.t  setlocal filetype=perl
autocmd BufNewFile,BufRead *.gp setlocal filetype=gnuplot
autocmd BufNewFile,BufRead,BufEnter *.md setlocal filetype=pandoc
augroup END

let g:tex_flavor="latex"

"
" Colorizer
"
if has("gui_running")
    let g:colorizer_nomap = 1
    augroup colorizer
    autocmd!
    autocmd SessionLoadPost * ColorHighlight
    augroup END
endif

"
" Skeletor
"
let g:skeletor_movement = {
                          \ "html": "9j",
                          \ "tex" : "26j",
                          \ }

