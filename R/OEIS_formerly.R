#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_formerly.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------


#  OEIS_formerly
#' Get OEIS sequence former \code{ID} from \code{xml2} data
#'
#' This is an alternate \code{ID} for some sequences that also have a 4-digit
#' M-number, such as M1459, which is the number they carried in "The
#' Encyclopedia of Integer Sequences" by N.J.A. Sloane and S. Plouffe, Academic
#' Press, San Diego, CA, 1995. 'Some older sequences also have a 4-digit
#' N-number, such as N0577, which is the number they carried in the "Handbook of
#' Integer Sequences", by N. J. A. Sloane, Academic Press, NY, 1973
#'
#' @inheritParams OEIS_description
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr extract2
#' @importFrom rvest html_nodes
#'
#' @return A string with the OEIS former \code{ID} or \code{NULL}, if there is
#'   no former sequence designation.
#' @seealso \code{\link{OEIS_description}}
#' @seealso \code{\link{OEIS_xml2}}
#' @export
#'
#' @examples
#' id <- "A000056"
#' test_seq_xml <- OEIS_xml2(id)
#' OEIS_formerly(test_seq_xml)
OEIS_formerly <- function(seq_xml) {
  . <- NULL
  formerly <- seq_xml %>%
    rvest::html_nodes(., xpath = "//td/font/text()") %>%
    rvest::html_text(.) %>%
    magrittr::extract2(5) %>%
    regmatches(., gregexpr("(\\w\\d{4})", .)) %>%
    unlist
  if (identical(formerly, character(0))) {
    formerly <- NULL
  }
  formerly
}
