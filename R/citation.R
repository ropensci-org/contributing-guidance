#' Citation for the contributing guide
#'
#' @return Character
#' @export
citation <- function() {
  v <- packageVersion("contributingguidance")
  year <- packageDescription("contributingguidance", fields = "Year")
  authors <- packageDescription("contributingguidance", fields = "Authors@R") |>
    parse(text = _) |>
    eval() |>
    format(include = c("given", "family"))

  if (length(authors) == 2) {
    authors_fmt <- paste0(authors, collapse = " and ")
  } else {
    authors_fmt <- paste0(authors[-length(authors)], collapse = ", ")
    authors_fmt <- paste0(authors_fmt, ", and ", authors[length(authors)])
  }

  paste0(
    authors_fmt,
    ". (",
    year,
    "). rOpenSci Community Contributing Guide (Version v",
    v,
    "). Zenodo. <https://doi.org/10.5281/zenodo.4000531>"
  )
}