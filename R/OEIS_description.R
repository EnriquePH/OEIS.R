#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_description.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  Start: 18/May/2017
#  End:   22/May/2017
#  ---------------------------------------------------------------------------


#  OEIS_description
#' Get OEIS sequence description from XML document
#'
#' Sequence description gives a brief definition of the sequence. In the
#' description, a(n) usually denotes the n-th term of the sequence, and n is a
#' typical subscript. In some cases however n denotes a typical term in the
#' sequence.
#'
#' @param seq_xml A xml_document from an OEIS sequence
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr extract2
#' @importFrom rvest html_nodes
#'
#' @seealso \code{\link{OEIS_xml2}}
#' @return A string with the OEIS sequence description
#' @export
#'
#' @examples
#' id <- "A000056"
#' test_seq_xml <- OEIS_xml2(id)
#' OEIS_description(test_seq_xml)
OEIS_description <- function(seq_xml) {
  . <- NULL
  seq_xml %>%
    rvest::html_nodes(. , xpath = "//td/text()") %>%
    magrittr::extract2(16) %>%
    gsub("\n", "", .) %>%
    gsub("&lt;", "<", .) %>%
    gsub("&gt;", ">", .) %>%
    trimws
}
