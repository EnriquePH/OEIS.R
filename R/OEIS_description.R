#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_description.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------


#  OEIS_description
#' Get OEIS sequence description from \strong{internal format}
#'
#' Sequence description gives a brief definition of the sequence. In the
#' description, a(n) usually denotes the n-th term of the sequence, and n is a
#' typical subscript. In some cases however n denotes a typical term in the
#' sequence.
#'
#' @param x This is a param
#' @seealso \code{\link{OEIS_internal_format}}
#' @seealso \code{\link{OEIS_sequence}}
#'
#' @return A string with the OEIS sequence description
#'
#' @examples
#' \dontrun{
#' id <- "A000056"
#' OEIS_description(id)
#' }
#' @export
OEIS_description <- function(x) {
    UseMethod("OEIS_description", x)
}


#' @method OEIS_description character
#' @export
OEIS_description.character <- function(x) {
  . <- NULL
  OEIS_check(x)
  x %>%
    OEIS_internal_format %>%
    OEIS_description
}

#' @method OEIS_description OEIS_internal
#' @export
OEIS_description.OEIS_internal <- function(x) {
  x[x$tag == "%N", ]$line
}
