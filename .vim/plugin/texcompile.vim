" Plugin to automate the compilation process of LaTEX files.
" Last change:   11.09.2016
" Maintainer:    stewa02 <stewatwo@cpan.org>
" License:       This plugin is distributed under the Vim-license.

" Do not load, if loaded already
if exists("g:loaded_texcompile")
    finish
endif
let g:loaded_texcompile = 1

" Save configuration and replace them with defaults
" (line-continuation)
let s:save_cpo = &cpo
set cpo&vim

function! s:CompileAndOpen()
    " Throw error if configuration is incomplete
    if !exists("g:tex_readerproc") || !exists("g:tex_readerpath")
        echoerr "Settings incomplete, set g:tex_readerproc and g:readerpath in"
                    \." your .vimrc!"
        let &cpo = s:save_cpo
        return
    endif

    " Write file to disk
    write

    " Kill PDF reader to ensure proper compilation of latex code
    if has("win32")
        call system('taskkill /F /IM '.g:tex_readerproc)
    else
        call system('killall '.g:tex_readerproc)
    endif
    sleep 50m

    " Compile
    lcd %:p:h
    call system('pdflatex --interaction nonstopmode -output-directory="'
                \.expand("%:p:h").'" -aux-directory="'.expand("%:p:h").'" "'
                \.expand("%:p").'"')

    " Open PDF reader with compiled file open
    if has("win32")
        silent execute ':!start "'.g:tex_readerpath.'" "'.expand("%:p:r").'.pdf"'
    else
        call system(g:tex_readerpath.' "'.expand("%:p:r").'.pdf" &')
    endif

    let s:current_window = bufwinnr(bufnr(bufname("%")))

    " Open logfile in new split
    if !bufexists(bufname(expand("%:t:r").".log"))
        below new %:p:r.log
        resize 10 
        normal! G
        silent execute s:current_window."wincmd w"
    else
        silent execute bufwinnr(bufnr(bufname(expand("%:t:r").".log")))
                                \."wincmd w"
        edit!
        normal! G
        silent execute s:current_window."wincmd w"
    endif
endfunction

" Create command if it doesn't exist
if !exists(":TEXCompile")
    command! TEXCompile :call <SID>CompileAndOpen()
else
    echoerr "No command created, because it already exists!"
endif

" Create mapping if there is no user defined one
if !hasmapto(":TEXCompile")
    augroup texcompile_mappings
    autocmd!
    autocmd FileType tex nnoremap <leader>r :TEXCompile<CR>
    augroup END
endif

" Restore user settings
let &cpo = s:save_cpo

