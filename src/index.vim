exec "source ./src/keys.vim"

" Advances us one screen, updating the state object
function Advance( obj )
    echo "Advance"
    echo a:obj
endfunction

" Goes back to the previous screen
function GoBack( obj )
    echo "Return"
    echo a:obj
endfunction

" Inits a state object, but also the current buffer gets setup as expected
" pathsArray contains all the file paths i want it to swing us between
" Remap the keys required for this to work
" This object is going to be global
function Init( pathsArray )
    let g:obj = { "files" : a:pathsArray }
    call RemapKeys()
endfunction
