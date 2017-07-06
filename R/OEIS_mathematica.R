#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_mathematica.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_mathematica
#' OEIS Wolfram Mathematica code from sequence \code{internal_format}
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
#' @return A character string with the OEIS sequence lines of examples or
#'   \code{NULL} if there are no examples.
#'
#' @examples
#' \dontrun{
#' id <- "A105805"
#' internal_format <- OEIS_internal_format(id)
#' mathematica <- OEIS_mathematica(internal_format)
#' cat(mathematica, sep = "\n")
#' }
#' @export
OEIS_mathematica <- function(x) {
  UseMethod("OEIS_mathematica", x)
}

#' @method OEIS_mathematica character
#' @export
OEIS_mathematica.character <- function(x) {
  OEIS_check(x)
  mathematica <- x %>%
    OEIS_internal_format %>%
    OEIS_mathematica
  if (identical(mathematica, character(0))) {
    mathematica <- NULL
  }
  mathematica
}

#' @method OEIS_mathematica OEIS_internal
#' @export
OEIS_mathematica.OEIS_internal <- function(x) {
  . <- NULL
  mathematica <- x[x$tag == "%t", ]$line %>%
    gsub("_", "", .)
  if (identical(mathematica, character(0))) {
    mathematica <- NULL
  }
  mathematica
}

#' @method OEIS_mathematica OEIS_xml
#' @export
OEIS_mathematica.OEIS_xml <- function(x) {
  . <- NULL
  mathematica <- x %>%
    OEIS_df %>%
    .[. == "MATHEMATICA", ] %>%
    .$Description
  if (identical(mathematica, character(0))) {
    mathematica <- NULL
  } else {
    mathematica %<>%
      strsplit(., "\n") %>%
      sapply(., trimws) %>%
      .[. != "", ]
  }
  mathematica
}

#' @method OEIS_mathematica OEIS_sequence
#' @export
OEIS_mathematica.OEIS_sequence <- function(x) {
  x$mathematica
}
