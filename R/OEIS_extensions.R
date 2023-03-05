#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_extensions.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_extensions
#' OEIS sequence extensions from sequence \code{internal_format}
#'
#' This field is to claim credit for additions to the entry that can't be
#' properly acknowledged in other fields. The most common use is to acknowledge
#' more terms for sequences that had only a few previously.
#'
#' @inheritParams OEIS_description
#'
#' @seealso * \code{\link{OEIS_description}}
#' @seealso * \code{\link{OEIS_internal_format}}
#' @seealso * \code{\link{OEIS_sequence}}
#' @seealso * \code{\link{OEIS_example}}
#' @importFrom magrittr "%>%" "%<>%"
#'
#' @note \href{http://oeis.org/wiki/Style_Sheet}{OEIS Wiki: Style sheet for
#'   Style sheet for contributors}
#' @return A character string with the OEIS sequence extensions lines or
#'   \code{NULL} if there are no extensions.
#' @export
#'
#' @examples
#' # A008406: Triangle T(n,k) read by rows, giving number of graphs with n nodes
#' # (n >= 1) and k edges (0 <= k <= n(n-1)/2).
#' id <- "A008406"
#' internal_format <- OEIS_internal_format(id)
#' extensions <- OEIS_extensions(internal_format)
#' cat(extensions, sep = "\n")

OEIS_extensions <- function(x) {
  UseMethod("OEIS_extensions", x)
}

#' @method OEIS_extensions character
#' @export
OEIS_extensions.character <- function(x) {
  OEIS_check(x)
  extensions <- x %>%
    OEIS_internal_format %>%
    OEIS_extensions
  if (identical(extensions, character(0))) {
    extensions <- NULL
  }
  extensions
}

#' @method OEIS_extensions OEIS_internal
#' @export
OEIS_extensions.OEIS_internal <- function(x) {
  . <- NULL
  extensions <- x[x$tag == "%E", ]$line %>%
    gsub("_", "", .)
  if (identical(extensions, character(0))) {
    extensions <- NULL
  }
  extensions
}

#' @method OEIS_extensions OEIS_xml
#' @export
OEIS_extensions.OEIS_xml <- function(x) {
  . <- NULL
  extensions <- x %>%
    OEIS_df %>%
    .[. == "EXTENSIONS", ] %>%
    .$Description
  if (identical(extensions, character(0))) {
    extensions <- NULL
  } else {
    extensions %<>%
    strsplit(., "\n") %>%
    sapply(., trimws)
  }
  extensions
}

#' @method OEIS_extensions OEIS_sequence
#' @export
OEIS_extensions.OEIS_sequence <- function(x) {
  x$extensions
}
