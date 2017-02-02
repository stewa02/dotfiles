" Filetype settings for markdown

setlocal nolist
setlocal spelllang=de
setlocal spell

" vim-pandoc-syntax conceal
let g:pandoc#syntax#conceal#use = 0

" set make to useful command
let &l:makeprg = "pandoc % -f markdown --template=".$HOME
               \."/.pandoc/mylatex.template -t latex -o %:r.pdf"

