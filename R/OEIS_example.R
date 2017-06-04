#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_example.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_example
#' OEIS sequence example lines from sequence \code{internal_format}
#'
#' These lines give expanded information or examples to illustrate the initial
#' terms of the sequence.
#' @inheritParams OEIS_author
#'
#' @importFrom magrittr "%>%"
#'
#' @seealso \code{\link{OEIS_description}}
#' @seealso \code{\link{OEIS_internal_format}}
#' @seealso \code{\link{OEIS_formula}}
#' @seealso \code{\link{OEIS_sequence}}
#' @return A character string with the OEIS sequence lines of examples or
#'   \code{NULL} if there are no examples.
#' @export
#'
#' @examples
#' \dontrun{
#' id <- "A105805"
#' internal_format <- OEIS_internal_format(id)
#' example <- OEIS_example(internal_format)
#' cat(example, sep = "\n")
#' }
OEIS_example <- function(x) {
  . <- NULL
  example <- x[x$tag == "%e",]$line %>%
    gsub("_", "", .)
  if (identical(example, character(0))) {
    example <- NULL
  }
  example
}
