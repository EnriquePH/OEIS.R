#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_author.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_author
#' OEIS sequence authors from sequence\code{internal_format}
#'
#' This function gives the name of the person, or persons, who contributed the
#' sequence and their email if present and selected.
#' @inheritParams OEIS_description
#' @param email A logical if yes author email is returned if present.
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr "%<>%"
#' @importFrom magrittr extract2
#'
#' @seealso \code{\link{OEIS_description}}
#' @seealso \code{\link{OEIS_internal_format}}
#'
#' @return A character vector with the OEIS sequence authors and emails
#' @export
#'
#' @examples
#' \dontrun{
#' id <- "A169890"
#' internal_format <- OEIS_internal_format(id)
#' OEIS_author(internal_format, email = TRUE)
#' }
OEIS_author <- function(internal_format, email = FALSE) {
  . <- NULL
  author <- internal_format[internal_format$tag == "%A",]$line %>%
    gsub(" and ", ",", .) %>%
    strsplit(., ",") %>%
    magrittr::extract2(1) %>%
    trimws %>%
    # Remove dates
    gsub("(\\w{3} \\d{2} \\d{4})", "", .) %>%
    # Remove year if date is not complete
    gsub("(\\d{4})", "", .) %>%
    .[. != ""] %>%
    gsub("_", "", .) %>%
    gsub("\\(AT\\)", "@", .)

  if(email == FALSE) {
    author %<>%
      gsub("(\\(.*\\))", "", .) %>%
      trimws
  }

  if (identical(author, character(0))) {
    # 'dead' sequences have no author
    author <- NULL
  }
  author
}
