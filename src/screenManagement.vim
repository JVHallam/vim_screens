
" Delete everything in the buffer from startLine to the end
function ClearBuffer( startLine=1 )
    call deletebufline(bufnr(), a:startLine, line("$"))
endfunction

" Copy the file contents into the current buffer
function RenderExercise( templatePath="", messageString="" )
    let values = readfile( a:templatePath )
    let values = AddPadding( values )

    if( !empty(a:messageString) )
        let values = AddMessage( values, a:messageString )
    endif

    call setline( 1, values )

    call ClearBuffer( len(values) + 1 )
endfunction

" - Private -------------------------------------------------------------
function AddPadding( valuesArray )
    let newValuesArray = [ "", "" ] + a:valuesArray + [ "", "" ]
    return newValuesArray
endfunction

function AddMessage( valuesArray, message )
    let paddingSpaces = g:obj["options"]["paddingSpaces"]

    let paddingString = ""
    for i in range( paddingSpaces )
        let paddingString = paddingString . " "
    endfor

    let newValuesArray = a:valuesArray + [ "", "", paddingString . a:message ]
    return newValuesArray
endfunction
