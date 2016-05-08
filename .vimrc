
" VIMRC stewa02

" Aussehen
set number                              " Zeilennummern einblenden
set icon                                " Icon im Grafik-Terminal

" Lightline
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ }
"export TERM=xterm-256color
"if !has('gui_running')
"    set t_Co=256
"endif

" Colorscheme madness for crossplatform support
if has("win32")
    if has("gui_running")
        colorscheme buddy
    else
        colorscheme desert
    endif
else
    set t_Co=256
    "colorscheme buddy 
    "colorscheme torte
    colorscheme wombat256
    "colorscheme jellybeans
    "let g:jellybeans_use_lowcolor_black = 0
    "let g:jellybeans_use_term_italics = 1
endif
"syntax on
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
"set background=dark                     " Hintergrund dunkel
"set columns=85                         " Maximale Spaltenbreite
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
" Enter key for completion selection
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" map omnicomp to jump to prev location
inoremap <C-o> <C-x><C-o>
" mappings for navigation in popup menu
inoremap <expr> <C-j>     pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k>       pumvisible() ? "\<C-p>" : "\<C-k>"

if has("gui_running")                   " GUI-Optionen
    set lines=999 columns=999           " Fullscreen
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
if has("mouse")
    set mouse=a                         " Maus aktivieren
endif
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
" Mappings fuer Tabpages
nmap <F4> :tabn<CR>
nmap <F3> :tabp<CR>
nmap <C-e> :tabnew<CR>:Explore<CR>      " Fileexplorer
nnoremap <F2> zi                        " Mappings fuer Folding
nnoremap <F1> za
set omnifunc=syntaxcomplete#Complete    " Autokomplettierung basierend auf Sp.
nnoremap <C-J> <C-W><C-J>               " Splits
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Disable arrowkeys in normalmode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Right> <Nop>
nnoremap <Left> <Nop>
" Use visual lines for movement
"nnoremap j gj
"nnoremap k gk
set expandtab

" Statusline
set laststatus=2
hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222
set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor

" Lokalisierung
set encoding=utf-8                      " Vim auf UTF-8
setglobal fileencoding=utf-8            " Mit Vim erstellte Files auf UTF-8
set spelllang=de                        " Rechtschreibpruefung auf DE
set spellsuggest=double,10              " Art und Anzahl Vorschlaege

" Perl
source ~/perltools.vim
set comments=sl:#,mb:#,elx:#            " Autocomment fuer Perl etc.
augroup perl
    autocmd!
    autocmd FileType perl set keywordprg=perldoc\ -f                    " Perldoc wenn K ueber Keyword
    autocmd FileType perl noremap K :!perldoc -f <cword> <bar><bar> perldoc <cword><cr>
    autocmd FileType perl set makeprg=perl\ -c\ %\ $*                   " Perl Syntaxcheck wenn :make
    autocmd FileType perl nmap <F5>  :PerlRunScript<CR>                 " Mappings fuer direktes ausfuehren
    autocmd FileType perl nmap <C-t> :PerlRunTests<CR>                  " Mappings fuer Tests
    autocmd FileType perl nmap <C-c> :w<CR>:make<CR>                    " Mappings fuer Syntaxcheck
    au BufNewFile,BufRead *.pl  setf perl   " Highlighting GVIM
    au BufNewFile,BufRead *.pm  setf perl
    au BufNewFile,BufRead *.t   setf perl
augroup END
let perl_include_pod = 1                " Plain Old Documentation
let perl_extended_vars = 1              " Komplexe Variablenstrukturen
let perl_fold = 1                       " Perl-Folding
let perl_fold_blocks = 1

" Python
augroup python
    autocmd!
    au BufNewFile,BufRead *.py  setf python         " Highlighting GVIM
    au FileType py set textwidth=79                 " PEP-8 (Max-Breite)
    au BufNewFile,BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    au BufNewFile,BufRead *.py set nocindent        " Einruecken nach PY-Default
    autocmd FileType python nmap <F5> :w<CR>:!python %<CR>:!pause<CR>" Mappings fuer direktes ausfuehren
augroup END

" Schreibfehler abfangen
command! WQ wq
command! Wq wq
command! W w
command! Q q

" Drucker
set printheader=%<%F%=Seite\ %N
set printoptions=left:10pc,right:10pc,top:5pc,bottom:5pc,number:y

" Session-Management
"set viminfo=string
set viminfo='1000,f1
set sessionoptions+=unix,slash
fu! SaveSess()
    execute 'mksession! ~/vimcache/session.vim'
endfunction

fu! RestoreSess()
execute 'so ~/vimcache/session.vim'
"if bufexists(1)
    "for l in range(1, bufnr('$'))
        "if bufwinnr(l) == -1
            "exec 'sbuffer ' . l
        "endif
    "endfor
"endif
endfunction
augroup session
    autocmd!
    autocmd VimLeave * call SaveSess()
    autocmd VimEnter * call RestoreSess()
augroup END

" Anderer Mist
if empty(glob("~/vimcache"))
    silent call mkdir("~/vimcache")
endif
let cobol_legacy_code=1
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"backspace=start,indent,eol
"au BufNew * setlocal linebreak
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
set backup
"set backupskip=/tmp/*
set backupdir=~/vimcache                " Backupdir
set directory=~/vimcache                " Swapfiles
set writebackup
set lazyredraw
set copyindent
if has('persistent_undo')
    set undodir=~/vimcache              " Undodir
    set undofile
endif
nnoremap Q <Nop>                        " Ex Mode deaktiviert
if has("win32")
    augroup numbering
    autocmd!
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
    "autocmd VimEnter * :set relativenumber
    augroup END
endif
" Indent with < and >
vnoremap < <gv
vnoremap > >gv

" Colorizer
"let g:colorizer_fgcontrast = -1
let g:colorizer_nomap = 1
"ColorHighlight ColorClear and ColorToggle
if has("gui_running")
    augroup colorizer
    autocmd!
    autocmd VimEnter * ColorHighlight
    augroup END
endif

" FTP
fu! ConnFTP()
    let ftp_user = '<>'
    let ftp_host = '<>'
    tabnew
    edit 'ftp://'.ftp_user.'@'.ftp_host.'//'
endfunction
nmap <F8> :call ConnFTP()<CR>

" LaTEX
source ~/texcompile.vim
augroup latex
    autocmd!
    autocmd FileType tex nmap <F5> :TEXCompile<CR>
    autocmd BufEnter *.txt setlocal nolist
    autocmd BufEnter *.tex setlocal nolist
    autocmd BufEnter *.tex setlocal colorcolumn=
    autocmd BufEnter *.txt setlocal colorcolumn=
    autocmd BufEnter *.log setlocal colorcolumn=
augroup END
if has("win32") && has("gui_running")
    " Patch font
    set guifont=DejaVu\ Sans\ Mono
    " Replace LaTeX commands with unicode symbols
    " set conceal
    set conceallevel=2
    set concealcursor=nvc
    hi Conceal guibg=NONE guifg=white
    let g:tex_conceal="adgms"
endif
if !has("win32")
    " Replace LaTeX commands with unicode symbols
    " set conceal
    set conceallevel=2
    set concealcursor=nvc
    hi Conceal guibg=NONE guifg=white ctermbg=NONE ctermfg=white
    let g:tex_conceal="adgms"
endif

" Markdown
augroup markdown
    autocmd!
    autocmd BufNewFile,BufRead *.md setf markdown
augroup END

