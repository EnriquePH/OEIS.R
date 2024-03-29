#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_sequence.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ----------------------------------------------------------------------------

#  OEIS_sequence
#' S3 class constructor for \code{OEIS_sequence}
#'
#' @inheritParams OEIS_check
#'
#' @return An object of the S3 class \code{OEIS_sequence}.
#' @seealso * \code{\link{OEIS_check}}
#' @seealso * \code{\link{OEIS_url}}
#' @seealso * \code{\link{OEIS_description}}
#' @seealso * \code{\link{OEIS_formerly}}
#' @seealso * \code{\link{OEIS_bfile}}
#' @seealso * \code{\link{OEIS_terms}}
#' @seealso * \code{\link{OEIS_xml}}
#' @seealso * \code{\link{OEIS_internal_format}}
#' @seealso * \code{\link{OEIS_df}}
#' @references \href{https://oeis.org/eishelp2.html#RS}{Explanation of Terms Used
#'   in Reply From}
#'
#' @examples
#' id <- "A003456"
#' A003456 <- OEIS_sequence(id)
#' class(A003456)
#' A003456
#'
#' @export
OEIS_sequence <- function(ID){
  ID <- OEIS_check(ID)
  seq_xml <- OEIS_xml(ID)
  seq_df <- OEIS_df(seq_xml)
  internal_format <- OEIS_internal_format(ID)
  structure(list(ID = ID,
                 url = OEIS_url(ID),
                 description = OEIS_description(internal_format),
                 formerly = OEIS_formerly(internal_format),
                 bfile = OEIS_bfile(ID),
                 terms = OEIS_terms(internal_format),
                 offset = OEIS_offset(internal_format),
                 comments = OEIS_comments(internal_format),
                 links = OEIS_links(internal_format),
                 example = OEIS_example(internal_format),
                 formula = OEIS_formula(internal_format),
                 mathematica = OEIS_mathematica(internal_format),
                 crossrefs = OEIS_crossrefs(seq_xml),
                 keywords = OEIS_keywords(internal_format),
                 author = OEIS_author(internal_format, email = TRUE),
                 date = OEIS_date(internal_format),
                 extensions = OEIS_extensions(internal_format),
                 status = OEIS_status(seq_xml),
                 internal_format = internal_format,
                 seq_df = seq_df,
                 seq_xml = seq_xml),
            class = c("OEIS_sequence"))
}


#' Plot class OEIS_Sequence
#'
#' @param x An object of the S3 class \code{"OEIS_sequence"}
#' @param ... other arguments
#' @importFrom graphics plot.default
#' @return A plot of sequence terms
#' @export
#'
#' @examples
#' \dontrun{
#' id <- "A008406"
#' x <- OEIS_sequence(id)
#' plot(x)
#' }
plot.OEIS_sequence <- function(x, ...) {
  graphics::plot.default(x$terms,
                         main = x$ID,
                         xlab = "",
                         ylab = "",
                         ...)
}
