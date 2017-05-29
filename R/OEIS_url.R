#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_url.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_url
#' Get sequence url
#'
#' @inheritParams OEIS_check
#' @param text A logical if \code{TRUE} the function returns the internal format
#'   url, if \code{FALSE} it returns full sequence url.
#'
#' @seealso \code{\link{OEIS_web_url}}
#' @return A string with the full sequence url or the internal format url.
#' \code{\link{OEIS_check}}
#'
#' @references \url{https://oeis.org/eishelp1.html}
#'
#' @export
#'
#' @examples
#' OEIS_url("A000055")
#' OEIS_url("A000055", text = TRUE)
OEIS_url <- function(ID, text = FALSE) {
  OEIS_check(ID)
  ifelse(text,
         paste0(OEIS_web_url(), "search?q=id:", ID, "&fmt=text"),
         paste0(OEIS_web_url(), ID, "/")
         )
    }
