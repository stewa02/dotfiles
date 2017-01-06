" Vim colorscheme - buddy.vim
" Generator:            http://bytefluent.com/vivify 
" Created:              13.10.2015
" Modified:             11.10.2016
" Creator:              http://github.com/DrSpatula
" Secondary Author:     stewa02 <stewatwo@cpan.org>
" License:              GNU General Public License v2

" Vim colorscheme boilerplate according to documentation and VimCasts.
if version > 580
    highlight clear
    if exists("syntax_on")
        syntax reset
    endif
endif

let g:colors_name = "buddy"

set background=dark

" Highlight groups that are currently not set but can be added later on. I
" guess this is boilerplate from vivify...
"highlight WildMenu -- no settings --
"highlight CTagsMember -- no settings --
"highlight CTagsGlobalConstant -- no settings --
"highlight Ignore -- no settings --
"highlight CTagsImport -- no settings --
"highlight CTagsGlobalVariable -- no settings --
"highlight EnumerationValue -- no settings --
"highlight Union -- no settings --
"highlight Question -- no settings --
"highlight VisualNOS -- no settings --
"highlight ModeMsg -- no settings --
"highlight FoldColumn -- no settings --
"highlight EnumerationName -- no settings --
"highlight MoreMsg -- no settings --
"highlight DiffChange -- no settings --
"highlight Error -- no settings --
"highlight DefinedName -- no settings --
"highlight LocalVariable -- no settings --
"highlight CTagsClass -- no settings --
"highlight Directory -- no settings --
"highlight Underlined -- no settings --
"highlight clear -- no settings --
"highlight SpellRare -- no settings --
"highlight SpellCap -- no settings --
"highlight SpellLocal -- no settings --
"highlight SpellBad -- no settings --

" Enable comment italics as the default, but make it possible to disable it if
" the term doesn't support it or the user simply prefers to have no italics.
if exists("g:buddy_notermitalics")
    highlight Comment    guifg=#b3b0a3 guibg=NONE    guisp=NONE    gui=italic         ctermfg=144  ctermbg=NONE cterm=NONE
else
    highlight Comment    guifg=#b3b0a3 guibg=NONE    guisp=NONE    gui=italic         ctermfg=144  ctermbg=NONE cterm=italic
endif

