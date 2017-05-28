#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_sequence.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ----------------------------------------------------------------------------

#  OEIS_sequence
#' S3 class constructor for \code{OEIS_sequence}
#'
#' @inheritParams OEIS_check
#'
#' @return An object of the S3 class \code{OEIS_sequence}
#' @seealso \code{\link{OEIS_bfile}}
#' @seealso \code{\link{OEIS_check}}
#' @seealso \code{\link{OEIS_description}}
#' @seealso \code{\link{OEIS_xml2}}
#' @seealso \code{\link{OEIS_df}}
#' @export
#'
#' @examples
#' \dontrun{
#' id <- "A003456"
#' A003456 <- OEIS_sequence(id)
#' class(A003456)
#' A003456
#' }
OEIS_sequence <- function(ID){
  OEIS_check(ID)
  seq_xml <- OEIS_xml2(ID)
  seq_df <- OEIS_df(seq_xml)
  structure(list(ID = ID,
                 url = OEIS_url(ID),
                 description = OEIS_description(seq_xml),
                 formerly = OEIS_formerly(seq_xml),
                 bfile = OEIS_bfile(ID),
                 terms = OEIS_terms(seq_xml),
                 offset = OEIS_offset(seq_xml),
                 example = OEIS_example(seq_df),
                 formula = OEIS_formula(seq_df),
                 crossrefs = OEIS_crossrefs(seq_xml),
                 keywords = OEIS_keywords(seq_xml),
                 author = OEIS_author(seq_df),
                 date = OEIS_date(seq_df),
                 status = OEIS_status(seq_df),
                 seq_df = seq_df,
                 seq_xml = seq_xml),
            class = c("OEIS_sequence"))
}
