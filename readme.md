# What's this project:

I want to be able to make interactive slideshows in vim.
It's so that i can later extend it to be a better, more interactive part, of my vimrun system.

----------------------------------------------------------------------------

# What's going on:

# Phase 1 screens needs:
* Be given x files
* When i hit the right key, it loads the next one
* When i hit the left key, it loads the previous one
* When i hit the final page, and hit the right key, It closes.

# Project structure:
* src/index.vim
    * Contains all the exported files

* test.ps1/test.vim:
    * test.ps1 is what i run
    * test.vim contains the code to run the scenario
    * This is not an automated test
    * This is me testing by hand
    * I want to run this file, and it just gives me a quick demo of the state that screens is in

# Builds
* As of right now, builds are just me copying and pasting the files into the next project
