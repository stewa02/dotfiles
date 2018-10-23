" Small session management plugin.
" Last change:   24.04.2017
" Version:       V1.2.2
" Maintainer:    stewa02 <stewatwo@cpan.org>
" License:       This plugin is distributed under the Vim-license.

" Do not load, if loaded already
if exists("g:loaded_sessionmanager") || v:version < 703
    finish
endif
let g:loaded_sessionmanager = 1

" Save configuration and replace them with defaults (line-continuation)
let s:save_cpo = &cpo
set cpo&vim

" This option makes session files compatible between MS Windows and *nix based
" systems that use the forward slash "/" instead of the backslash "\". This
" option uses the forward slash on all systems inside the session files.
set sessionoptions+=unix,slash
" Don't store vim options in session files. If this option is not set, new
" settings from $MYVIMRC are not loaded (they are loaded and immediately
" overwritten.
"set sessionoptions-=options

" Here we define two new plugin specific highlight groups, one for the "loaded
" session successfully" (green font colour) and one for the "no session"
" message (red font colour).
highlight SessionmanagerNoSession ctermfg=red guifg=#B40404 cterm=bold gui=bold
highlight SessionmanagerLoaded ctermfg=green guifg=#04B404 cterm=bold gui=bold

" Simply saves the current session into the personal .vim directory
function! s:SaveSess()
    if has("win32") || has("win16")
        mksession! ~/vimfiles/session.vim
    elseif has("unix")
        mksession! ~/.vim/session.vim
    else
        echoerr "Operating system is not supported!"
    endif
endfunction

" Simply loads in the saved session. Is called by a autocommand at VimEnter.
" The magic after the source command is necessary to open all new files with
" which vim was called from the command line.
function! s:RestoreSess()
    if !empty(glob("~/.vim/session.vim")) ||
     \ !empty(glob("~/vimfiles/session.vim"))
        " Get argument list before loading session
        let l:arglist = []
        if !empty(argv())
            silent argdo call add(l:arglist, expand("%:p"))
        endif
        if has("win32") || has("win16")
            let l:time = strftime("%Y %b %d %X",getftime($HOME."/vimfiles/session.vim"))
            source ~/vimfiles/session.vim
        elseif has("unix")
            let l:time = strftime("%Y %b %d %X",getftime($HOME."/.vim/session.vim"))
            source ~/.vim/session.vim
        else
            echoerr "Operating system is not supported!"
            return
        endif

        if !empty(l:arglist)
            filetype on
            tabnew

            for l:args in l:arglist
                execute "argadd ".l:args
                execute "edit   ".l:args
                filetype detect
            endfor

            execute "buffer ".l:arglist[0]
        endif
    endif

    if exists("l:time")
        " If there was a session file loaded, inform the user about the age of
        " the session (last modified time of the file).
        let l:message = "Session from ".l:time." loaded successfully!"
        echohl SessionmanagerLoaded
    else
        " If there is no session file do nothing and inform the user using 
        " ErrorMsg highlighting without requiring the user to press enter at
        " startup (making the error less special).
        let l:message = "No session file to load!"
        echohl SessionmanagerNoSession
    endif
    " Calling redraw *before* echoing the message ensures, that the message is
    " not wiped off the screen immediately afterwards.
    " Reference: http://vimdoc.sourceforge.net/htmldoc/eval.html#:echo-redraw
    redraw
    echomsg l:message
    echohl None
endfunction

" Create command if they don't exist
command! SaveSession    call <SID>SaveSess()
command! RestoreSession call <SID>RestoreSess()

" Set up autocommands for autosave and autoload
augroup session
autocmd!
autocmd VimLeave * SaveSession
autocmd VimEnter * RestoreSession
augroup END

" Restore user settings
let &cpo = s:save_cpo

