#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_links.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_links
#' Links from sequence data
#'
#' Links related to the sequence.
#' @inheritParams OEIS_description
#'
#'
#' @seealso * [OEIS_description()]
#' @seealso * [OEIS_author()]
#' @seealso * [OEIS_internal_format()]
#' @seealso * [OEIS_formula()]
#' @seealso * [OEIS_sequence()]
#' @seealso * [OEIS_xml()]
#' @return A character string with the OEIS sequence lines of links or
#'   `NULL` if there are no links
#'
#' @examples
#' id <- "A105805"
#' internal_format <- OEIS_internal_format(id)
#' lnks <- OEIS_links(internal_format)
#' cat(lnks, sep = "\n")
#'
#' @export
OEIS_links <- function(x) {
  UseMethod("OEIS_links", x)
}

#' @method OEIS_links character
#' @export
OEIS_links.character <- function(x) {
  x %>%
    OEIS_check %>%
    OEIS_links
}

#' @method OEIS_links OEIS_ID
#' @export
OEIS_links.OEIS_ID <- function(x) {
  x %>%
    OEIS_internal_format %>%
    OEIS_links %>%
    char0toNULL
}

#' @method OEIS_links OEIS_internal
#' @export
OEIS_links.OEIS_internal <- function(x) {
  . <- NULL
  x[x$tag == "%H", ]$line %>%
    gsub("_", "", .) %>%
    char0toNULL
}

#' @method OEIS_links OEIS_xml
#' @export
OEIS_links.OEIS_xml <- function(x) {
  . <- NULL
  lnks <- x %>%
    OEIS_df %>%
    .[.$Line == "LINKS", ] %>%
    .$Description
  if (identical(lnks, character(0))) {
    lnks <- NULL
  } else {
    lnks %<>%
      strsplit(., "\n") %>%
      .[. != "", ]
  }
  lnks
}

#' @method OEIS_links OEIS_sequence
#' @export
OEIS_links.OEIS_sequence <- function(x) {
  x$links
}
