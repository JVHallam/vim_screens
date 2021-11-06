function RemapKeys()
    exec ":noremap <right> :call Advance()<return>"
    exec ":noremap <left> :call Regress()<return>"
endfunction
