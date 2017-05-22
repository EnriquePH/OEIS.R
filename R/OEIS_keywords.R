#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_keywords.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  Start: 18/May/2017
#  End:   22/May/2017
#  ---------------------------------------------------------------------------


#  OEIS_keywords
#' OEIS sequence keywords from XML document
#'
#' These lines give keywords describing the sequence.
#' The actual keywords in use can be found at:
#' \href{https://oeis.org/eishelp2.html}{Explanation of Terms Used}
#'
#' @inheritParams OEIS_description
#'
#' @importFrom magrittr "%>%"
#' @importFrom rvest html_text
#' @importFrom rvest html_nodes
#' @seealso \code{\link{OEIS_xml2}}
#' @return A character vector with the OEIS sequence keywords
#' @export
#'
#' @examples
#' id <- "A000012"
#' test_seq_html <- OEIS_xml2(id)
#' OEIS_keywords(test_seq_html)
OEIS_keywords <- function(seq_xml) {
  . <- NULL
  seq_xml %>%
    rvest::html_nodes(. , xpath = "//tt/span") %>%
    rvest::html_text(.)
}
