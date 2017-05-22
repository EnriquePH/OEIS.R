#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_sequence.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  Start: 18/May/2017
#  End:   22/May/2017
#  ----------------------------------------------------------------------------

#  OEIS_sequence
#' Class constructor for \code{OEIS_sequence}
#'
#' @inheritParams OEIS_check
#'
#' @return An object of the class \code{OEIS_sequence}
#' @seealso \code{\link{OEIS_bfile}}
#' @export
#'
#' @examples
#' id <- "A003456"
#' A003456 <- OEIS_sequence(id)
#' A003456
OEIS_sequence <- function(ID){
  OEIS_check(ID)
  seq_xml <- OEIS_xml2(ID)
  seq_df <- OEIS_df(seq_xml)
  structure(list(ID = ID,
                 description = OEIS_description(seq_xml),
                 formerly = OEIS_formerly(seq_xml),
                 url = OEIS_url(ID),
                 bfile = OEIS_bfile(ID),
                 terms = OEIS_terms(seq_xml),
                 offset = OEIS_offset(seq_xml),
                 crossrefs = OEIS_crossrefs(seq_xml),
                 keywords = OEIS_keywords(seq_xml),
                 author = OEIS_author(seq_df),
                 date = OEIS_date(seq_df),
                 status = OEIS_status(seq_df),
                 seq_xml = seq_xml),
            class = c("OEIS_sequence"))
}
