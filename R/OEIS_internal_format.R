#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_internal_format.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_internal_format
#' Get sequence internal format
#'
#' In OEIS \strong{internal format}, each sequence, is described by about 10
#' lines, each line beginning %x Aabcdef where x is a letter (I,
#' S, T, N, etc.) and abcdef is the 6-digit identification number (or catalogue
#' number) of the sequence. Each sequence gets a unique A-number.
#'
#' @inheritParams OEIS_check
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr inset
#' @importFrom magrittr set_colnames
#' @importFrom magrittr extract2
#' @importFrom utils read.delim
#'
#' @seealso \code{\link{OEIS_url}}
#' @seealso \code{\link{OEIS_xml}}
#' @seealso \code{\link{OEIS_ID}}
#' @return An object of the classes \code{"data.frame"} and
#'   \code{"OEIS_internal"} with the full sequence text internal format.
#' \code{\link{OEIS_check}}
#'
#' @references \url{https://oeis.org/eishelp1.html}
#'
#' @examples
#' \dontrun{
#' id <- "A000055"
#' OEIS_internal_format(id)
#' }
#' @export
OEIS_internal_format <- function(ID) {
  UseMethod("OEIS_internal_format", ID)
}

#' @method OEIS_internal_format character
#' @export
OEIS_internal_format.character <- function(ID) {
  ID %>%
    OEIS_check %>%
    OEIS_internal_format
}

#' @method OEIS_internal_format OEIS_ID
#' @export
OEIS_internal_format.OEIS_ID <- function(ID) {
  . <- NULL
  header_lines <- 5L
  internal_format <-
    ID %>%
    OEIS_check %>%
    OEIS_url(., text = TRUE) %>%
    utils::read.delim(.,
                      header = FALSE,
                      skip = header_lines) %>%
    magrittr::set_colnames(., c("data")) %>%
    # Extract and append tag
    magrittr::inset("tag",
                    value = gsub("(%\\w{1})*.",
                                 "\\1",
                                 magrittr::extract2(., "data"))) %>%
    # Extract and append line
    magrittr::inset("line",
                    value = gsub(
                      "%\\w{1}\\sA\\d{6}\\s(*.)",
                      "\\1",
                      magrittr::extract2(., "data")
                    )) %>%
    # Delete data column
    magrittr::inset("data", value = NULL) %>%
    # Add sequence ID
    rbind(c("ID", ID), .) %>%
    head(-1) # Remove OEIS End-User License Agreement link

  class(internal_format) <-
    append(class(internal_format), "OEIS_internal")
  internal_format
}
