" Inits a state object, but also the current buffer gets setup as expected
" pathsArray contains all the file paths i want it to swing us between
" Remap the keys required for this to work
" This object is going to be global
function Init( pathsArray, options={} )
    let g:obj = CreateStateObject( a:pathsArray, a:options )
    call RemapKeys()
    call Advance()
endfunction


function Advance()

    let nextExercisePath = AdvanceState()

    if( empty(nextExercisePath) )
        call CloseApp()
    endif

    let progressString = GetProgressMessage()

    call RenderExercise( nextExercisePath, progressString )

endfunction

" Goes back to the previous screen
function Regress()
    let nextExercisePath = RegressState()

    if( empty(nextExercisePath) )
        call CloseApp()
    endif

    let progressString = GetProgressMessage()

    call RenderExercise( nextExercisePath, progressString )
endfunction

function GetProgressMessage()

    let currentIndex = g:obj["files"]->index(g:obj["currentFile"])
    let oneIndex = currentIndex + 1
    let exerciseCount = len(g:obj["files"])

    let progressString = "{ " . oneIndex . " / " . exerciseCount . " }"

    return progressString
endfunction

function CloseApp()
    :q!
endfunction
