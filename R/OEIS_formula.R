#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_formula.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_formula
#' OEIS sequence formula from \code{seq_df} \code{data.frame}
#'
#' These lines give formulae, recurrences, generating functions, etc. for the
#' sequence.
#' \strong{a(n)} usually denotes the n-th term of the sequence, and \strong{n}
#' is a typical subscript.
#' @inheritParams OEIS_status
#'
#' @seealso \code{\link{OEIS_df}}
#' @seealso \code{\link{OEIS_xml2}}
#' @seealso \code{\link{OEIS_example}}
#' @importFrom magrittr "%>%"
#' @return A character string with the OEIS sequence formula or \code{NULL} if
#'   there are no formula.
#' @export
#'
#' @examples
#' \dontrun{
#' id <- "A010108"
#' test_seq_html <- OEIS_xml2(id)
#' seq_df <- OEIS_df(test_seq_html)
#' example <- OEIS_formula(seq_df)
#' cat(example)
#' }
OEIS_formula <- function(seq_df) {
  . <- NULL
  seq_df <- seq_df[seq_df$Line == "FORMULA", ]$Description
  if (identical(seq_df, character(0))) {
    seq_df <- NULL
  } else {
    seq_df %>%
    strsplit(., "\n") %>%
    sapply(., trimws, USE.NAMES = FALSE) %>%
    .[. != ""] %>%
    paste0(., collapse = "\n")
  }
  seq_df
}
