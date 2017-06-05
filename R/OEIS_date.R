#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_date.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------


#  OEIS_date
#' OEIS sequence date from \code{data.frame}
#'
#' Sequence creation date.
#' @inheritParams OEIS_status
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr extract2
#' @importFrom lubridate mdy
#'
#' @return A \code{Date} object with the OEIS sequence date or \code{NULL} if it
#'   is not found.
#' @export
#'
#' @examples
#' id <- "A221863"
#' test_seq_html <- OEIS_xml2(id)
#' seq_df <- OEIS_df(test_seq_html)
#' OEIS_date(seq_df)
OEIS_date <- function(seq_df) {
  . <- NULL
  date <- seq_df[seq_df$Line == "AUTHOR", ]$Description %>%
    strsplit(., ",") %>%
    unlist
  if (length(date) == 1) {
    date <- NULL
  } else {
    date <- date %>%
      magrittr::extract2(2) %>%
      trimws %>%
      lubridate::mdy(., locale = "en_US.utf8")
  }
  date
}
