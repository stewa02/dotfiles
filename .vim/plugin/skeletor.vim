" A simple skeleton plugin.
" Last change:   18.01.2017
" Version:       V1.0
" Maintainer:    stewa02 <stewatwo@cpan.org>
" License:       This plugin is distributed under the Vim-license.

" Do not load, if loaded already
if exists("g:loaded_skeletor") || v:version < 703
    finish
endif
let g:loaded_skeletor = 1

" Save configuration and replace them with defaults
let s:save_cpo = &cpo
set cpo&vim

" Load in skeleton
function! s:LoadSkeleton()
    let l:extension = expand("%:e")

    if has("win16") || has("win32") || has("win64")
        let l:skel_path = $HOME."/vimfiles/skeletons/"
    elseif has("unix") || has("linux") || has("macunix") || has("mac")
        let l:skel_path = $HOME."/.vim/skeletons/"
    endif

    if !empty(glob(l:skel_path.l:extension.".skel"))
        execute "-1read ".l:skel_path.l:extension.".skel"
    endif

    if exists("g:skeletor_movement") &&
     \ has_key(g:skeletor_movement, l:extension)
        execute "normal ".get(g:skeletor_movement, l:extension)
    endif
endfunction

" Command and autocommands
command! LoadSkeleton call <SID>LoadSkeleton()

augroup skeletor
autocmd!
autocmd BufNewFile * LoadSkeleton
augroup END

" Restore user settings
let &cpo = s:save_cpo

