#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
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
#' @inheritParams OEIS_description
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr extract2
#' @importFrom rvest html_text
#' @importFrom rvest html_nodes
#' @seealso \code{\link{OEIS_xml2}}
#' @return A character list with the OEIS sequence terms.
#' @export
#'
#' @examples
#' id <- "A000056"
#' test_seq_html <- OEIS_xml2(id)
#' OEIS_terms(test_seq_html)
OEIS_terms <- function(seq_xml) {
  . <- NULL
  seq_xml %>%
    rvest::html_nodes(., xpath = "//tt/text()") %>%
    magrittr::extract2(1) %>%
    rvest::html_text(.) %>%
    strsplit(., ",") %>%
    lapply(., trimws) %>%
    unlist
}
