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

" Runs tests from a test directory for Perl modules
function! s:RunTestsPerl()
    " Change directory to directory of script and search for test directory
    " recursively upwards
    lcd %:p:h
    while empty(glob("t"))
        lcd ..
    endwhile

    " If a valid directory is found, run the tests using prove
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

" Runs a Perl script
function! s:RunPerlProgram()
    " Write file before execution
    write

    " Run Perl script after writing to disk
    execute ':!perl "'.expand("%:p").'"'
    if !has("gui_running")
        if has("win32")
            execute ':!pause >nul'
        else
            execute ':!read -p "Press [Enter] to return to vim..."'
        endif
    endif
endfunction

function! s:PerlGetDoc(...)
    if exists(a:0)
        let helpinput = a:0
    else
        let helpinput = input("Perldoc help entry: ")
    endif
    call system("perldoc -f ".helpinput) || system("perldoc ".helpinput)
endfunction

" Create command if it doesn't exist
if !exists(":PerlRunTests")
    command! PerlRunTests :call <SID>RunTestsPerl()
endif
if !exists(":PerlRunScript")
    command! PerlRunScript :call <SID>RunPerlProgram()
endif
if !exists(":PerlGetDoc")
    command! PerlGetDoc :call <SID>PerlGetDoc()
endif

" Create mapping if there is no user defined one
if !hasmapto(":PerlRunTests") && !hasmapto(":PerlRunScript")
            \ && !hasmapto(":PerlGetDoc")
    augroup perltools_mappings
    autocmd!
    autocmd FileType perl nnoremap <leader>r :PerlRunScript<CR>
    autocmd FileType perl nnoremap <leader>t :PerlRunTests<CR>
    autocmd FileType perl nnoremap <leader>d :PerlGetDoc<CR>
    augroup END
endif

" Restore user settings
let &cpo = s:save_cpo

