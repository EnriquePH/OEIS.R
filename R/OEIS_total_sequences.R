#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_total_sequences.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: energycode.org@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#' Retrieve the total number of sequences in the OEIS database
#'
#' @return An integer with the total number of sequences, or `NA_integer_`
#'   if the extraction fails or there is no internet connection.
#'
#' @importFrom xml2 read_html
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @seealso * [OEIS_sequence()]
#'
#' @examples
#' \dontrun{
#' OEIS_total_sequences()
#' }
#' @export
OEIS_total_sequences <- function() {
  . <- NULL
  page_text <- try(
    OEIS_web_url() %>%
      xml2::read_html(.) %>%
      rvest::html_nodes(., css = "div.dbinfo") %>%
      rvest::html_text(., trim = TRUE),
    silent = TRUE
  )
  if (inherits(page_text, "try-error") || identical(page_text, character(0))) {
    warning("Unable to connect to OEIS or parse the page.")
    return(NA_integer_)
  }

  match <- regmatches(
    page_text,
    regexpr("Contains ([0-9]+) sequences", page_text)
  )
  if (identical(match, character(0))) {
    warning("Could not find the total number of sequences.")
    return(NA_integer_)
  }
  as.integer(sub(".*Contains ([0-9]+) sequences.*", "\\1", match))
}
