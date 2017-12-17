#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_check.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_check
#' OEIS ID Validation
#'
#' @param ID A string with the OEIS sequence identifer \code{ID} number.
#' The A-number or sequence \code{ID} is the absolute catalogue number of the
#' sequence.
#' It consists of "A" followed by 6 digits.
#'
#' @return An object of class \code{"OEIS_ID"} or an error if \code{ID} is not
#'   an OEIS valid ID
#' @export
#'
#' @examples
#' OEIS_check("A002000")
OEIS_check <- function(ID) {
  if (!grepl("^A\\d{6}$", ID)) {
    stop(paste0("\"", ID, "\" is not an OEIS valid ID"))
  } else {
    class(ID) <- "OEIS_ID"
    ID
  }
}
