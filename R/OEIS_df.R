#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_df.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_df
#' Get OEIS sequence information lines from XML document data
#'
#' This lines are useful to get all the sequence format data.
#' @param seq_xml A class \code{"xml_document"} from an OEIS sequence.
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr extract2
#' @importFrom rvest html_table
#' @importFrom rvest html_nodes
#'
#' @seealso \code{\link{OEIS_xml}}
#' @references \url{https://oeis.org/eishelp2.html#RS}
#' @return A \code{"data.frame"} and \code{"OEIS_df"} S3 class with sequence
#'   information lines.
#' @export
OEIS_df <- function(seq_xml) {
  . <- NULL
  seq_df <- seq_xml %>%
    rvest::html_nodes(., xpath = "//tr[5]/td/table") %>%
    rvest::html_table(., fill = FALSE) %>%
    magrittr::extract2(1)
  seq_df$X1 <- NULL
  names(seq_df) <- c("Line", "Description")
  seq_df
}
