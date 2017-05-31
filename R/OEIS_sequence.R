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
#' @param ... Numeric, complex, or logical vectors.
#'
#' @return An object of the S3 class \code{OEIS_sequence}
#' @seealso \code{\link{OEIS_bfile}}
#' @seealso \code{\link{OEIS_check}}
#' @seealso \code{\link{OEIS_description}}
#' @seealso \code{\link{OEIS_xml2}}
#' @seealso \code{\link{OEIS_internal_format}}
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
OEIS_sequence <- function(ID, ...){
  OEIS_check(ID)
  seq_xml <- OEIS_xml2(ID)
  seq_df <- OEIS_df(seq_xml)
  internal_format <- OEIS_internal_format(ID)
  structure(list(ID = ID,
                 url = OEIS_url(ID),
                 description = OEIS_description(internal_format),
                 formerly = OEIS_formerly(internal_format),
                 bfile = OEIS_bfile(ID),
                 terms = OEIS_terms(internal_format),
                 offset = OEIS_offset(internal_format),
                 example = OEIS_example(internal_format),
                 formula = OEIS_formula(internal_format),
                 crossrefs = OEIS_crossrefs(seq_xml),
                 keywords = OEIS_keywords(internal_format),
                 author = OEIS_author(internal_format, email = ...),
                 date = OEIS_date(seq_df),
                 status = OEIS_status(seq_df),
                 internal_format = internal_format,
                 seq_df = seq_df,
                 seq_xml = seq_xml),
            class = c("OEIS_sequence"))
}
