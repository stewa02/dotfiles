
" VIMRC stewa02

" Aussehen
set number                              " Zeilennummern einblenden
set icon                                " Icon im Grafik-Terminal

" Lightline
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }
"export TERM=xterm-256color

" Colorscheme
set t_Co=256
"colorscheme wombat256
colorscheme buddy

filetype on                             " Erkennen von Filetypen
filetype indent on
filetype plugin on
syntax enable

" Auto reload .vimrc/_vimrc
augroup Reload
autocmd!
autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
autocmd BufWritePost $MYVIMRC nested call lightline#update()
augroup END

set wrap                                " Lange Zeilen am Ende umbrechen
set wildmenu                            " Tabvervollstaendigen
set wildignore=*.o,*.dat,*.exe,*.com    " Ausnahmen des Tabvervollstaendigen
set wildmode=list:longest               " Bash-like autovervollstaendigen
set nomore                              " Kein More (global)
set hlsearch                            " Alle Suchergebnisse markieren
set scrolloff=2                         " sichtbare Zeilen beim scrollen
set sidescroll=5                        " sichtbare Spalten beim scrollen
set showcmd                             " CMD immer anzeigen
set showmatch                           " passende Zeichen highlighten
set showmode                            " Modus anzeigen
set tabpagemax=15                       " Maximale Tabs in Vim
set showtabline=2                       " Linie mit Tabs
set guitablabel=[%N]\ %t\ %M\ %X        " Tabbeschriftung
set guioptions-=e                       " use terminaltabline in gvim
set guioptions-=m                       " remove menu bar
set guioptions-=T                       " remove toolbar
set guioptions-=r                       " remove right-hand scroll bar
set guioptions-=L                       " remove left-hand scroll bar
set mousehide                           " Maus waehrend schreiben ausbl.
set autowrite                           " Speichern vor :next and :make
set hidden                              " Buffer verstecken wenn nicht benoetigt
if has("gui_running")
    set cursorline                          " Aktuelle Zeile hervorheben
    highlight  CursorLine ctermbg=DarkGrey ctermfg=None
    set cursorcolumn                        " Aktuelle Spalte hervorheben
    highlight  CursorColumn ctermbg=DarkGrey ctermfg=None
endif
highlight  Cursor ctermbg=DarkGrey ctermfg=None         " Color Cursor
set colorcolumn=81                      " Spaltenueberschreitung markieren
highlight ColorColumn guibg=#B40404 ctermbg=red
set noerrorbells                        " Error Toene ausschalten
set visualbell
set t_vb=
set list                                " Tabs mit Pipe anzeigen
set listchars=tab:\|\
set ch=1                                " VIM Commandline 1 Zeile
set complete-=i                         " disable includes for autocomplete
set completeopt=longest,menuone

if has("gui_running")
    set lines=999 columns=999           " keep GVim in fullscreen
    if has("win32")
        au GUIEnter * simalt ~x
    endif
endif
if has("win32")
    let &guioptions = substitute(&guioptions, "t", "", "g") " Kein Menueintraege entfernen
endif
set linebreak                           " Keine Zeilenumbrueche in Woertern
set undolevels=999                      " 999 Undo-Eintraege
set history=999                         " 999 Befehlshistoryeintraege

" Steuerung
set nocp                                " Kein Kompartibilitaetsmodus
set mouse=a                             " Maus aktivieren
set ruler                               " Position des Zeigers anzeigen
set clipboard=unnamed                   " Systemzwischenablage
set backspace=2                         " Loeschen ueber Zeilenende
set softtabstop=4                       " Darstellung des Tabs als 2 LZ
set tabstop=4                           " Anzahl LZ im Tab
set shiftwidth=4                        " Autoeinrueckung auf 4 LZ
set autoindent                          " Autoeinrueckung aktivieren
set smartindent                         " Verfahen beim Texteinzug
set ignorecase                          " Casesensitivitaet deakt.
set smartcase                           " Smarte Casesensivitaet
set incsearch                           " Sofortige Suche
set ttyfast                             " schnelle Verbindung
set formatoptions+=r                    " Aktivieren Autocomment
set shellslash                          " Keine Backslashes in CMD
set foldmethod=indent                   " Folding
set foldenable
set foldlevelstart=10
set foldnestmax=3
set expandtab
set omnifunc=syntaxcomplete#Complete    " Autokomplettierung basierend auf Sp.
set lazyredraw
set copyindent
if v:version >= 800
    set breakindent                     " Breakindent for versions 8 and above
endif


" Leader mappings
let mapleader="\<Space>"
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>e :tabnew<CR>:Explore<CR>
nnoremap <leader>n :nohl<CR>
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
"nnoremap / /\v
"vnoremap / /\v
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

" don't rage at me for typos
command! WQ wq
command! Wq wq
command! W w
command! Q q

" Keep splits evenly sized when window is resized (particularly in GVim)
augroup Resize
autocmd!
autocmd VimResized * :wincmd =
augroup END

