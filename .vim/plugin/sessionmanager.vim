" Small session management plugin.
" Last change:   13.09.2016
" Maintainer:    stewa02 <stewatwo@cpan.org>
" License:       This plugin is distributed under the Vim-license.
" Thanks to:     markw (stackoverflow):
"                https://stackoverflow.com/questions/5142099/how-to-auto-save-vim-session-on-quit-and-auto-reload-on-start-including-split-wi/6052704
"                LCD 47 (Google Groups):
"                https://groups.google.com/forum/#!topic/vim_use/0jaFyy5LR7A

" Do not load, if loaded already
if exists("g:loaded_sessionmanager") || v:version < 730
    finish
endif
let g:loaded_sessionmanager = 1

" Save configuration and replace them with defaults
" (line-continuation)
let s:save_cpo = &cpo
set cpo&vim

" This option makes session files compatible between MS Windows and *nix based
" systems that use the forward slash "/" instead of the backslash "\". This
" option uses the forward slash on all systems inside the session files.
set sessionoptions+=unix,slash

" Function that determines if a certain buffer is active in any of the open
" tabs. This is necessary, because bufwinnr() only returns the correct answer
" if you are in the corresponding tab.
" Reference: https://groups.google.com/forum/#!topic/vim_use/0jaFyy5LR7A
function! s:BufInTab(bufnr) 
    for tabnr in range(1,tabpagenr("$")) 
        if index(tabpagebuflist(tabnr), a:bufnr) != -1 
            return 0 
        endif 
    endfor 
    return 1 
endfunction 

" Simply saves the current session into the personal .vim directory
function! SaveSess()
    if has("win32") || has("win16")
        execute "mksession! ~/vimfiles/session.vim"
    elseif has("unix") || has("linux") || has("mac") || has("macunix")
        execute "mksession! ~/.vim/session.vim"
    else
        echoerr "Operating system is not supported!"
    endif
endfunction

" Simply loads in the saved session. Is called by a autocommand at VimEnter.
" The magic after the source command is necessary to open all new files with
" which vim was called from the command line.
function! RestoreSess()
    if has("win32") || has("win16")
        execute "source ~/vimfiles/session.vim"
    elseif has("unix") || has("linux") || has("mac") || has("macunix")
        execute "source ~/.vim/session.vim"
    else
        echoerr "Operating system is not supported!"
        return
    endif
    if bufexists(1)
        for bufnr in range(1, bufnr("$"))
            if s:BufInTab(bufnr)
                tabnew
                execute ":b".bufnr
            endif
        endfor
    endif
endfunction

" Set up autocommands for autosave and autoload
augroup session
autocmd!
autocmd VimLeave * call SaveSess()
autocmd VimEnter * call RestoreSess()
augroup END

" Restore user settings
let &cpo = s:save_cpo

