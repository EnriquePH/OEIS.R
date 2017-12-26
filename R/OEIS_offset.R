#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_offset.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------


#  OEIS_offset
#' OEIS sequence offset from \code{xml2} data.
#'
#' This line usually gives the subscript of the first term in the sequence. If
#' the sequence gives the decimal expansion of a constant, the offset is the
#' number of digits before the decimal point. In the OEIS web internal format,
#' there is a second offset, which says which term (counting from the left, and
#' starting with 1), first exceeds 1 in absolute value. This is set to 1 if all
#' the terms are 0 or +-1
#'
#' @inheritParams OEIS_description
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr extract2
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @seealso \code{\link{OEIS_internal_format}}
#' @seealso \code{\link{OEIS_description}}
#' @seealso \code{\link{OEIS_xml}}
#' @seealso \code{\link{OEIS_sequence}}
#' @references \url{https://oeis.org/eishelp2.html#RS}
#' @references \url{https://oeis.org/FAQ.html#Z23}
#'
#' @note In the internal format for a sequence the offset line (the %O line)
#'   contains two numbers. The first is the offset as just defined. The second
#'   gives the position of first entry greater than or equal to 2 in magnitude
#'   in the sequence (or 1 if no such entry exists), starting counting at 1. The
#'   second offset is used to determine the position of the sequence in the
#'   lexicographic order in the database.
#'
#' @return A character vector with the OEIS sequence offsets.
#'
#' @examples
#' \dontrun{
#' id <- "A000056"
#' internal_format <- OEIS_internal_format(id)
#' OEIS_offset(internal_format)
#' }
#' @export
OEIS_offset <- function(x) {
  UseMethod("OEIS_offset")
}

#' @method OEIS_offset OEIS_internal
#' @export
OEIS_offset.OEIS_internal <- function(x) {
  . <- NULL
  x[x$tag == "%O", ]$line %>%
    strsplit(., ",") %>%
    unlist
}

#' @method OEIS_offset character
#' @export
OEIS_offset.character <- function(x) {
  x %>%
    OEIS_check %>%
    OEIS_offset
}

#' @method OEIS_offset OEIS_ID
#' @export
OEIS_offset.OEIS_ID <- function(x) {
  x %>%
    OEIS_internal_format %>%
    OEIS_offset
}

#' @method OEIS_offset OEIS_xml
#' @export
OEIS_offset.OEIS_xml <- function(x) {
  . <- NULL
  x %>%
    rvest::html_nodes(., xpath = "//tt/text()") %>%
    magrittr::extract2(2) %>%
    rvest::html_text(., trim = TRUE) %>%
    strsplit(., ",") %>%
    unlist
}

#' @method OEIS_offset OEIS_sequence
#' @export
OEIS_offset.OEIS_sequence <- function(x) {
  x$offset
}
