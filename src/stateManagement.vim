" Technically a model
function CreateStateObject( pathsArray=[], options={} )
    let actualOptions = !empty(a:options) ? a:options : GetDefaultOptions()
    return { 
                \ "files" : a:pathsArray, 
                \ "currentFile" : "",
                \ "options" : actualOptions
                \ }
endfunction

function GetDefaultOptions()
    return {
                \"paddingSpaces" : 4,
                \"paddingPrefix" : ''
    \}
endfunction

" step=1, go forward
" step=-1, go backward
function GetNextIndex( step=1 )
    let isStart = empty(g:obj["currentFile"])

    let nextIndex = 0

    if( !isStart )
        let curIndex = index(g:obj["files"], g:obj["currentFile"])
        let nextIndex = curIndex + a:step
    endif

    return nextIndex
endfunction

function UpdateCurrentFile( nextIndex )
    let nextFile = g:obj["files"][a:nextIndex]

    let g:obj["currentFile"] = nextFile

    return g:obj["currentFile"]
endfunction

" Advance state and return current exercise
" Advances g:obj
function AdvanceState()
    let nextIndex = GetNextIndex()

    let maxIndex = len(g:obj["files"]) - 1
    if( nextIndex > maxIndex )
       return "" 
    endif

    let NextExerciseFile = UpdateCurrentFile( nextIndex )

    return NextExerciseFile
endfunction

" Regress state and return current exercise
function RegressState()
    let nextIndex = GetNextIndex(-1)

    let nextIndex = nextIndex < 0 ? 0 : nextIndex

    let NextExerciseFile = UpdateCurrentFile( nextIndex )

    return NextExerciseFile
endfunction
