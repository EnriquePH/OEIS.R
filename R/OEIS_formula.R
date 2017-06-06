#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_formula.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_formula
#' OEIS sequence formula lines from sequence \code{internal_format}
#'
#' These lines give formulae, recurrences, generating functions, etc. for the
#' sequence.
#' \strong{a(n)} usually denotes the n-th term of the sequence, and \strong{n}
#' is a typical subscript.
#' @inheritParams OEIS_description
#'
#' @seealso \code{\link{OEIS_description}}
#' @seealso \code{\link{OEIS_internal_format}}
#' @seealso \code{\link{OEIS_sequence}}
#' @seealso \code{\link{OEIS_example}}
#' @importFrom magrittr "%>%"
#' @importFrom magrittr "%<>%"
#'
#' @return A character string with the OEIS sequence formula lines or
#'   \code{NULL} if there are no formulae.
#' @export
#'
#' @examples
#' \dontrun{
#' id <- "A105805"
#' internal_format <- OEIS_internal_format(id)
#' formula <- OEIS_formula(internal_format)
#' cat(formula, sep = "\n")
#' }

OEIS_formula <- function(x) {
  UseMethod("OEIS_formula", x)
}

#' @method OEIS_formula character
#' @export
OEIS_formula.character <- function(x) {
  OEIS_check(x)
  formula <- x %>%
    OEIS_internal_format %>%
    OEIS_formula
  if (identical(formula, character(0))) {
    formula <- NULL
  }
  formula
}

#' @method OEIS_formula OEIS_internal
#' @export
OEIS_formula.OEIS_internal <- function(x) {
  . <- NULL
  formula <- x[x$tag == "%F", ]$line %>%
    gsub("_", "", .)
  if (identical(formula, character(0))) {
    formula <- NULL
  }
  formula
}

#' @method OEIS_formula OEIS_xml
#' @export
OEIS_formula.OEIS_xml <- function(x) {
  . <- NULL
  formula <- x %>%
    OEIS_df %>%
    .[. == "FORMULA", ] %>%
    .$Description
  if (identical(formula, character(0))) {
    formula <- NULL
  } else {
    formula %<>%
    strsplit(., "\n") %>%
    sapply(., trimws) %>%
    .[. != "", ]
  }
  formula
}

#' @method OEIS_formula OEIS_sequence
#' @export
OEIS_formula.OEIS_sequence <- function(x) {
  x$formula
}
