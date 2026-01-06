#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_url_search.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#' Find url to search in OEIS a given text
#'
#' @param txt A string with the text to search in OEIS web
#'
#' @return A string with the search url in OEIS
#' @seealso * [OEIS_web_url()]
#' @seealso * [OEIS_sequence()]
#' @export
#'
#' @examples
#' search_txt <- "Numbers n with property that in base 4 representation"
#' OEIS_search_url(search_txt)
OEIS_search_url <- function(txt) {
  . <- NULL
  search_OEIS_API <- "search?q="
  txt %>%
    strsplit(" ") %>%
    unlist() %>%
    paste(., collapse  = "+") %>%
    paste0(OEIS_web_url(), search_OEIS_API, .)
}
