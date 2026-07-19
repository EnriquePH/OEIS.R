#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_df.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: energycode.org@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_df
#' Get OEIS sequence information lines from XML document data
#'
#' This lines are useful to get all the sequence format data.
#' @param seq_xml A class `OEIS_xml` document extracted from an OEIS
#' sequence.
#'
#' @importFrom rvest html_nodes
#' @importFrom rvest html_text
#'
#' @seealso * [OEIS_xml()]
#' @seealso * [OEIS_sequence()]
#' @references [Explanation of Terms Used in Reply
#'   From](https://oeis.org/eishelp2.html#RS)
#' @return A `data.frame` with the sequence information lines.
#' @examples
#'
#' id <- "A008406"
#' xml <- OEIS_xml(id)
#' df <- OEIS_df(xml)
#' df
#'
#' @export
OEIS_df <- function(seq_xml) {
  UseMethod("OEIS_df")
}

#' @method OEIS_df OEIS_xml
#' @export
OEIS_df.OEIS_xml <- function(seq_xml) {
  . <- NULL
  sections <- rvest::html_nodes(seq_xml, css = "div.section")
  Line <- rvest::html_text(
    rvest::html_nodes(sections, css = "div.sectname"),
    trim = TRUE
  )
  Description <- vapply(sections, function(section) {
    lines <- rvest::html_text(
      rvest::html_nodes(section, css = "div.sectline"),
      trim = TRUE
    )
    paste(lines, collapse = "\n")
  }, character(1), USE.NAMES = FALSE)
  data.frame(Line = Line, Description = Description,
             stringsAsFactors = FALSE)
}
