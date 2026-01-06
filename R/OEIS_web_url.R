#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_web_url.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_web_url
#' OEIS server main web page url
#' @param license A logical `FALSE` as default
#' @return A string with the main OEIS url: <https://oeis.org/>,
#' or the _OEIS End-User License Agreement_ url, if parameter `license`
#' is `TRUE`
#' @export
#'
#' @examples
#' OEIS_web_url()
#' # Show license url
#' OEIS_web_url(license = TRUE)
OEIS_web_url <- function(license = FALSE) {
  url <- "https://oeis.org/"
  license <- ifelse(license, "LICENSE", "")
  paste0(url, license)
}
