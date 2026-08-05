check_links <- function() {
  df <- tibble::tibble(
    qmds = list.files(pattern = "qmd", full.names = TRUE),
    text = purrr::map(rmds, ~ try(readLines(.), silent = TRUE)),
    error_read = inherits(text, "try-error")
  )

  if (any(df$error_read)) {
    stop(glue::glue("The file {df$rmds[df$error_read]} could not be read."))
  }

  df_check <- df |>
    dplyr::mutate(
      urls = purrr::map(
        text,
        ~ stringr::str_extract_all(., "http[s]*\\:[^ \\)\\]\"\\>]*")
      ),
      urls = purrr::map(urls, unlist)
    ) |>
    tidyr::unnest(urls) |>
    dplyr::select(qmds, urls) |>
    dplyr::distinct() |>
    dplyr::mutate(ok = purrr::map_lgl(urls, crul::ok, verb = "get"))

  dplyr::filter(df_check, !ok)
}