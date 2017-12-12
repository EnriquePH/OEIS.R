#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_keywords.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_keywords
#' OEIS sequence keywords from sequence \code{internal_format}
#'
#' These lines give keywords describing the sequence.
#' The actual keywords, in use, can be found at:
#' \href{https://oeis.org/eishelp2.html}{Explanation of Terms Used}
#'
#' @inheritParams OEIS_author
#'
#' @importFrom magrittr "%>%"
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#'
#' @seealso \code{\link{OEIS_author}}
#' @seealso \code{\link{OEIS_sequence}}
#' @seealso \code{\link{OEIS_internal_format}}
#' @seealso \code{\link{OEIS_xml}}
#' @return A character vector with the OEIS sequence keywords.
#'
#' @examples
#' \dontrun{
#' id <- "A049323"
#' seq <- OEIS_sequence(id)
#' xml <- OEIS_xml(id)
#' frmt <- OEIS_internal_format(id)
#  # Keywords from sequence ID
#' OEIS_keywords(id)
#' # Keywords from "OEIS_sequence" class
#' OEIS_keywords(seq)
#' # Keywords from "OEIS_xml"
#' OEIS_keywords(xml)
#' # Keywords from internal format: "OEIS_internal" class
#' OEIS_keywords(frmt)
#' }
#' @export
OEIS_keywords <- function(x) {
  UseMethod("OEIS_keywords", x)
}

#' @method OEIS_keywords character
#' @export
OEIS_keywords.character <- function(x) {
  OEIS_check(x)
  x %>%
    OEIS_internal_format %>%
    OEIS_keywords
}

#' @method OEIS_keywords OEIS_internal
#' @export
OEIS_keywords.OEIS_internal <- function(x) {
  . <- NULL
  x[x$tag == "%K", ]$line %>%
    strsplit(., ",") %>%
    unlist
}

#' @method OEIS_keywords OEIS_xml
#' @export
OEIS_keywords.OEIS_xml <- function(x) {
  . <- NULL
  x %>%
    rvest::html_nodes(., xpath = "//tt/span") %>%
    rvest::html_text(.)
}

#' @method OEIS_keywords OEIS_sequence
#' @export
OEIS_keywords.OEIS_sequence <- function(x) {
  x$keywords
}
