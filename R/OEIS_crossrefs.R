#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_crossrefs.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#  OEIS_cf
#' OEIS sequence linked cross references from sequence information
#' \code{data.frame}
#'
#' @inheritParams OEIS_description
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr extract2
#' @seealso * \code{\link{OEIS_seqs_adjacent}}
#' @seealso * \code{\link{OEIS_crossrefs}}
#' @seealso * \code{\link{OEIS_xml}}
#' @seealso * \code{\link{OEIS_df}}
#'
#' @return A character vector with OEIS sequence linked cross references
#'   \code{ID}s.
#'
#' @examples
#' \dontrun{
#' id <- "A240106"
#' seq_html <- OEIS_xml(id)
#' seq_df <- OEIS_df(seq_html)
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
  seq_df[seq_df$Line == "CROSSREFS", ]$Description %>%
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
#' @inheritParams OEIS_cf
#'
#' @importFrom magrittr "%>%"
#' @importFrom rvest html_text
#' @importFrom rvest html_nodes
#'
#' @return A character vector OEIS sequences in context IDs
#' @seealso \code{\link{OEIS_seqs_adjacent}}
#' @seealso \code{\link{OEIS_crossrefs}}
#' @seealso \code{\link{OEIS_cf}}
#' @seealso \code{\link{OEIS_xml}}
#' @seealso \code{\link{OEIS_df}}
#' @seealso \code{\link{OEIS_ID}}
#'
#' @examples
#' \dontrun{
#' id <- "A000112"
#' seq_xml <- OEIS_xml(id)
#' OEIS_seqs_in_context(seq_xml)
#' }
#' @export
OEIS_seqs_in_context <- function(x) {
  UseMethod("OEIS_seqs_in_context", x)
}

#' @method OEIS_seqs_in_context character
#' @export
OEIS_seqs_in_context.character <- function(x) {
  OEIS_check(x)
  x %>%
    OEIS_xml %>%
    OEIS_seqs_in_context
}

#' @method OEIS_seqs_in_context OEIS_internal
#' @export
OEIS_seqs_in_context.OEIS_internal <- function(x) {
  x %>%
    OEIS_ID %>%
    OEIS_seqs_in_context
}

#' @method OEIS_seqs_in_context OEIS_xml
#' @export
OEIS_seqs_in_context.OEIS_xml <- function(x) {
  . <- NULL
  x %>%
    rvest::html_nodes(., xpath = "//tt") %>%
    rvest::html_text(.) %>%
    .[grep("Sequence in context:*", .)] %>%
    regmatches(., gregexpr("(A\\d{6})", .)) %>%
    unlist
}

#' @method OEIS_seqs_in_context OEIS_sequence
#' @export
OEIS_seqs_in_context.OEIS_sequence <- function(x) {
  x$crossrefs$seqs_in_context
}

#-------------------------------------------------------------------------------
#  OEIS_seqs_adjacent
#' OEIS Adjacent sequences from XML document
#'
#' Adjacent sequences IDs in OEIS. These are the three sequences whose A-numbers
#' are immediately before and after the A-number of the sequence.
#' @inheritParams OEIS_description
#'
#' @importFrom magrittr "%>%"
#' @importFrom rvest html_text
#' @importFrom rvest html_nodes
#'
#' @return A character vector OEIS sequences in context IDs
#' @seealso \code{\link{OEIS_seqs_in_context}}
#' @seealso \code{\link{OEIS_crossrefs}}
#' @seealso \code{\link{OEIS_cf}}
#' @seealso \code{\link{OEIS_xml}}
#'
#' @examples
#' \dontrun{
#' id <- "A000112"
#' seq_html <- OEIS_xml(id)
#' OEIS_seqs_adjacent(seq_html)
#' }
#' @export
OEIS_seqs_adjacent <- function(x) {
  UseMethod("OEIS_seqs_adjacent", x)
}

#' @method OEIS_seqs_adjacent character
#' @export
OEIS_seqs_adjacent.character <- function(x) {
  OEIS_check(x)
  x %>%
    OEIS_xml %>%
    OEIS_seqs_adjacent
}

#' @method OEIS_seqs_adjacent OEIS_internal
#' @export
OEIS_seqs_adjacent.OEIS_internal <- function(x) {
  x %>%
    OEIS_ID %>%
    OEIS_seqs_adjacent
}

#' @method OEIS_seqs_adjacent OEIS_xml
#' @export
OEIS_seqs_adjacent.OEIS_xml <- function(x) {
  . <- NULL
  x %>%
    rvest::html_nodes(., xpath = "//tt") %>%
    rvest::html_text(.) %>%
    .[grep("Adjacent sequences:*", .)] %>%
    regmatches(., gregexpr("(A\\d{6})", .)) %>%
    unlist
}

#' @method OEIS_seqs_adjacent OEIS_sequence
#' @export
OEIS_seqs_adjacent.OEIS_sequence <- function(x) {
  x$crossrefs$seqs_adjacent
}

#-------------------------------------------------------------------------------
#  OEIS_crossrefs
#' OEIS Cross references
#'
#' Cross references IDs
#' @inheritParams OEIS_description
#'
#'
#' @return An object of the class \code{OEIS_crossrefs} including referenced
#'   sequences, sequences in context and adjacent sequences.
#' @seealso \code{\link{OEIS_seqs_in_context}}
#' @seealso \code{\link{OEIS_seqs_adjacent}}
#' @seealso \code{\link{OEIS_cf}}
#' @seealso \code{\link{OEIS_df}}
#' @seealso \code{\link{OEIS_xml}}
#'
#' @examples
#' \dontrun{
#' id <- "A000112"
#' seq_html <- OEIS_xml(id)
#' OEIS_crossrefs(seq_html)
#' }
#' @export
OEIS_crossrefs <- function(x) {
  UseMethod("OEIS_crossrefs", x)
}

#' @method OEIS_crossrefs default
#' @export
OEIS_crossrefs.default <- function(x) {
  structure(
    list(
      cf = OEIS_cf(x),
      seqs_in_context = OEIS_seqs_in_context(x),
      seqs_adjacent = OEIS_seqs_adjacent(x)
    ),
    class = c("OEIS_crossrefs")
  )
}
