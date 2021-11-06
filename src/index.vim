" Inits a state object, but also the current buffer gets setup as expected
" pathsArray contains all the file paths i want it to swing us between
" Remap the keys required for this to work
" This object is going to be global
function Init( pathsArray )
    let g:obj = CreateStateObject( a:pathsArray )
    call RemapKeys()
endfunction

function Advance()
    call ClearBuffer()
    let nextExercisePath = AdvanceState()

    if( empty(nextExercisePath) )
        call CloseApp()
    endif

    call RenderExercise( nextExercisePath )
endfunction

" Goes back to the previous screen
function Regress()
    call ClearBuffer()
    let nextExercisePath = RegressState()

    if( empty(nextExercisePath) )
        call CloseApp()
    endif

    call RenderExercise( nextExercisePath )
endfunction

function CloseApp()
    :q!
endfunction
