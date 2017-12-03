#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_bibtex.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#' Getting authors list from author vectors
#'
#' @param x An character list with the authors
#'
#' @return A character with the author list properly joined with commas and the
#' conjunction "and"
#' @export
#'
#' @examples
#' author_test <- c("first author", "second author", "last author")
#' author_test2 <- c("first author", "second author")
#' author_list(author_test)
#' author_list(author_test2)
author_list <- function(x) {
  n <- length(x)
  if (n == 1) {
    lst <- x
  } else {
    lst_head <- paste(head(x, n = -1), collapse = ", ")
    lst_tail <- tail(x, n = 1)
    lst <- paste(lst_head, "and", lst_tail)
  }
  lst
}


#' Getting BibTeX citation from OEIS sequence
#'
#' @param x An object of the \code{OEIS_sequence} class
#' @param use_tab A logical if \code{TRUE} adds a tabulator to BibTeX tags
#' @md
#' @return A character with the BibTeX citation, the function populates a
#' MISC entry type, for use when nothing else fits, with the following
#' fields:
#' * AUTHOR: The name(s) of the author(s) (in the case of more than one author,
#' separated by and).
#' * TITLE:  The {O}n-{L}ine {E}ncyclopedia of {I}nteger {S}equences.
#' * HOWPUBLISHED: Link to sequence in OEIS.
#' * YEAR: The year of publication (or, if unpublished, the year of creation).
#' * MONTH: The month of publication (or, if unpublished, the month
#'  of creation).
#' * NOTE: Sequence description.
#' @note Fields tags are separated by commas. The last tag finishs with a comma,
#' although is not necessarily. The tag's name is not case-sensitive but
#' caps are used.
#' @references
#' * \url{http://www.bibtex.org/Format/}
#' * \url{http://psychedelic-geometry.blogspot.com.es/2010/02/bibtex-automatic-oeis-citations.html}
#' * \url{https://github.com/Psychedelic-Geometry/OEIS-Mathematica/wiki}
#' * \url{https://en.wikipedia.org/wiki/BibTeX}
#' @export
#'
#' @examples
#' \dontrun{
#' x <- OEIS_sequence("A170401")
#' bib <- OEIS_bibtex(x)
#' cat(bib, sep = "\n")
#' }
OEIS_bibtex <- function(x, use_tab = TRUE) {
  UseMethod("OEIS_bibtex")
}

#' @method OEIS_bibtex OEIS_sequence
#' @export
OEIS_bibtex.OEIS_sequence <- function(x, use_tab = TRUE) {
  # tabulate tags
  t <- ifelse(use_tab, "\t", "")
  MISC <- paste0("@MISC{oeis", x$ID, ",")
  AUTHOR <- author_list(x$author)
  AUTHOR <- paste0(t, "AUTHOR = {", AUTHOR, "},")
  TITLE <-
    paste0(t,
           "TITLE = {The {O}n-{L}ine {E}ncyclopedia of {I}nteger {S}equences},"
    )
  HOWPUBLISHED <- paste0(t, "HOWPUBLISHED = {\\href{", x$url, "{", x$ID, "}},")
  if (is.null(x$date)) {
    MONTH <- ""
    YEAR <- ""
  } else {
    MONTH <- format(x$date, "%b")
    YEAR <- format(x$date, "%Y")
  }
  MONTH <- paste0(t, "MONTH = {", MONTH, "},")
  YEAR <- paste0(t, "YEAR = {", YEAR, "},")
  NOTE <- paste0(t, "NOTE = {", x$description, "},")

  bib <- paste(MISC,
               AUTHOR,
               TITLE,
               HOWPUBLISHED,
               MONTH,
               YEAR,
               NOTE,
               "}",
               sep = "\n")
  bib
}
