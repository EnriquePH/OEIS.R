#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_bfile.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_bfile
#' S3 class constructor for \code{bfile} data.
#'
#' A \code{bfile} is a text formatted file that provides many more terms of a
#' sequence than the typical fifty to eighty terms that can be shown in the main
#' sequence entry.
#' @param ID A character string or an object of the class \code{OEIS_ID}
#'
#' @importFrom utils read.table
#' @importFrom magrittr "%>%"
#' @md
#' @return A S3 object of the class \code{OEIS_bfile} with the following structure:
#' * __bfile_name__: Name of `bfile`.
#' * __bfile_url__: Url to `bfile` in the OEIS server.
#' * __min_n__:  Minimum `n` position of the first term for available values of the sequence.
#' * __max_n__:  Maximum `n` position of the last term for available values of the sequence.
#' * __comments__: Text comments included into the `bfile`
#' * __data__: A data frame including all data within the `bfile` with two
#'  colums: __n__ and other named as the sequence `ID` including sequence values for __a(n)__.
#' @seealso \code{\link{OEIS_bfile_url}}
#' @seealso \code{\link{OEIS_sequence}}
#' @seealso \code{\link{OEIS_check}}
#'
#' @examples
#' \dontrun{
#' id <- "A000056"
#' OEIS_bfile(id)
#' }
#' @export
OEIS_bfile <- function(ID) {
  UseMethod("OEIS_bfile", ID)
}

#' @method OEIS_bfile character
#' @export
OEIS_bfile.character <- function(ID) {
  ID %>%
  OEIS_check %>%
    OEIS_bfile
}

#' @method OEIS_bfile OEIS_ID
#' @export
OEIS_bfile.OEIS_ID <- function(ID) {
  bfile_url <- OEIS_bfile_url(ID, URL = TRUE)
  lines <- readLines(bfile_url, warn = FALSE)
  match_comments <- grepl("#", lines)
  comments <- lines[match_comments] %>%
    char0toNULL
  data <- lines[!match_comments]

  data <- utils::read.table(text = data,
                            colClasses = c("integer", "character"),
                            stringsAsFactors = FALSE)
  names(data) <- c("n", ID)
  min_n <- min(data["n"])
  max_n <- max(data["n"])
  # S3 class
  structure(list(bfile_name = OEIS_bfile_url(ID),
                 bfile_url = OEIS_bfile_url(ID, TRUE),
                 min_n = min_n,
                 max_n = max_n,
                 comments = comments,
                 data = data),
            class = c("OEIS_bfile"))
}
