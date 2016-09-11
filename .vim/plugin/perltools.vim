" Some small tools to assist me with Perl programming.
" Last change:   11.09.2016
" Maintainer:    stewa02 <stewatwo@cpan.org>
" License:       This plugin is distributed under the Vim-license.

" Do not load, if loaded already
if exists("g:loaded_perltools")
    finish
endif
let g:loaded_perltools = 1

" Save configuration and replace them with defaults
" (line-continuation)
let s:save_cpo = &cpo
set cpo&vim

function! RunTestsPerl()
    lcd %:p:h
    while empty(glob("t"))
        lcd ..
    endwhile
    if isdirectory("t")
        lcd t
        execute ':!prove -I"'.expand("%:p:h").'" *.t'
        if !has("gui_running")
            if has("win32")
                execute ':!pause >nul'
            else
                execute ':!read -p "Press [Enter] to return to vim..."'
            endif
        endif
    else
        echom "Test folder not found!"
    endif
endfunction

function! RunPerlProgram()
    execute ":w"
    execute ':!perl "'.expand("%:p").'"'
    if !has("gui_running")
        if has("win32")
            execute ':!pause >nul'
        else
            execute ':!read -p "Press [Enter] to return to vim..."'
        endif
    endif
endfunction

function! PerlGetDoc(...)
    if exists(a:0)
        let helpinput = a:0
    else
        let helpinput = input("Perldoc help entry: ")
    endif
    call system("perldoc -f ".helpinput) || system("perldoc ".helpinput)
endfunction

" Create command if it doesn't exist
if !exists(":PerlRunTests")
    command! PerlRunTests :call RunTestsPerl()
endif
if !exists(":PerlRunScript")
    command! PerlRunScript :call RunPerlProgram()
endif
if !exists(":PerlGetDoc")
    command! PerlGetDoc :call PerlGetDoc()
endif

" Create mapping if there is no user defined one
if !hasmapto(":PerlRunTests") && !hasmapto(":PerlRunScript")
            \ && !hasmapto(":PerlGetDoc")
    augroup perltools_mappings
        autocmd!
        autocmd FileType perl nnoremap <unique> <leader>r <Plug>PerlRunScript<CR>
        autocmd FileType perl nnoremap <unique> <leader>t <Plug>PerlRunTests<CR>
        autocmd FileType perl nnoremap <unique> <leader>d <Plug>PerlGetDoc<CR>
    augroup END
endif

" Restore user settings
let &cpo = s:save_cpo

