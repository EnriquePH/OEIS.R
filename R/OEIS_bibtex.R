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
#' @param x A character list with sequence authors
#'
#' @return A character with the author list properly joined with commas and the
#' conjunction "and"
#' @importFrom utils head tail
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
    lst_head <- paste(utils::head(x, n = -1), collapse = ", ")
    lst_tail <- utils::tail(x, n = 1)
    lst <- paste(lst_head, "and", lst_tail)
  }
  lst
}


#' Getting BibTeX citation from OEIS sequence
#'
#' @param x An object of class \code{OEIS_sequence}
#' @importFrom utils person
#' @importFrom utils bibentry
#' @md
#' @return An object of class `bibentry` with the citation, the function
#' populates a `Misc` entry type, for use when nothing else fits, with
#' the following fields:
#' * __key__: a character string giving the citation key for the OEIS sequence.
#' * __author__: The name(s) of the author(s) (in the case of more than one
#'  author, separated by `and`).
#' * __title__:  The {O}n-{L}ine {E}ncyclopedia of {I}nteger {S}equences.
#' * __url__: Link to sequence in OEIS.
#' * __year__: The year of publication (or, if unpublished, the year of
#'  creation).
#' * __month__: The month of publication (or, if unpublished, the month
#'  of creation).
#' * __note__: Sequence description.
#' @note Fields tags are separated by commas. The last tag finishes with a comma
#' , although is not necessarily. The tag's name is not case-sensitive but
#' caps are used.
#' @note For more help on `bibentry` class, see: \code{\link[utils]{bibentry}}
#' @seealso \code{\link[utils]{person}}
#' @seealso \code{\link[utils]{toBibtex}}
#' @seealso \code{\link{OEIS_author}}
#' @references
#' * \href{http://www.bibtex.org/Format/}{BibTeX Format Description}
#' * \href{http://psychedelic-geometry.blogspot.com.es/2010/02/bibtex-automatic-oeis-citations.html}{BibTeX AUTOMATIC OEIS CITATIONS}
#' * \href{https://github.com/Psychedelic-Geometry/OEIS-Mathematica/wiki}{Mathematica OEIS Package}
#' * \href{https://en.wikipedia.org/wiki/BibTeX}{Wikipedia: BibTex}
#' * \href{https://oeis.org/wiki/Welcome#reference}{Referencing a Particular Sequence}
#' @export
#'
#' @examples
#' x <- OEIS_sequence("A170401")
#' bref <- OEIS_bibtex(x)
#' # BibTeX and citation.
#' print(bref, style = "Bibtex")
#' print(bref, style = "citation")
#'
OEIS_bibtex <- function(x) {
  UseMethod("OEIS_bibtex")
}

#' @method OEIS_bibtex OEIS_sequence
#' @export
OEIS_bibtex.OEIS_sequence <- function(x) {
  BIBTYPE <- "Misc"
  KEY <- paste0("oeis", x$ID)
  AUTHOR <- OEIS_author(x, email = FALSE)
  AUTHOR <- unlist(lapply(AUTHOR, function(x) utils::person(x)))
  TITLE <- "The {O}n-{L}ine {E}ncyclopedia of {I}nteger {S}equences"
  NOTE <- paste0(x$ID, ": ", x$description)
  URL <- x$url

  if (is.null(x$date)) {
    # Date is not present.
    MONTH <- ""
    YEAR <- ""
  } else {
    MONTH <- format(x$date, "%b")
    YEAR <- format(x$date, "%Y")
  }
  # Bibliography Entries
  bref <- utils::bibentry(
    bibtype = BIBTYPE,
    key = KEY,
    author = AUTHOR,
    title = TITLE,
    note = NOTE,
    url = URL,
    month = MONTH,
    year = YEAR
  )
  bref
}
