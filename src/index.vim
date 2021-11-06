exec "source ./src/keys.vim"

" ---------------------------------------------------
" This is all built around the g:obj state object
" ---------------------------------------------------

" Technically a model
function CreateStateObject( pathsArray=[] )
    return { 
                \ "files" : a:pathsArray, 
                \ "currentFile" : "" 
                \ }
endfunction

" Advance state and return current exercise
" Advances g:obj
function AdvanceState()
    let isStart = empty(g:obj["currentFile"])

    let nextIndex = 0

    if( !isStart )
        let curIndex = index(g:obj["files"], g:obj["currentFile"])
        let nextIndex = curIndex + 1
    endif

    let maxIndex = len(g:obj["files"]) - 1
    if( nextIndex > maxIndex )
       return "" 
    endif

    let nextFile = g:obj["files"][nextIndex]

    let g:obj["currentFile"] = nextFile

    return g:obj["currentFile"]
endfunction

" Regress state and return current exercise
function RegressState()
    let isStart = empty(g:obj["currentFile"])

    let nextIndex = 0

    if( !isStart )
        let curIndex = index(g:obj["files"], g:obj["currentFile"])
        let nextIndex = curIndex - 1
    endif

    if( nextIndex < 0 )
       return g:obj["currentFile"]
    endif

    let nextFile = g:obj["files"][nextIndex]

    let g:obj["currentFile"] = nextFile

    return g:obj["currentFile"]
endfunction

" ---------------------- </state> -------------------------

" Copy the file contents into the current buffer
function SetupFile( templatePath="" )
    let values = readfile( a:templatePath )
    call append( 0, values )
endfunction

function Advance()
    call ClearBuffer()
    let nextExercisePath = AdvanceState()

    if( empty(nextExercisePath) )
        call CloseApp()
    endif

    call SetupFile( nextExercisePath )
endfunction

" Goes back to the previous screen
function Regress()
    call ClearBuffer()
    let nextExercisePath = RegressState()

    if( empty(nextExercisePath) )
        call CloseApp()
    endif

    call SetupFile( nextExercisePath )
endfunction

" Inits a state object, but also the current buffer gets setup as expected
" pathsArray contains all the file paths i want it to swing us between
" Remap the keys required for this to work
" This object is going to be global
function Init( pathsArray )
    let g:obj = CreateStateObject( a:pathsArray )
    call RemapKeys()
endfunction

" -----------------------------------------------------------------
" Rendering stuff:

" Delete everything in the current buffer
function ClearBuffer()
    :%! echo ""
    call deletebufline(bufnr(), 1, line("$"))
endfunction

function CloseApp()
    :q!
endfunction

