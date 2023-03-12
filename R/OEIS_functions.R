#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_functions.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#' Convert character(0) or list() into NULL
#'
#' Auxiliary internal function.
#' @param x A character
#'
#' @return x or NULL
#'
char0toNULL <- function(x) {
  if (identical(x, character(0))) {
    x <- NULL
  }
  if (identical(x, list())) {
    x <- NULL
  }
  x
}