" Highlight groups that are set or will be set in due time.
highlight IncSearch      guifg=#c25643 guibg=NONE                  gui=underline,bold ctermfg=167  ctermbg=NONE cterm=underline,bold
highlight Search         guifg=#c25643 guibg=NONE                  gui=underline,bold ctermfg=167  ctermbg=NONE cterm=underline,bold
highlight ColorColumn    guifg=NONE    guibg=#8a3636               gui=NONE           ctermfg=NONE ctermbg=95   cterm=NONE
highlight TabLineSel     guifg=#d9d9d9 guibg=#8a3636               gui=NONE           ctermfg=253  ctermbg=95   cterm=NONE
highlight TabLine        guifg=#d9d9d9 guibg=#666666               gui=NONE           ctermfg=253  ctermbg=242  cterm=NONE
highlight TabLineFill    guifg=#a8a8a8 guibg=#444444               gui=NONE           ctermfg=248  ctermbg=238  cterm=NONE
highlight SignColumn     guifg=#8a3636 guibg=#202020               gui=bold           ctermfg=95   ctermbg=234  cterm=bold
highlight Normal         guifg=#d9d9d9 guibg=#202020 guisp=#202020 gui=NONE           ctermfg=253  ctermbg=234  cterm=NONE
highlight Conceal        guifg=#d9d9d9 guibg=#202020 guisp=#202020 gui=NONE           ctermfg=253  ctermbg=234  cterm=NONE
highlight WarningMsg     guifg=#ffb700 guibg=NONE                  gui=bold           ctermfg=11   ctermbg=NONE cterm=bold
highlight ErrorMsg       guifg=#c25643 guibg=NONE                  gui=bold           ctermfg=167  ctermbg=NONE cterm=bold
highlight SpecialComment guifg=#f3cf64 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=221  ctermbg=NONE cterm=NONE
highlight Typedef        guifg=#fff200 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=11   ctermbg=NONE cterm=NONE
highlight Title          guifg=#fffcf0 guibg=NONE    guisp=NONE    gui=bold           ctermfg=230  ctermbg=NONE cterm=bold
highlight Folded         guifg=#b8c1ca guibg=#384048 guisp=#384048 gui=NONE           ctermfg=146  ctermbg=238  cterm=NONE
highlight PreCondit      guifg=#c25643 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=167  ctermbg=NONE cterm=NONE
highlight Include        guifg=#c25643 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=167  ctermbg=NONE cterm=NONE
highlight Float          guifg=#e66450 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=167  ctermbg=NONE cterm=NONE
highlight StatusLineNC   guifg=#9f9385 guibg=#444444 guisp=#444444 gui=NONE           ctermfg=144  ctermbg=238  cterm=NONE
highlight NonText        guifg=#9a9a9a guibg=NONE    guisp=#303030 gui=NONE           ctermfg=247  ctermbg=NONE cterm=NONE
highlight DiffText       guifg=NONE    guibg=#575757 guisp=#575757 gui=NONE           ctermfg=NONE ctermbg=240  cterm=NONE
highlight Debug          guifg=#f0ffe2 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=194  ctermbg=NONE cterm=NONE
highlight PMenuSbar      guifg=NONE    guibg=#000000 guisp=#000000 gui=NONE           ctermfg=NONE ctermbg=NONE cterm=NONE
highlight Identifier     guifg=#f3cf64 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=221  ctermbg=NONE cterm=NONE
highlight SpecialChar    guifg=#b5eeff guibg=NONE    guisp=NONE    gui=NONE           ctermfg=159  ctermbg=NONE cterm=NONE
highlight Conditional    guifg=#fff200 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=11   ctermbg=NONE cterm=NONE
highlight StorageClass   guifg=#f0911d guibg=NONE    guisp=NONE    gui=NONE           ctermfg=208  ctermbg=NONE cterm=NONE
highlight Todo           guifg=#a9a9a9 guibg=NONE    guisp=NONE    gui=italic         ctermfg=248  ctermbg=NONE cterm=NONE
highlight Special        guifg=#f3cf64 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=221  ctermbg=NONE cterm=NONE
highlight LineNr         guifg=#4d4d4d guibg=#1d1d1d guisp=#1d1d1d gui=NONE           ctermfg=239  ctermbg=234  cterm=NONE
highlight StatusLine     guifg=#fffcf0 guibg=#444444 guisp=#444444 gui=italic         ctermfg=230  ctermbg=238  cterm=NONE
highlight Label          guifg=#f3cf64 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=221  ctermbg=NONE cterm=NONE
highlight PMenuSel       guifg=#1a1a1a guibg=#e6cd83 guisp=#e6cd83 gui=NONE           ctermfg=234  ctermbg=180  cterm=NONE
highlight Delimiter      guifg=#f0ffe2 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=194  ctermbg=NONE cterm=NONE
highlight Statement      guifg=#ffdd00 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=220  ctermbg=NONE cterm=NONE
highlight Character      guifg=#e66450 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=167  ctermbg=NONE cterm=NONE
highlight Number         guifg=#e66450 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=167  ctermbg=NONE cterm=NONE
highlight Boolean        guifg=#fff200 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=11   ctermbg=NONE cterm=NONE
highlight Operator       guifg=#fff200 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=11   ctermbg=NONE cterm=NONE
highlight CursorLine     guifg=NONE    guibg=#2d2d2d guisp=#2d2d2d gui=NONE           ctermfg=NONE ctermbg=236  cterm=NONE
highlight CursorLineNr   guifg=#8a3636 guibg=#202020 guisp=#202020 gui=bold           ctermfg=95   ctermbg=234  cterm=bold
highlight DiffDelete     guifg=NONE    guibg=#8a3636 guisp=#8a3636 gui=NONE           ctermfg=NONE ctermbg=95   cterm=NONE
highlight CursorColumn   guifg=NONE    guibg=#2d2d2d guisp=#2d2d2d gui=NONE           ctermfg=NONE ctermbg=236  cterm=NONE
highlight Define         guifg=#c25643 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=167  ctermbg=NONE cterm=NONE
highlight Function       guifg=#f0811f guibg=NONE    guisp=NONE    gui=NONE           ctermfg=208  ctermbg=NONE cterm=NONE
highlight PreProc        guifg=#cc442f guibg=NONE    guisp=NONE    gui=NONE           ctermfg=167  ctermbg=NONE cterm=NONE
highlight Visual         guifg=#fffcf0 guibg=#444444 guisp=#444444 gui=NONE           ctermfg=230  ctermbg=238  cterm=NONE
highlight VertSplit      guifg=#5e5e5e guibg=#444444 guisp=#444444 gui=NONE           ctermfg=59   ctermbg=238  cterm=NONE
highlight Exception      guifg=#fff200 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=11   ctermbg=NONE cterm=NONE
highlight Keyword        guifg=#fff200 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=11   ctermbg=NONE cterm=NONE
highlight Type           guifg=#ffb700 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=214  ctermbg=NONE cterm=NONE
highlight Cursor         guifg=NONE    guibg=#656565 guisp=#656565 gui=NONE           ctermfg=NONE ctermbg=241  cterm=NONE
highlight PMenu          guifg=#fffcf0 guibg=#444444 guisp=#444444 gui=NONE           ctermfg=230  ctermbg=238  cterm=NONE
highlight SpecialKey     guifg=#9a9a9a guibg=NONE    guisp=#343434 gui=NONE           ctermfg=247  ctermbg=NONE cterm=NONE
highlight Constant       guifg=#e66450 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=167  ctermbg=NONE cterm=NONE
highlight Tag            guifg=#f0ffe2 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=194  ctermbg=NONE cterm=NONE
highlight String         guifg=#5dd2fd guibg=NONE    guisp=NONE    gui=NONE           ctermfg=81   ctermbg=NONE cterm=NONE
highlight PMenuThumb     guifg=NONE    guibg=#857b6f guisp=#857b6f gui=NONE           ctermfg=NONE ctermbg=101  cterm=NONE
highlight MatchParen     guifg=#fffcf0 guibg=#857b6f guisp=#857b6f gui=bold           ctermfg=230  ctermbg=101  cterm=bold
highlight Repeat         guifg=#fff200 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=11   ctermbg=NONE cterm=NONE
highlight Structure      guifg=#ffb700 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=214  ctermbg=NONE cterm=NONE
highlight Macro          guifg=#c25643 guibg=NONE    guisp=NONE    gui=NONE           ctermfg=167  ctermbg=NONE cterm=NONE
highlight DiffAdd        guifg=NONE    guibg=#5b802c guisp=#5b802c gui=NONE           ctermfg=NONE ctermbg=2    cterm=NONE

