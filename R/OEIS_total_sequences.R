#  The MIT License (MIT)#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_total_sequences.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#' Total Number of sequences in OEIS
#'
#' @return An integer with the total number of sequences in the Encyclopedia.
#' @export
#'
#' @examples
#' #  The MIT License (MIT)()
OEIS_total_sequences <- function() {
  . <- NULL
  OEIS_web_url() %>%
    xml2::read_html(.) %>%
    rvest::html_nodes(., xpath = "//html/body/center[5]/font") %>%
    rvest::html_text(.) %>%
    sub(".* Contains ([0-9]*) sequences.", "\\1", .) %>%
    as.numeric(.)
}
