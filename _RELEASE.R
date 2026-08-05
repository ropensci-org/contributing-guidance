# Steps for rendering and releasing the rOpenSci Contributing Guide

# This guide is setup as an R package to control required dependencies and provide 
# functions used in it's creation (i.e. `citation()`).

# Review Book Structure and Design
file.edit("DESIGN.md")
file.edit("ACTIONS.md")

# Local Preview ---------------------------------------------------------------

# To update and preview this guide locally, the package first needs to be built
# then the book compiled.

devtools::install(quick = TRUE) # Or Ctrl-Shift-B
quarto::quarto_render()  # Also can be run in terminal as `quarto render`

# You can preview by opening the _book/index.html in your browser (note that this
# is .gitignored, the online version is built in a GitHub Action)
browseURL("docs/index.html")

# Release ---------------------------------------------------------------------

## TO DO
# - Make changes
# - Update *Authors*, *Year* and *Version* in DESCRIPTION
file.edit("DESCRIPTION")

# - Update *Authors* `author: ` key in _quarto.yml  (TODO: Could be programmatic...)
file.edit("_quarto.yml")

# - Update news.qmd
file.edit("news.qmd")

# - Update README.md
devtools::build_readme()

# - Check links (adapted from roblog::ro_check_urls)
check_links()


# - Build Package, Book & preview
devtools::install(quick = TRUE) # Or Ctrl-Shift-B
quarto::quarto_render()         # Also can be run in terminal as `quarto render`
browseURL("docs/index.html")    # Preview changes

# - Merge PR and create Release
browserURL("https://github.com/ropensci-org/contributing-guidance/releases")