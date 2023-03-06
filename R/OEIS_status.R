#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_status.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_status
#' Get OEIS sequence status
#'
#' Status depends on sequence information updates.
#' @param x Can be one of the following:
#' * A character string with sequence \code{ID}.
#' * A S3 object of classes \code{OEIS_xml} and \code{xml_document}, with
#' the sequence content from OEIS web.
#' * An object of \code{OEIS_sequence} class, that contains all sequence
#' related data.
#' * An object of \code{OEIS_ID} class.
#' @importFrom magrittr "%>%"
#' @md
#'
#' @seealso * \code{\link{OEIS_check}}
#' @seealso * \code{\link{OEIS_df}}
#' @seealso * \code{\link{OEIS_xml}}
#'
#' @return A character string with the OEIS sequence status.
#' @note Possible status can be:
#' * "approved"
#' * "editing"
#' * "proposed"
#' * "reviewed".
#'
#' @examples
#' \dontrun{
#' id <- "A000108"
#' test_seq_xml <- OEIS_xml(id)
#' OEIS_status(test_seq_xml)
#'}
#' @export
OEIS_status <- function(x) {
  UseMethod("OEIS_status")
}

#' @method OEIS_status character
#' @export
OEIS_status.character <- function(x) {
  x %>%
    OEIS_check %>%
    OEIS_status
}

#' @method OEIS_status OEIS_ID
#' @export
OEIS_status.OEIS_ID <- function(x) {
  x %>%
    OEIS_xml %>%
    OEIS_status
}

#' @method OEIS_ID OEIS_internal
#' @export
OEIS_status.OEIS_internal <- function(x) {
  x %>%
  OEIS_ID %>%
    OEIS_status
}

#' @method OEIS_status OEIS_xml
#' @export
OEIS_status.OEIS_xml <- function(x) {
  seq_df <- OEIS_df(x)
  seq_df[seq_df$Line == "STATUS", ]$Description
}

#' @method OEIS_status OEIS_sequence
#' @export
OEIS_status.OEIS_sequence <- function(x) {
  x$status
}
