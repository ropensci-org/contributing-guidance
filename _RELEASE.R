# Steps for rendering and releasing the rOpenSci Contributing Guide

# This guide is setup as an R package to control required dependencies and provide 
# functions used in it's creation (i.e. `citation()`).


# Local Preview -------------
# To update and preview this guide locally, the package first needs to be built
# then the book compiled.

devtools::install(quick = TRUE) # Or Ctrl-Shift-B
quarto::quarto_render()  # Also can be run in terminal as `quarto render`

# You can preview by opening the _book/index.html in your browser (note that this
# is .gitignored, the online version is built in a GitHub Action)
browseURL("docs/index.html")

# Release --------------------
devtools::build_readme()