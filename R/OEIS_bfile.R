#  ----------------------------------------------------------------------------
#  OIES.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_bfile.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------


#  OEIS_bfile
#' S3 class constructor for \code{bfile} data
#'
#' A \code{bfile} is a text formatted file that provides many more terms of a
#' sequence than the typical fifty to eighty terms that can be shown in the main
#' sequence entry.
#' @inheritParams OEIS_check
#'
#' @importFrom  utils read.table
#' @return A S3 object of the class \code{OEIS_bfile}
#'
#' @seealso \code{\link{OEIS_bfile_url}}
#' @seealso \code{\link{OEIS_sequence}}
#' @seealso \code{\link{OEIS_check}}
#' @export
#'
#' @examples
#' id <- "A000056"
#' OEIS_bfile(id)
OEIS_bfile <- function(ID) {
  OEIS_check(ID)
  bfile_url <- OEIS_bfile_url(ID, URL = TRUE)
  lines <- readLines(bfile_url, warn = FALSE)
  match_comments <- grepl("#", lines)
  comments <- lines[match_comments]
  data <- lines[!match_comments]
  if (identical(comments, character(0))) {
    # No comments
    comments <- NULL
  }

  data <- utils::read.table(text = data,
                            colClasses = c("integer", "character"),
                            stringsAsFactors = FALSE)
  names(data) <- c("n", ID)
  # S3 class
  structure(list(bfile_name = OEIS_bfile_url(ID),
                 bfile_url = OEIS_bfile_url(ID, TRUE),
                 comments = comments,
                 data = data),
            class = c("OEIS_bfile"))
}
