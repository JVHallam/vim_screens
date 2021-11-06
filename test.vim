exec "source ./src/index.vim"

let filePaths = globpath('./resources/exercises', "*")->split("\n")
echo filePaths
let a = Init(filePaths)
