#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_url.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_url
#' Get sequence url in the OEIS server
#'
#' @inheritParams OEIS_check
#' @param text A logical if `TRUE` the function returns the internal format
#'   url, if `FALSE` it returns full sequence url.
#'
#' @seealso * [OEIS_web_url()]
#' @return A string with the full sequence url, or the internal format url.
#' [OEIS_check()]
#'
#' @references [Internal Format Used In](https://oeis.org/eishelp1.html)
#'
#' @examples
#' OEIS_url("A000055")
#' OEIS_url("A000055", text = TRUE)
#'
#' @export
OEIS_url <- function(ID, text) {
  UseMethod("OEIS_url")
}

#' @method OEIS_url character
#' @export
OEIS_url.character <- function(ID, text = FALSE) {
  . <- NULL
  ID %>%
    OEIS_check %>%
    OEIS_url(., text = text)
}

#' @method OEIS_url OEIS_ID
#' @export
OEIS_url.OEIS_ID <- function(ID, text = FALSE) {
  ifelse(
    text,
    paste0(OEIS_web_url(), "search?q=id:", ID, "&fmt=text"),
    paste0(OEIS_web_url(), ID, "/")
  )
}
