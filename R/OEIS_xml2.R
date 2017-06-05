#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
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
#' @return An \code{"OEIS_xml"} S3 class and \code{"xml_document"} from OEIS web
#'   with the sequence content.
#' @export
#'
#' @examples
#' \dontrun{
#'  id <- "A000156"
#'  test_seq_xml <- OEIS_xml2(id)
#'  class(test_seq_xml)
#' }
OEIS_xml2 <- function(ID) {
  . <- NULL
  OEIS_check(ID)
  seq_xml <- ID %>%
    OEIS_url %>%
    xml2::read_html(.)
  # S3 class "OEIS_xml"
  class(seq_xml) <- append(class(seq_xml), "OEIS_xml")
  seq_xml
}
