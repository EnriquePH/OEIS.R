#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_crossrefs.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

#  OEIS_cf
#' OEIS sequence linked cross references from sequence information
#' \code{data.frame}
#'
#' @inheritParams OEIS_description
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr extract2
#' @seealso \code{\link{OEIS_seqs_adjacent}}
#' @seealso \code{\link{OEIS_crossrefs}}
#' @seealso \code{\link{OEIS_xml2}}
#' @seealso \code{\link{OEIS_df}}
#'
#' @return A character vector with OEIS sequence linked cross references
#'   \code{ID}s
#'
#' @examples
#' \dontrun{
#' id <- "A240106"
#' test_seq_html <- OEIS_xml2(id)
#' seq_df <- OEIS_df(test_seq_html)
#' OEIS_cf(seq_df)
#' }
#' @export
OEIS_cf <- function(x) {
  UseMethod("OEIS_cf", x)
}

#' @method OEIS_cf character
#' @export
OEIS_cf.character <- function(x) {
  OEIS_check(x)
  x %>%
    OEIS_internal_format %>%
    OEIS_cf
}

#' @method OEIS_cf OEIS_internal
#' @export
OEIS_cf.OEIS_internal <- function(x) {
  . <- NULL
  x[x$tag == "%Y", ]$line %>%
    regmatches(., gregexpr("(A\\d{6})", .)) %>%
    unlist %>%
    unique
}

#' @method OEIS_cf OEIS_xml
#' @export
OEIS_cf.OEIS_xml <- function(x) {
  . <- NULL
  seq_df <- OEIS_df(x)
  seq_df[seq_df == "CROSSREFS", ]$Description %>%
    strsplit(., "Sequence") %>%
    unlist %>%
    magrittr::extract2(1) %>%
    regmatches(., gregexpr("(A\\d{6})", .)) %>%
    unlist %>%
    unique
}

#' @method OEIS_cf OEIS_sequence
#' @export
OEIS_cf.OEIS_sequence <- function(x) {
  x$crossrefs$cf
}

#-------------------------------------------------------------------------------
#  OEIS_seqs_in_context
#' OEIS Sequences in context from from XML document
#'
#' This line show the three sequences \code{ID}s immediately before and after
#' the sequence in the lexicographic listing.
#' @inheritParams OEIS_df
#'
#' @importFrom magrittr "%>%"
#' @importFrom rvest html_text
#' @importFrom rvest html_nodes
#'
#' @return A character vector OEIS sequences in context IDs
#' @seealso \code{\link{OEIS_seqs_adjacent}}
#' @seealso \code{\link{OEIS_crossrefs}}
#' @seealso \code{\link{OEIS_xml2}}
#' @seealso \code{\link{OEIS_df}}
#' @export
#'
#' @examples
#' id <- "A000112"
#' test_seq_html <- OEIS_xml2(id)
#' OEIS_seqs_in_context(test_seq_html)
OEIS_seqs_in_context <- function(seq_xml) {
  . <- NULL
  seq_xml %>%
    rvest::html_nodes(., xpath = "//tt") %>%
    rvest::html_text(.) %>%
    .[grep("Sequence in context:*", .)] %>%
    regmatches(., gregexpr("(A\\d{6})", .)) %>%
    unlist
}

#-------------------------------------------------------------------------------
#  OEIS_seqs_adjacent
#' OEIS Adjacent sequences from XML document
#'
#' Adjacent sequences IDs in OEIS. These are the three sequences whose A-numbers
#' are immediately before and after the A-number of the sequence.
#' @inheritParams OEIS_df
#'
#' @importFrom magrittr "%>%"
#' @importFrom rvest html_text
#' @importFrom rvest html_nodes
#'
#' @return A character vector OEIS sequences in context IDs
#' @seealso \code{\link{OEIS_seqs_in_context}}
#' @seealso \code{\link{OEIS_crossrefs}}
#' @seealso \code{\link{OEIS_cf}}
#' @seealso \code{\link{OEIS_xml2}}
#' @export
#'
#' @examples
#' id <- "A000112"
#' test_seq_html <- OEIS_xml2(id)
#' OEIS_seqs_adjacent(test_seq_html)
OEIS_seqs_adjacent <- function(seq_xml) {
  . <- NULL
  seq_xml %>%
    rvest::html_nodes(., xpath = "//tt") %>%
    rvest::html_text(.) %>%
    .[grep("Adjacent sequences:*", .)] %>%
    regmatches(., gregexpr("(A\\d{6})", .)) %>%
    unlist
}

#-------------------------------------------------------------------------------
#  OEIS_crossrefs
#' OEIS Cross references from XML document
#'
#' Cross references IDs
#' @inheritParams OEIS_df
#'
#' @importFrom magrittr "%>%"
#' @importFrom rvest html_text
#' @importFrom rvest html_nodes
#'
#' @return An object of the class \code{OEIS_crossrefs} including referenced
#'   sequences, sequences in context and adjacent sequences
#' @seealso \code{\link{OEIS_seqs_in_context}}
#' @seealso \code{\link{OEIS_seqs_adjacent}}
#' @seealso \code{\link{OEIS_cf}}
#' @seealso \code{\link{OEIS_df}}
#' @seealso \code{\link{OEIS_xml2}}
#' @export
#'
#' @examples
#' id <- "A000112"
#' test_seq_html <- OEIS_xml2(id)
#' OEIS_crossrefs(test_seq_html)
OEIS_crossrefs <- function(seq_xml) {
  structure(
    list(
      cf = OEIS_cf(seq_xml),
      seqs_in_context = OEIS_seqs_in_context(seq_xml),
      seqs_adjacent = OEIS_seqs_adjacent(seq_xml)
    ),
    class = c("OEIS_crossrefs")
  )
}