" Statusline
set laststatus=2
hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222
set statusline =
set statusline +=%1*\ %n\ %*            " buffer number
set statusline +=%5*%{&ff}%*            " file format
set statusline +=%3*%y%*                " file type
set statusline +=%4*\ %<%F%*            " full path
set statusline +=%2*%m%*                " modified flag
set statusline +=%1*%=%5l%*             " current line
set statusline +=%2*/%L%*               " total lines
set statusline +=%1*%4v\ %*             " virtual column number
set statusline +=%2*0x%04B\ %*          " character under cursor

" Locale
set encoding=utf-8                      " Vim auf UTF-8
setglobal fileencoding=utf-8            " Mit Vim erstellte Files auf UTF-8
set spelllang=de                        " Rechtschreibpruefung auf DE
set spellsuggest=double,10              " Art und Anzahl Vorschlaege

" Perl
set comments=sl:#,mb:#,elx:#            " Autocomment fuer Perl etc.
augroup perl
autocmd!
autocmd FileType perl set keywordprg=perldoc\ -f   " Perldoc wenn K ueber Keyword
autocmd FileType perl set makeprg=perl\ -c\ %\ $*  " Perl Syntaxcheck wenn :make
autocmd FileType perl nmap <C-c> :w<CR>:make<CR>   " Mappings fuer Syntaxcheck
autocmd BufNewFile,BufRead *.pl  setf perl         " Highlighting GVIM
autocmd BufNewFile,BufRead *.pm  setf perl
autocmd BufNewFile,BufRead *.t   setf perl
augroup END
let perl_include_pod = 1                " Plain Old Documentation
let perl_extended_vars = 1              " Komplexe Variablenstrukturen
let perl_fold = 1                       " Perl-Folding
let perl_fold_blocks = 1

" Python
augroup python
autocmd!
autocmd BufNewFile,BufRead *.py  setf python         " Highlighting GVIM
autocmd FileType py set textwidth=79                 " PEP-8 (Max-Breite)
autocmd BufNewFile,BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufNewFile,BufRead *.py set nocindent        " Einruecken nach PY-Default
autocmd FileType python nmap <F5> :w<CR>:!python %<CR>:!pause<CR>" Mappings fuer direktes ausfuehren
augroup END

" Gnuplot files
augroup gnuplot
autocmd!
autocmd BufNewFile,BufRead *.gp setlocal filetype gnuplot
augroup END

" LaTEX
augroup latex_and_plaintext
autocmd!
autocmd BufEnter,BufNewFile,BufRead *.txt,*.tex,mutt*,*.log setlocal nolist
autocmd BufEnter,BufNewFile,BufRead *.txt,*.tex,mutt*,*.log setlocal colorcolumn=
augroup END
" Replace LaTeX commands with unicode symbols
set conceallevel=2
set concealcursor=nvc
hi Conceal guibg=NONE guifg=white ctermbg=NONE ctermfg=white
let g:tex_conceal="adgms"
" Patch font on MS Windows
if has("win32") && has("gui_running")
    set guifont=DejaVu\ Sans\ Mono
endif
" texcompile conf
if has("win32")
    let g:tex_readerpath = 
        \'C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe'
    let g:tex_readerproc = 'AcroRd32.exe'
else
    let g:tex_readerpath = 'evince'
    let g:tex_readerproc = 'evince'
endif

" Markdown
augroup markdown
autocmd!
autocmd BufNewFile,BufRead,BufEnter *.md setf markdown
augroup END

" Drucker
set printheader=%<%F%=Seite\ %N
set printoptions=left:10pc,right:10pc,top:5pc,bottom:5pc,number:y

" Security
set viminfo='1000,f1
set sessionoptions+=unix,slash
set backup
" backup and swapdirectory
if has("win32") || has("win16")
    set backupdir=~/vimfiles/cache//
    set directory=~/vimfiles/cache//
elseif has("unix") || has("linux") || has("mac") || has("macunix")
    set backupdir=~/.vim/cache//
    set directory=~/.vim/cache//
endif
set writebackup
if has('persistent_undo')
    " undo directory
    if has("win32") || has("win16")
        set undodir=~/vimfiles/cache//
    elseif has("unix") || has("linux") || has("mac") || has("macunix")
        set undodir=~/.vim/cache//
    endif
    set undofile
endif

" Create backup directory, if it doesn't exists
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif

" Anderer Mist
let cobol_legacy_code=1
if has("win32") || v:version >= 800
    augroup numbering
    autocmd!
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
    augroup END
endif
" make netrw more pleasant without filling your entire HDD with NERDTree
let g:netrw_liststyle=3

" Colorizer
let g:colorizer_nomap = 1
"ColorHighlight ColorClear and ColorToggle
if has("gui_running")
    augroup colorizer
    autocmd!
    autocmd VimEnter * ColorHighlight
    augroup END
endif

