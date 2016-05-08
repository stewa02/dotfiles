" Function to automate the compilation process of LaTEX files.
" Currently only works for Microsoft Windows.


fu! CompileAndOpen()
    " Define path and processname of default pdf reader
    let ReaderPath = 'C:\Program Files (x86)\Adobe\Acrobat Reader DC\Reader\AcroRd32.exe'
    let ReaderProc = 'AcroRd32.exe'
    
    let ReaderPathL = 'zathura'
    let ReaderProcL = 'zathura'

    " Write file to disk
    write

    " Kill PDF reader to ensure proper compilation of latex code
    if has("win32")
        call system('taskkill /F /IM '.ReaderProc)
        sleep 50m
    else
        call system('killall '.ReaderProcL)
        sleep 50m
    endif

    " Compile
    lcd %:p:h
    call system('pdflatex --interaction nonstopmode -output-directory="'
                \.expand("%:p:h").'" -aux-directory="'.expand("%:p:h").'" "'
                \.expand("%:p").'"')

    " Open PDF reader with compiled file open
    if has("win32")
        silent execute ':!start "'.ReaderPath.'" "'.expand("%:p:r").'.pdf"'
    else
        call system(ReaderPathL.' "'.expand("%:p:r").'.pdf" &')
    endif

    let current_window = bufwinnr(bufnr(bufname("%")))
    " Open logfile in new split
    if !bufexists(bufname(expand("%:t:r").".log"))
        below new %:p:r.log
        resize 10 
        normal G
        silent execute current_window."wincmd w"
    else
        silent execute bufwinnr(bufnr(bufname(expand("%:t:r").".log")))
                                \."wincmd w"
        edit!
        normal G
        silent execute current_window."wincmd w"
    endif
endfunction
command! TEXCompile :call CompileAndOpen()
