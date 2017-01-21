" Filetype specific settings for Perl

setlocal keywordprg=perldoc\ -f     " Perldoc for shift-K
setlocal makeprg=perl\ -c\ %\ $*    " Set tool for :make
setlocal comments=sl:#,mb:#,elx:#   " Autocomment chars

let perl_include_pod = 1            " Plain Old Documentation
let perl_extended_vars = 1          " Highlight variable structures well
let perl_fold = 1                   " Perl specific folding
let perl_fold_blocks = 1

