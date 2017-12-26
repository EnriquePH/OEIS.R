#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_ID.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_ID
#' OEIS sequence authors from \code{internal format}, or from the sequence
#' \code{ID}.
#'
#' This function gives the name of the person, or persons, who contributed the
#' sequence and their emails, if they are present and selected.
#' @param x Can be one of the following:
#' * A character string with sequence \code{ID}.
#' * A \code{"OEIS_internal"} S3 class object, with sequence internal format.
#' * A S3 classes object \code{"OEIS_xml"} and \code{"xml_document"}, with
#' sequence content from OEIS web.
#' * An object of \code{"OEIS_sequence"} class, that contains all sequence
#' related data.
#' * An object of \code{"OEIS_bfile"} class.
#' @md
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr add
#' @importFrom magrittr add extract2
#'
#' @seealso \code{\link{OEIS_description}}
#' @seealso \code{\link{OEIS_internal_format}}
#' @seealso \code{\link{OEIS_sequence}}
#' @seealso \code{\link{OEIS_check}}
#'
#' @return A character string with OEIS sequence ID.
#'
#' @examples
#' \dontrun{
#' id <- "A169890"
#' OEIS_ID(id)
#' }
#' @export
OEIS_ID <- function(x) {
  UseMethod("OEIS_ID")
}

#' @method OEIS_ID character
#' @export
OEIS_ID.character <- function(x) {
  OEIS_check(x)
}

#' @method OEIS_ID OEIS_ID
#' @export
OEIS_ID.OEIS_ID <- function(x) {
  x
}

#' @method OEIS_ID OEIS_internal
#' @export
OEIS_ID.OEIS_internal <- function(x) {
  x[x$tag == "ID", ]$line %>%
    OEIS_check
}

#' @method OEIS_ID OEIS_xml
#' @export
OEIS_ID.OEIS_xml <- function(x) {
  . <- NULL
  x %>%
    OEIS_seqs_adjacent %>%
    gsub("A", "", .) %>%
    as.numeric %>%
    magrittr::extract2(3) %>%
    magrittr::add(., 1) %>%
    sprintf("A%06d", .) %>%
    OEIS_check
}

#' @method OEIS_ID OEIS_sequence
#' @export
OEIS_ID.OEIS_sequence <- function(x) {
  x$ID
}

#' @method OEIS_ID OEIS_bfile
#' @export
OEIS_ID.OEIS_bfile <- function(x) {
  . <- NULL
  x$bfile_url %>%
    gsub(".*(A\\d{6}).*", "\\1", .) %>%
    OEIS_check
}
