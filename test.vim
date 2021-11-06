" All dependencies are handled by the invoking script.

let filePaths = globpath('./resources/exercises', "*")->split("\n")
echo filePaths
let a = Init(filePaths)
