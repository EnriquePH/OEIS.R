#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_comments.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_comments
#' OEIS sequence comments lines from sequence `internal_format`
#'
#' The comments field in OEIS sequence entries is for information that does
#' not quite fit in other fields.
#' @inheritParams OEIS_description
#'
#'
#' @seealso * [OEIS_description()]
#' @seealso * [OEIS_author()]
#' @seealso * [OEIS_internal_format()]
#' @seealso * [OEIS_formula()]
#' @seealso * [OEIS_sequence()]
#' @seealso * [OEIS_xml()]
#' @return A character string with the OEIS sequence comments lines from the
#'    sequence or `NULL` if there are no comments.
#'
#' @examples
#' id <- "A105805"
#' internal_format <- OEIS_internal_format(id)
#' example <- OEIS_comments(internal_format)
#' cat(example, sep = "\n")
#'
#' @export
OEIS_comments <- function(x) {
  UseMethod("OEIS_comments", x)
}

#' @method OEIS_comments character
#' @export
OEIS_comments.character <- function(x) {
  OEIS_check(x) %>%
    OEIS_comments
}

#' @method OEIS_comments OEIS_ID
#' @export
OEIS_comments.OEIS_ID <- function(x) {
  x %>%
    OEIS_internal_format %>%
    OEIS_comments %>%
    char0toNULL
}

#' @method OEIS_comments OEIS_internal
#' @export
OEIS_comments.OEIS_internal <- function(x) {
  . <- NULL
  x[x$tag == "%C", ]$line %>%
    gsub("_", "", .) %>%
    char0toNULL
}

#' @method OEIS_comments OEIS_xml
#' @export
OEIS_comments.OEIS_xml <- function(x) {
  . <- NULL
  example <- x %>%
    OEIS_df %>%
    .[. == "COMMENTS", ] %>%
    .$Description
  if (identical(example, character(0))) {
    example <- NULL
  } else {
    example %<>%
      strsplit(., "\n") %>%
      sapply(., trimws) %>%
      .[. != "", ]
  }
  example
}

#' @method OEIS_comments OEIS_sequence
#' @export
OEIS_comments.OEIS_sequence <- function(x) {
  x$example
}
