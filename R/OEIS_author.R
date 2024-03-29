#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_author.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_author
#' OEIS sequence authors from \code{internal format}, or from the sequence
#' \code{ID}.
#'
#' This function gives the name of the person, or persons, who contributed the
#' sequence and their emails, if they are present and selected.
#' @inheritParams OEIS_description
#' @param email A logical, by specifying: \code{email = TRUE}, the
#' author's email is returned, if present, with the author's name.
#' The default value of \code{email} is \code{FALSE}.
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr "%<>%"
#'
#' @seealso * \code{\link{OEIS_description}}
#' @seealso * \code{\link{OEIS_internal_format}}
#' @seealso * \code{\link{OEIS_sequence}}
#' @seealso * \code{\link{OEIS_check}}
#'
#' @return A character vector with the OEIS sequence authors and emails.
#'
#' @examples
#' id <- "A169890"
#' OEIS_author(id, email = TRUE)
#'
#' @export
OEIS_author <- function(x, email = FALSE) {
  UseMethod("OEIS_author")
}

#' @method OEIS_author character
#' @export
OEIS_author.character <- function(x, email = FALSE) {
  . <- NULL
  x %>%
    OEIS_check %>%
    OEIS_author(., email)
}

#' @method OEIS_author OEIS_ID
#' @export
OEIS_author.OEIS_ID <- function(x, email = FALSE) {
  . <- NULL
  x %>%
    OEIS_internal_format %>%
    OEIS_author(., email)
}

#' @method OEIS_author OEIS_internal
#' @export
OEIS_author.OEIS_internal <- function(x, email = FALSE) {
  . <- NULL
  author <- x[x$tag == "%A", ]$line
  if (identical(author, character(0))) {
    # 'dead' sequences have no author
    author <- NULL
  } else {
    author    %<>%
      gsub(" and ", ",", .) %>%
      strsplit(., ",") %>%
      unlist %>%
      trimws %>%
      # Remove dates
      gsub("(\\w{3} \\d{2} \\d{4})", "", .) %>%
      # Remove year if date is not complete
      gsub("(\\d{4})", "", .) %>%
      .[. != ""] %>%
      gsub("_", "", .) %>%
      gsub("\\(AT\\)", "@", .)

    if (email == FALSE) {
      author %<>%
        gsub("(\\(.*\\))", "", .) %>%
        trimws
    }
  }
  author
}

#' @method OEIS_author OEIS_xml
#' @export
OEIS_author.OEIS_xml <- function(x, email = FALSE) {
  . <- NULL
  seq_df <- OEIS_df(x)
  author <- seq_df[seq_df$Line == "AUTHOR", ]$Description %>%
    gsub(" and ", ",", .) %>%
    strsplit(., ",") %>%
    unlist %>%
    trimws %>%
    # Remove dates
    gsub("(\\w{3} \\d{2} \\d{4})", "", .) %>%
    # Remove year if date is not complete
    gsub("(\\d{4})", "", .) %>%
    .[. != ""] %>%
    gsub("_", "", .) %>%
    gsub("\\(AT\\)", "@", .)

  if (email == FALSE) {
    author %<>%
      gsub("(\\(.*\\))", "", .) %>%
      trimws
  }
  # 'dead' sequences have no author
  char0toNULL(author)
}

#' @method OEIS_author OEIS_sequence
#' @export
OEIS_author.OEIS_sequence <- function(x, email = FALSE) {
  . <- NULL
  author <- x$author
  if (email == FALSE) {
    author %<>%
      gsub("(\\(.*\\))", "", .) %>%
      trimws
  }
  author
}
