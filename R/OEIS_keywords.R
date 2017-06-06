#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_keywords.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_keywords
#' OEIS sequence keywords from sequence \code{internal_format}
#'
#' These lines give keywords describing the sequence.
#' The actual keywords in use can be found at:
#' \href{https://oeis.org/eishelp2.html}{Explanation of Terms Used}
#'
#' @inheritParams OEIS_author
#'
#' @importFrom magrittr "%>%"
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#'
#' @seealso \code{\link{OEIS_author}}
#' @seealso \code{\link{OEIS_sequence}}
#' @seealso \code{\link{OEIS_internal_format}}
#' @return A character vector with the OEIS sequence keywords.
#'
#' @examples
#' \dontrun{
#' id <- "A000012"
#' internal_format <- OEIS_internal_format(id)
#' OEIS_keywords(internal_format)
#' }
#' @export
OEIS_keywords <- function(x) {
  UseMethod("OEIS_keywords", x)
}

#' @method OEIS_keywords character
#' @export
OEIS_keywords.character <- function(x) {
  OEIS_check(x)
  x %>%
    OEIS_internal_format %>%
    OEIS_keywords
}

#' @method OEIS_keywords OEIS_internal
#' @export
OEIS_keywords.OEIS_internal <- function(x) {
  . <- NULL
  x[x$tag == "%K", ]$line %>%
    strsplit(., ",") %>%
    unlist
}

#' @method OEIS_keywords OEIS_xml
#' @export
OEIS_keywords.OEIS_xml <- function(x) {
  . <- NULL
  x %>%
    rvest::html_nodes(., xpath = "//tt/span") %>%
    rvest::html_text(.)
}

#' @method OEIS_keywords OEIS_sequence
#' @export
OEIS_keywords.OEIS_sequence <- function(x) {
  x$keywords
}
