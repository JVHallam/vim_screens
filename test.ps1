# vim -S ./src/dependency.vim -S ./test.vim

$allIncludes=$(ls src | foreach {$allIncludes=""} {$allInclude += "-S $($_.FullName) "} {echo $allInclude})

Invoke-Expression "vim temp.txt $allIncludes -S ./test.vim"
