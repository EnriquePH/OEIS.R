#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_offset.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  Start: 18/May/2017
#  End:   21/May/2017
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
#' @importFrom magrittr extract2
#' @importFrom rvest html_text
#' @importFrom rvest html_nodes
#' @seealso \code{\link{OEIS_xml2}}
#' @references \url{https://oeis.org/eishelp2.html#RS}
#'
#' @return A numeric vector with the OEIS sequence distinct offsets
#' @export
#'
#' @examples
#' id <- "A000023"
#' test_seq_html <- OEIS_xml2(id)
#' OEIS_offset(test_seq_html)
OEIS_offset <- function(seq_xml) {
  . <- NULL
  seq_xml %>%
    rvest::html_nodes(., xpath = "//tt/text()") %>%
    magrittr::extract2(2) %>%
    rvest::html_text(., trim = TRUE) %>%
    strsplit(., ",") %>%
    unlist %>%
    as.numeric
}
