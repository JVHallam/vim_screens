function RemapKeys()
    exec ":noremap <right> :call Advance()<return>"
    exec ":noremap <left> :call Regress()<return>"

    exec ":noremap gt :call Advance()<return>"
    exec ":noremap gT :call Regress()<return>"
endfunction
