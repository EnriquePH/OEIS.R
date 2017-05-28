#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_example.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_example
#' OEIS sequence example from \code{seq_df} \code{data.frame}
#'
#' These lines give expanded information or examples to illustrate the initial
#' terms of the sequence.
#' @inheritParams OEIS_status
#'
#' @seealso \code{\link{OEIS_df}}
#' @seealso \code{\link{OEIS_xml2}}
#' @importFrom magrittr "%>%"
#' @return A character string with the OEIS sequence examples or \code{NULL} if
#'   there are no examples.
#' @export
#'
#' @examples
#' \dontrun{
#' id <- "A000108"
#' test_seq_html <- OEIS_xml2(id)
#' seq_df <- OEIS_df(test_seq_html)
#' example <- OEIS_example(seq_df)
#' cat(example)
#' }
OEIS_example <- function(seq_df) {
  . <- NULL
  seq_df <- seq_df[seq_df$Line == "EXAMPLE", ]$Description
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
