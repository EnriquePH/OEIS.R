#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_xml.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_xml
#' Retrieves content from OEIS web as an `XML` document
#'
#' The `XML` document contains all the information from the OEIS web related to
#' the sequence.
#' @inheritParams OEIS_check
#'
#' @importFrom magrittr "%>%"
#' @importFrom xml2 read_html
#' @seealso * \code{\link{OEIS_url}}
#' @seealso * \code{\link{OEIS_check}}
#' @return An \code{OEIS_xml} S3 class and \code{xml_document} from OEIS web
#'   with the sequence content.
#'
#' @examples
#'
#'  id <- "A000156"
#'  test_seq_xml <- OEIS_xml(id)
#'  class(test_seq_xml)
#'
#' @export
OEIS_xml <- function(ID) {
  UseMethod("OEIS_xml")
}

#' @method OEIS_xml character
#' @export
OEIS_xml.character <- function(ID) {
  ID %>%
    OEIS_check %>%
    OEIS_xml
}

#' @method OEIS_xml OEIS_ID
#' @export
OEIS_xml.OEIS_ID <- function(ID) {
  . <- NULL
  seq_xml <- ID %>%
    OEIS_url %>%
    xml2::read_html(.)
  # S3 class "OEIS_xml"
  class(seq_xml) <- append(class(seq_xml), "OEIS_xml")
  seq_xml
}
