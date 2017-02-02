" A simple module to run Perl test suits using the command line tool prove
" Last change:   30.01.2017
" Maintainer:    stewa02 <stewatwo@cpan.org>
" License:       This plugin is distributed under the Vim-license.

" Do not load, if loaded already
if exists("g:loaded_prove")
    finish
endif
let g:loaded_prove = 1

" Save configuration and replace them with defaults
" (line-continuation)
let s:save_cpo = &cpo
set cpo&vim

" Runs tests from a test directory for Perl modules
function! s:Prove()
    " Save current directory, makeprg and errorformat
    let l:save_path = getcwd()
    let l:save_errorformat = &errorformat
    let l:save_makeprg = &makeprg

    " Set new settings
    let &makeprg='prove -I"'.expand("%:p:h").'" *.t'
    let &errorformat='%m at %f line %l.'

    " Change directory to directory of script and search for test directory
    " recursively upwards
    lcd %:p:h
    while empty(glob("t"))
        lcd ..
    endwhile

    " If a valid directory is found, run the tests using prove
    if isdirectory("t")
        lcd t
        make
    else
        echom "Test folder not found!"
    endif

    " Reset everything to original value
    execute "lcd ".l:save_path
    let &makeprg = l:save_makeprg
    let &errorformat = l:save_errorformat

    " Open Quickfix window
    copen
endfunction

command! Prove call <SID>Prove()

" Restore user settings
let &cpo = s:save_cpo

