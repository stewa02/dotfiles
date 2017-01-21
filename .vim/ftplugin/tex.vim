" Filetype settings for LaTeX

setlocal nolist
setlocal colorcolumn=
setlocal spelllang=de
setlocal spell

let g:tex_conceal="adgms"               " Replace LaTeX with Unicode symbols
if has("win32")                         " Set texcompile.vim settings
    let g:tex_readerpath = 
        \'C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe'
    let g:tex_readerproc = 'AcroRd32.exe'
else
    let g:tex_readerpath = 'evince'
    let g:tex_readerproc = 'evince'
endif

