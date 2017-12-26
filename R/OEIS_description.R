#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_description.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_description
#' Get OEIS sequence description
#'
#' Sequence description gives a brief definition of the sequence.
#' In the description, \emph{a(n)} usually denotes the n-th term of the
#' sequence, and \emph{n} is a typical subscript.
#' In some cases however \emph{n} denotes a typical term in the sequence.
#'
#' @param x Can be one of the following:
#' * A character string with sequence \code{ID}.
#' * A \code{"OEIS_internal"} S3 class object, with sequence internal format.
#' * A S3 classes object \code{"OEIS_xml"} and \code{"xml_document"}, with
#' sequence content from OEIS web.
#' * An object of \code{"OEIS_sequence"} class, that contains all sequence
#' related data.
#' @md
#'
#' @seealso \code{\link{OEIS_internal_format}}
#' @seealso \code{\link{OEIS_sequence}}
#' @seealso \code{\link{OEIS_xml}}
#' @seealso \code{\link{OEIS_check}}
#'
#' @importFrom magrittr "%>%" extract2
#' @importFrom rvest html_table
#'
#' @return A string with the OEIS sequence description.
#'
#' @examples
#' \dontrun{
#' # Sequence description from ID
#' id <- "A000056"
#' OEIS_description(id)
#'
#' # Alternate example using internal format
#' id <- "A003400"
#' internal_format <- OEIS_internal_format(id)
#' OEIS_description(internal_format)
#'
#' # Sequence description from "OEIS_sequence" class
#'  id <- "A002315"
#'  seq <- OEIS_sequence(id)
#'  OEIS_description(seq)
#'  }
#' @export
OEIS_description <- function(x) {
    UseMethod("OEIS_description")
}

#' @method OEIS_description character
#' @export
OEIS_description.character <- function(x) {
  OEIS_check(x) %>%
    OEIS_description
}

#' @method OEIS_description OEIS_ID
#' @export
OEIS_description.OEIS_ID <- function(x) {
  x %>%
    OEIS_internal_format %>%
    OEIS_description
}

#' @method OEIS_description OEIS_internal
#' @export
OEIS_description.OEIS_internal <- function(x) {
  x[x$tag == "%N", ]$line
}

#' @method OEIS_description OEIS_xml
#' @export
OEIS_description.OEIS_xml <- function(x) {
  . <- NULL
  x %>%
    rvest::html_table(., fill = TRUE) %>%
    magrittr::extract2(6) %>% # Donations open?
    magrittr::extract2(3) %>%
    strsplit(., "\n") %>%
    unlist %>%
    magrittr::extract2(1) %>%
    gsub("&lt;", "<", .) %>%
    gsub("&gt;", ">", .) %>%
    trimws
}

#' @method OEIS_description OEIS_sequence
#' @export
OEIS_description.OEIS_sequence <- function(x) {
  x$description
}
