" Technically a model
function CreateStateObject( pathsArray=[], options={} )
    let actualOptions = !empty(a:options) ? options : GetDefaultOptions()
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
