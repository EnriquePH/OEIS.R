#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_xml2.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_xml2
#' Get sequence content from OEIS web as an XML document
#'
#' The XML document contains all the information from the OEIS web related to
#' the sequence.
#' @inheritParams OEIS_check
#'
#' @importFrom magrittr "%>%"
#' @importFrom xml2 read_html
#' @seealso \code{\link{OEIS_url}}
#' @seealso \code{\link{OEIS_check}}
#' @return \code{xml_document} from OEIS web with the sequence content
#' @export
#'
#' @examples
#'  id <- "A000156"
#'  test_seq_html <- OEIS_xml2(id)
OEIS_xml2 <- function(ID) {
  . <- NULL
  OEIS_check(ID)
  ID %>%
    OEIS_url %>%
    xml2::read_html(.)
}
