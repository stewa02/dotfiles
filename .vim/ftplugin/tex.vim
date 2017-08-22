" Filetype settings for LaTeX

setlocal nolist
setlocal colorcolumn=
setlocal spelllang=de
setlocal spell

let g:tex_conceal="adgms"               " Replace LaTeX with Unicode symbols

if has("unix") || has("linux")
    let $max_print_line=9999
    let &l:makeprg = 'pdflatex --file-line-error --interaction=nonstopmode "'.
                   \ expand("%:p").'" --output-directory="'.expand("%:p:h").'"'
    let &l:errorformat = '%f:%l: %m'
endif

