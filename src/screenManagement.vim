" Delete everything in the current buffer
function ClearBuffer()
    :%! echo ""
    call deletebufline(bufnr(), 1, line("$"))
endfunction

" Copy the file contents into the current buffer
function RenderExercise( templatePath="" )
    let values = readfile( a:templatePath )
    call append( 0, values )
endfunction
