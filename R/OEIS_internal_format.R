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
#' @importFrom magrittr "%<>%"
#' @importFrom magrittr set_colnames
#' @importFrom rvest html_text
#' @importFrom rvest html_nodes
#' @importFrom xml2 read_html
#' @importFrom utils read.delim
#' @importFrom utils tail
#' @importFrom utils head
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
#' @export
#'
#' @examples
#' \dontrun{
#' id <- "A000055"
#' OEIS_internal_format(id)
#' }
OEIS_internal_format <- function(ID) {
  . <- NULL
  OEIS_check(ID)
  internal_format <-
    ID  %>%
    OEIS_url(., text = TRUE) %>%
    xml2::read_html(.) %>%
    rvest::html_nodes(., xpath = "//body") %>%
    rvest::html_text(.) %>%
    strsplit(., "\n") %>%
    unlist %>%
    utils::tail(., -5L) %>%
    utils::head(., -2L) %>%
    gsub("(%\\w{1})\\s(A\\d{6})\\s?", "\\1\t", .) %>%
    utils::read.delim(text = .,
                      stringsAsFactors = FALSE,
                      header = FALSE) %>%
    magrittr::set_colnames(c("tag", "line"))
  # Add sequence ID
  internal_format <- rbind(c("ID", ID), internal_format)
  class(internal_format) <- append(class(internal_format), "OEIS_internal")
  internal_format
}
