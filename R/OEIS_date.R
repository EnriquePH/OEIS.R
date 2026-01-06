#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_date.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_date
#' OEIS sequence creation date from `data.frame`
#'
#' Sequence creation date.
#' @inheritParams OEIS_description
#'
#' @importFrom magrittr extract
#' @importFrom lubridate parse_date_time
#'
#' @return A `Date` object with the OEIS sequence creation date, or
#'   `NA` if no date is found.
#'
#' @examples
#' id <- "A221863"
#' OEIS_date(id)
#'
#' @export
OEIS_date <- function(x) {
  UseMethod("OEIS_date", x)
}

#' @method OEIS_date character
#' @export
OEIS_date.character <- function(x) {
  OEIS_check(x) %>%
    OEIS_date
}

#' @method OEIS_date OEIS_ID
#' @export
OEIS_date.OEIS_ID <- function(x) {
  x %>%
    OEIS_internal_format %>%
    OEIS_date
}

#' @method OEIS_date OEIS_internal
#' @export
OEIS_date.OEIS_internal <- function(x) {
  . <- NULL
  seq_date <- x[x$tag == "%A",]$line
  if (identical(seq_date, character(0))) {
    # 'dead' sequences have no author and no date
    seq_date <- NULL
  } else {
    seq_date %<>%
      strsplit(., ",") %>%
      unlist %>%
      trimws %>%
      extract(-1)
    if (identical(seq_date, character(0))) {
      seq_date <- NULL
    } else {
      seq_date %<>%
        # Parse complete dates or just year.
        lubridate::parse_date_time(., c("mdY", "Y"),
                                   quiet = TRUE,
                                   locale = "C") %>%
        as.Date(.)
    }
  }
  seq_date
}

#' @method OEIS_date OEIS_xml
#' @export
OEIS_date.OEIS_xml <- function(x) {
  . <- NULL
  seq_df <- OEIS_df(x)
  seq_date <- seq_df[seq_df$Line == "AUTHOR", ]$Description
  if (identical(seq_date, character(0))) {
    # 'dead' sequences have no author and no date
    seq_date <- NULL
  } else {
    seq_date %<>%
      strsplit(., ",") %>%
      unlist %>%
      trimws %>%
      extract(-1)
    if (identical(seq_date, character(0))) {
      seq_date <- NULL
    } else {
      seq_date %<>%
        lubridate::parse_date_time(.,
                                   c("mdY", "Y"),
                                   quiet = TRUE,
                                   locale = "C") %>%
        as.Date(.)
    }
  }
  seq_date
}

#' @method OEIS_date OEIS_sequence
#' @export
OEIS_date.OEIS_sequence <- function(x) {
  x$date
}
