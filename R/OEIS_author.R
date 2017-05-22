#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_author.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  Start: 18/May/2017
#  End:   22/May/2017
#  ---------------------------------------------------------------------------

#  OEIS_author
#' OEIS sequence author from \code{seq_df} \code{data.frame}
#'
#' This function gives the name of the person or persons who contributed the
#' sequence.
#' @param seq_df A \code{data.frame} with sequence content
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr extract2
#'
#' @seealso \code{\link{OEIS_df}}
#' @seealso \code{\link{OEIS_xml2}}
#'
#' @return A character vector with the OEIS sequence author
#' @export
#'
#' @examples
#' id <- "A000108"
#' test_seq_html <- OEIS_xml2(id)
#' seq_df <- OEIS_df(test_seq_html)
#' OEIS_author(seq_df)
OEIS_author <- function(seq_df) {
  . <- NULL
  author <- seq_df[seq_df$Line == "AUTHOR",]$Description %>%
    strsplit(., ",") %>%
    unlist %>%
    magrittr::extract2(1)
  # 'dead' sequences has no author
  if (identical(author, character(0))) {
    author <- NULL
  }
  author
}
