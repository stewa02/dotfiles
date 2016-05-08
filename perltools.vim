" Some small tools to assist me with Perl programming.

fu! RunTestsPerl()
    lcd %:p:h
    while empty(glob("t"))
        lcd ..
    endwhile
    if isdirectory("t")
        lcd t
        execute ':!prove -I"'.expand("%:p:h").'" *.t'
        if !has("gui_running")
            if has("win32")
                execute ':!pause >nul'
            else
                execute ':!read -p "Press [Enter] to return to vim..."'
            endif
        endif
    else
        echom "Test folder not found!"
    endif
endfunction
command! PerlRunTests :call RunTestsPerl()

fu! RunPerlProgram()
    execute ":w"
    execute ':!perl "'.expand("%:p").'"'
    if !has("gui_running")
        if has("win32")
            execute ':!pause >nul'
        else
            execute ':!read -p "Press [Enter] to return to vim..."'
        endif
    endif
endfunction
command! PerlRunScript :call RunPerlProgram()

fu! PerlGetDoc(...)
    if exists(a:0)
        let helpinput = a:0
    else
        let helpinput = input("Perldoc help entry: ")
    endif
    call system("perldoc -f ".helpinput) || system("perldoc ".helpinput)
endfunction
command! PerlGetDoc :call PerlGetDoc()
