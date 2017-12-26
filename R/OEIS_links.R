#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_links.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_links
#' Links from sequence data-
#'
#' These lines give Mathematica code to produce the sequence.
#' @inheritParams OEIS_description
#'
#' @importFrom magrittr "%>%"
#'
#' @seealso \code{\link{OEIS_description}}
#' @seealso \code{\link{OEIS_author}}
#' @seealso \code{\link{OEIS_internal_format}}
#' @seealso \code{\link{OEIS_formula}}
#' @seealso \code{\link{OEIS_sequence}}
#' @seealso \code{\link{OEIS_xml}}
#' @return A character string with the OEIS sequence lines of links or
#'   \code{NULL} if there are no links
#'
#' @examples
#' \dontrun{
#' id <- "A105805"
#' internal_format <- OEIS_internal_format(id)
#' lnks <- OEIS_links(internal_format)
#' cat(lnks, sep = "\n")
#' }
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
    .[. == "LINKS", ] %>%
    .$Description
  if (identical(lnks, character(0))) {
    lnks <- NULL
  } else {
    lnks %<>%
      strsplit(., "\n") %>%
      sapply(., trimws) %>%
      .[. != "", ]
  }
  lnks
}

#' @method OEIS_links OEIS_sequence
#' @export
OEIS_links.OEIS_sequence <- function(x) {
  x$links
}
