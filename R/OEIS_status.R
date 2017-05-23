#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_status.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_status
#' OEIS sequence status from \code{seq_df} \code{data.frame}
#'
#' Status depends on sequence information updates.
#' @param seq_df A \code{data.frame} with sequence content.
#'
#' @seealso \code{\link{OEIS_df}}
#' @seealso \code{\link{OEIS_xml2}}
#'
#' @return A character string with the OEIS sequence status
#' @note status can be: "approved", "editing", "proposed" or "reviewed"
#' @export
#'
#' @examples
#' \dontrun{
#' id <- "A000108"
#' test_seq_html <- OEIS_xml2(id)
#' seq_df <- OEIS_df(test_seq_html)
#' OEIS_status(seq_df)
#' }
OEIS_status <- function(seq_df) {
  seq_df[seq_df$Line == "STATUS", ]$Description
}
