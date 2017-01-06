" Vim plugin to check for Perl style rules using Perl::Critic.
" Last change:   23.09.2016
" Maintainer:    stewa02 <stewatwo@cpan.org>
" License:       This plugin is distributed under the Vim-license.

" Do not load, if loaded already
if exists("g:loaded_perlstyle") || v:version < 800
    finish
endif
let g:loaded_perlstyle = 1

" Save configuration and replace them with defaults (line-continuation)
let s:save_cpo = &cpo
set cpo&vim

" Define a sign to put on each line with an error. Needs to bee defined with
" certain parameters before it can be used later.
" Reference: http://vimdoc.sourceforge.net/htmldoc/sign.html
sign define perlstyle text=✘ texthl=ErrorMsg

" Function to run Perl::Critic, will eventually run asynchronously.
function! s:RunPerlCritic()
    " Run perlcritic and split the result in linewise
    let s:Results     = system("perlcritic ".expand("%"))
    let s:ResultsList = split(s:Results, "\n")
    
    " Find line numbers inside the error messages in the ResultsList
    let s:LineNumbers = []
    for s:Line in s:ResultsList
        let s:Match = matchstr(s:Line, '\D* at line \zs\d*\ze.*')
        call add(s:LineNumbers, s:Match)
        unlet s:Match
    endfor
    unlet s:Line

    " Remove existing signs
    sign unplace *

    " Placing signs on each line
    let s:SignId = 1
    for s:SignLine in s:LineNumbers
        execute "sign place ".s:SignId." name=perlstyle line=".s:SignLine.
              \ " buffer=".bufnr("%")
        let s:SignId += 1
    endfor
    unlet s:SignId
endfunction

function! s:EchoError()
    if !empty(s:PerlstyleDict)
        " do things
    endif
endfunction

function! s:CheckStatus()
    if exists("b:PerlstyleJob")
        let s:JobStatus = job_status(b:PerlstyleJob)
        if s:JobStatus != "run"
            return 1
        endif
    else
        return 1
    endif
    return 0
endfunction

function! s:PerlStyle()
    if s:CheckStatus()
        let b:PerlstyleJob = job_start(s:RunPerlCritic())
    else
        echohl ErrorMsg
        echomsg "Perl::Critic still running!"
        echohl None
    endif
endfunction

" Internal: Creates a dict with the keys from a given list (makes the keys
" unique). The values are an empty string that can be changed / appended to
" later.
function! s:ListToDict(List)
    let s:Dict = {}
    for s:LineNumber in a:List
       let dict[s:LineNumber] = ''
    endfor
    return s:Dict
endfunction

" Create command if they don't exist
if !exists(":PerlStyle")
    command! PerlStyle call <SID>PerlStyle()
    command! PerlDebug call <SID>RunPerlCritic()
else
    echoerr "No command created, because it already exists!"
endif

" Restore user settings
let &cpo = s:save_cpo

