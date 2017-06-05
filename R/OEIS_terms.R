#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_terms.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_terms
#' Get OEIS sequence terms from XML document.
#'
#' This is the data included in the sequence. These lines give the beginning of
#' the sequence. Ideally the entry gives enough terms to fill about three lines
#' on the screen. The terms must be integers. If the terms are fractions, then
#' the numerators and denominators appear as separate sequences, labeled with
#' the Keyword "frac", and with links connecting the two sequences. Only
#' sequences that are well-defined and of general interest are included
#'
#' @inheritParams OEIS_author
#'
#' @importFrom magrittr "%>%"

#' @seealso \code{\link{OEIS_internal_format}}
#' @seealso \code{\link{OEIS_sequence}}
#' @return A character list with the OEIS sequence terms.
#' @export
#'
#' @examples
#' \dontrun{
#' # Wieferich primes: primes p such that p^2 divides 2^(p-1) - 1.
#' id <- "A001220"
#' internal_format <- OEIS_internal_format(id)
#' OEIS_terms(internal_format)
#' }
OEIS_terms <- function(x) {
  . <- NULL
  tags <- c("%S", "%T", "%U")
  sapply(tags, function(tag)
    x[x$tag == tag, ]$line) %>%
    unlist %>%
    paste0(., collapse = "") %>%
    strsplit(., ",") %>%
    unlist
}
