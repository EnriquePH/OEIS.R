#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_terms.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_terms
#' Get OEIS sequence terms from `XML`` document.
#'
#' This is the data included in the sequence. These lines give the beginning of
#' the sequence. Ideally the entry gives enough terms to fill about three lines
#' on the screen. The terms must be integers. If the terms are fractions, then
#' the numerators and denominators appear as separate sequences, labeled with
#' the Keyword "frac", and with links connecting the two sequences. Only
#' sequences that are well-defined and of general interest are included
#'
#' @inheritParams OEIS_description
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr extract2
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#' @seealso \code{\link{OEIS_internal_format}}
#' @seealso \code{\link{OEIS_sequence}}
#' @seealso \code{\link{OEIS_bfile}}
#' @seealso \code{\link{OEIS_xml}}
#' @return A character list with the OEIS sequence terms.
#'
#' @note For more terms see \code{\link{OEIS_bfile}}.
#' @examples
#' \dontrun{
#' # Wieferich primes: primes p such that p^2 divides 2^(p-1) - 1.
#' id <- "A001220"
#' internal_format <- OEIS_internal_format(id)
#' OEIS_terms(internal_format)
#' }
#' @export
OEIS_terms <- function(x) {
  UseMethod("OEIS_terms", x)
}

#' @method OEIS_terms character
#' @export
OEIS_terms.character <- function(x) {
  x %>%
    OEIS_check %>%
    OEIS_terms
}

#' @method OEIS_terms OEIS_ID
#' @export
OEIS_terms.OEIS_ID <- function(x) {
  x %>%
    OEIS_internal_format %>%
    OEIS_terms
}

#' @method OEIS_terms OEIS_internal
#' @export
OEIS_terms.OEIS_internal <- function(x) {
  . <- NULL
  tags <- c("%S", "%T", "%U")
  sapply(tags, function(tag)
    x[x$tag == tag, ]$line) %>%
    unlist %>%
    paste0(., collapse = "") %>%
    strsplit(., ",") %>%
    unlist
}

#' @method OEIS_terms OEIS_xml
#' @export
OEIS_terms.OEIS_xml <- function(x) {
    . <- NULL
    x %>%
      rvest::html_nodes(., xpath = "//tt/text()") %>%
      magrittr::extract2(1) %>%
      rvest::html_text(.) %>%
      strsplit(., ",") %>%
      lapply(., trimws) %>%
      unlist
}

#' @method OEIS_terms OEIS_sequence
#' @export
OEIS_terms.OEIS_sequence <- function(x) {
  x$terms
}
