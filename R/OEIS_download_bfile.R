#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_download_bfile.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#' Download bfile from the OEIS
#'
#' This function can be used to download a bfile from \url{https://oeis.org/}.
#' @inheritParams OEIS_check
#' @param destpath A character string with the name where the downloaded
#' \code{bfile} is saved
#' @param ... Additional parameters (see \link[utils]{download.file})
#'
#' @return An (invisible) integer code, 0 for success and non-zero for failure.
#' @export
#'
#' @examples
#' \dontrun{
#' OEIS_download_bfile("A102030", "tests", quiet = TRUE)
#' }
OEIS_download_bfile <- function(ID, destpath, ...) {
  bfile_url <- OEIS_bfile_url(ID, URL = TRUE)
  bfile_destpath <- paste0(destpath, "/", OEIS_bfile_url(ID))
  utils::download.file(url = bfile_url, destfile = bfile_destpath, ...)
}
