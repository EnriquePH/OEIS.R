#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_bfile_url.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_bfile_url
#' Get sequence data url in \code{bfile} format.
#'
#' A \strong{bfile} is a text formatted file that provides many more terms of a
#' sequence than the typical fifty to eighty terms that can be shown in the main
#' sequence entry.
#'
#' @inheritParams OEIS_check
#' @param URL A logical that selects if the output is the complete url, or just
#'   the \code{bfile} file name.
#'
#' @importFrom magrittr "%>%"
#'
#' @return A string with the sequence \strong{bfile} url, or the \strong{bfile}
#'   file name
#'
#' @seealso * \code{\link{OEIS_url}}
#' @seealso * \code{\link{OEIS_check}}
#' @export
#'
#' @examples
#' id <- "A000056"
#' OEIS_bfile_url(id, URL = FALSE)
#' OEIS_bfile_url(id, URL = TRUE)
#' @export
OEIS_bfile_url <- function(ID, URL) {
  UseMethod("OEIS_bfile_url")
}

#' @method OEIS_bfile_url character
#' @export
OEIS_bfile_url.character <- function(ID, URL = FALSE) {
  . <- NULL
  OEIS_check(ID) %>%
    OEIS_bfile_url(., URL)
}

#' @method OEIS_bfile_url OEIS_ID
#' @export
OEIS_bfile_url.OEIS_ID <- function(ID, URL = FALSE) {
  . <- NULL
  URL <- ifelse(URL, OEIS_url(ID, text = FALSE), "")
  ID %>%
    gsub("A", "b", .) %>%
    paste0(URL, ., ".txt")
}
