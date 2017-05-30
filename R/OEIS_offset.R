#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_offset.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------


#  OEIS_offset
#' OEIS sequence offset from \code{xml2} data
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
#' @seealso \code{\link{OEIS_internal_format}}
#' @seealso \code{\link{OEIS_description}}
#' @seealso \code{\link{OEIS_sequence}}
#' @references \url{https://oeis.org/eishelp2.html#RS}
#'
#' @return A character vector with the OEIS sequence distinct offsets
#' @export
#'
#' @examples
#' \dontrun{
#' id <- "A000056"
#' internal_format <- OEIS_internal_format(id)
#' OEIS_offset(internal_format)
#' }
OEIS_offset <- function(internal_format) {
  . <- NULL
  internal_format[internal_format$tag == "%O",]$line %>%
    strsplit(., ",") %>%
    unlist
}
