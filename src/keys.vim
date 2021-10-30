function RemapKeys()
    exec ":noremap <right> :call Advance(g:obj)<return>"
    exec ":noremap <left> :call GoBack(g:obj)<return>"
endfunction
