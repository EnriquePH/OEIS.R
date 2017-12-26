#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_formerly.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------


#  OEIS_formerly
#' Get OEIS sequence former \code{ID}
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
#' @return A string with the OEIS former \code{ID} or \code{NULL}, if there is
#'   no former sequence designation.
#'
#' @importFrom magrittr "%>%" extract2
#' @importFrom rvest html_nodes html_text
#'
#' @seealso \code{\link{OEIS_description}}
#' @seealso \code{\link{OEIS_internal_format}}
#' @seealso \code{\link{OEIS_sequence}}
#' @seealso \code{\link{OEIS_xml}}
#'
#' @examples
#' \dontrun{
#' id <- "A000056"
#' internal_format <- OEIS_internal_format(id)
#' OEIS_formerly(internal_format)
#' }
#' @export
OEIS_formerly <- function(x) {
  UseMethod("OEIS_formerly")
}

#' @method OEIS_formerly character
#' @export
OEIS_formerly.character <- function(x) {
  OEIS_check(x) %>%
    OEIS_formerly
}

#' @method OEIS_formerly OEIS_ID
#' @export
OEIS_formerly.OEIS_ID <- function(x) {
  x %>%
    OEIS_internal_format %>%
    OEIS_formerly
}

#' @method OEIS_formerly OEIS_internal
#' @export
OEIS_formerly.OEIS_internal <- function(x) {
  . <- NULL
  formerly <- x[x$tag == "%I", ]$line %>%
    strsplit(., " ") %>%
    unlist %>%
    char0toNULL
    # Detect wrong ID in formerly label: sequence A050055
    if ("%I" %in% formerly) {
      formerly <- NULL
    }
  formerly
}

#' @method OEIS_formerly OEIS_xml
#' @export
OEIS_formerly.OEIS_xml <- function(x) {
  . <- NULL
  x %>%
    rvest::html_nodes(., xpath = "//td/font/text()") %>%
    rvest::html_text(.) %>%
    magrittr::extract2(5) %>%
    regmatches(., gregexpr("(\\w\\d{4})", .)) %>%
    unlist %>%
    char0toNULL
}

#' @method OEIS_formerly OEIS_sequence
#' @export
OEIS_formerly.OEIS_sequence <- function(x) {
  x$formerly
}
