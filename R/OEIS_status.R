#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_status.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_status
#' Get OEIS sequence status
#'
#' Status depends on sequence information updates.
#' @param x Can be one of the following:
#' * A character string with sequence \code{ID}.
#' * A S3 classes object \code{"OEIS_xml"} and \code{"xml_document"}, with
#' sequence content from OEIS web.
#' * An object of \code{"OEIS_sequence"} class, that contains all sequence
#' related data.
#' @md
#'
#' @seealso \code{\link{OEIS_df}}
#' @seealso \code{\link{OEIS_xml2}}
#'
#' @return A character string with the OEIS sequence status.
#' @note status can be: "approved", "editing", "proposed" or "reviewed".
#' @note status can not be obtained from \code{"OEIS_internal"} class.
#'
#' @examples
#' \dontrun{
#' id <- "A000108"
#' test_seq_html <- OEIS_xml2(id)
#' seq_df <- OEIS_df(test_seq_html)
#' OEIS_status(seq_df)
#' }
#' @export
OEIS_status <- function(x) {
  UseMethod("OEIS_status")
}

#' @method OEIS_status character
#' @export
OEIS_status.character <- function(x) {
  . <- NULL
  OEIS_check(x)
  x %>%
    OEIS_xml2 %>%
    OEIS_status
}

#' @method OEIS_status OEIS_xml
#' @export
OEIS_status.OEIS_xml <- function(x) {
  . <- NULL
  seq_df <- OEIS_df(x)
  seq_df[seq_df$Line == "STATUS", ]$Description
}

#' @method OEIS_status OEIS_sequence
#' @export
OEIS_status.OEIS_sequence <- function(x) {
  x$status
}
