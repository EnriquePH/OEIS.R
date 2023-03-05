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
#' @param seq_xml A class \code{"OEIS_xml"} document extracted from an OEIS
#'   sequence.
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr extract2
#' @importFrom rvest html_table
#' @importFrom rvest html_nodes
#'
#' @seealso * \code{\link{OEIS_xml}}
#' @seealso * \code{\link{OEIS_sequence}}
#' @references \url{https://oeis.org/eishelp2.html#RS}{Explanation of Terms Used in Reply From}
#' @return A \code{data.frame} with the sequence information lines.
#' @examples
#'
#' id <- "A008406"
#' xml <- OEIS_xml(id)
#' df <- OEIS_df(xml)
#' df
#'
#' @export
OEIS_df <- function(seq_xml) {
  UseMethod("OEIS_df")
}

#' @method OEIS_df OEIS_xml
#' @export
OEIS_df.OEIS_xml <- function(seq_xml) {
  . <- NULL
  seq_df <- seq_xml %>%
    rvest::html_nodes(., xpath = "//tr[5]/td/table") %>%
    rvest::html_table(.) %>%
    magrittr::extract2(1)
  seq_df$X1 <- NULL
  names(seq_df) <- c("Line", "Description")
  seq_df
}
