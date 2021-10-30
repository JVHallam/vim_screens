# What's going on:

# Phase 1 screens needs:
* Be given x files
* When i hit the right key, it loads the next one
* When i hit the left key, it loads the previous one
* When i hit the final page, and hit the right key, It closes.

# Project structure:
* src/index.vim
    * Contains all the exported files

* test.ps1:

# Builds
* As of right now, builds are just me copying and pasting the files into the next project


---------------------------------------------------------------------------

# Old notes

* We load up a page
* Page has an exercise on it
* when i hit down, it gives solution
* when i hit right, the next one loads
* ( optional ) when i hit left, the previous one loads
* ( optional ) when i hit up, the exercise is skipped, and moved along in the process

* to do:
    * I could load the entire application state ( the exercise rotation ) into a variable
    * Modularise the setup and loading code
    * have the state be updated on exercise load
    * re-design the algorithm? - no, it's a pretty solid algo idea
        * if each filename is unique, which it should well be, then it shouldn't be a problem to use the names like keys
    * have hint set a flag, that's activated on advance
    * close on the final one
    * maybe put ( 1 / x ) at the top

* the flow
    * i run the sourced file
    * it checks if the temp file state is there
    * creates it if not
    * loads the file's state into memory
    * selects the 3 unique exercises for today
    * puts those into the variable
    * runs like normal
    * on advance, check if the hint flag has been set
    * reset the hint flag
    * if the hint flag has been set, move exercise to the top of the temp file list
    * if it's not, then do nothing
    * upon closing the application
    * rotate the temp file list, so that the last exercise is now at the top
        * Sounds Sketch, there must be a better way to do this
    * dump the contents of the variable to the temp state file
    * done
