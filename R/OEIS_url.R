#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_url.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  Start: 18/May/2017
#  End:   22/May/2017
#  ---------------------------------------------------------------------------

#  OEIS_url
#' Get sequence url
#'
#' @inheritParams OEIS_check
#'
#' @seealso \code{\link{OEIS_web_url}}
#' @return A string with the full sequence url
#' \code{\link{OEIS_check}}
#' @export
#'
#' @examples
#' OEIS_url("A000055")
OEIS_url <- function(ID) {
  OEIS_check(ID)
  paste0(OEIS_web_url(), ID, "/")
}
