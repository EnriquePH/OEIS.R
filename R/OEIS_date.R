#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_date.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------


#  OEIS_date
#' OEIS sequence creation date from \code{data.frame}
#'
#' Sequence creation date.
#' @inheritParams OEIS_description
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr "%<>%"
#' @importFrom magrittr extract
#' @importFrom lubridate parse_date_time
#'
#' @return A \code{Date} object with the OEIS sequence creation date, or
#'   \code{NULL} if no date is found.
#'
#' @examples
#' \dontrun{
#' id <- "A221863"
#' OEIS_date(id)
#'}
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
  date <- x[x$tag == "%A", ]$line
  if (identical(date, character(0))) {
    # 'dead' sequences have no author and no date
    date <- NULL
  } else {
    date %<>%
      strsplit(., ",") %>%
      unlist %>%
      trimws %>%
      extract(-1)
    if (identical(date, character(0))) {
      date <- NULL
    } else {
      date %<>%
        # Parse complete dates or just year.
        lubridate::parse_date_time(., c("mdY", "Y"), locale = "C") %>%
        as.Date(.)
    }
  }
  date
}

#' @method OEIS_date OEIS_xml
#' @export
OEIS_date.OEIS_xml <- function(x) {
  . <- NULL
  seq_df <- OEIS_df(x)
  date <- seq_df[seq_df$Line == "AUTHOR", ]$Description
  if (identical(date, character(0))) {
    # 'dead' sequences have no author and no date
    date <- NULL
  } else {
    date %<>%
      strsplit(., ",") %>%
      unlist %>%
      trimws %>%
      extract(-1)
    if (identical(date, character(0))) {
      date <- NULL
    } else {
      date %<>%
        lubridate::parse_date_time(., c("mdY", "Y"), locale = "en_US.utf8") %>%
        as.Date(.)
    }
  }
  date
}

#' @method OEIS_date OEIS_sequence
#' @export
OEIS_date.OEIS_sequence <- function(x) {
  x$date
}
