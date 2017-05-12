

#' OEIS_web_url: Get OEIS web main page url
#'
#' @return A string with the OEIS web url
#' @export
#'
#' @examples
#' OEIS_web_url()
OEIS_web_url <- function() {
  "https://oeis.org/"
}


#' OEIS_url:  Get sequence url
#'
#' @param ID A string with the OEIS sequence ID
#'
#' @return A string with the sequence url
#' @export
#'
#' @examples
#' OEIS_url("A000055")
OEIS_url <- function(ID) {
  paste0(OEIS_web_url(), ID, "/")
}


#' OEIS_bfile_url: Get bfile url
#'
#' @param ID A string with the OEIS sequence ID
#' @param URL A logical that
#'
#' @importFrom magrittr "%>%"
#'
#' @return A string with the sequence bfile url
#' @export
#'
#' @examples
#' id <- "A000056"
#' OEIS_bfile_url(id, FALSE)
#' OEIS_bfile_url(id, TRUE)
OEIS_bfile_url <- function(ID, URL = FALSE) {
  . <- NULL
  URL <- ifelse(URL, OEIS_url(ID), "")
  ID %>%
    gsub("A", "b", .) %>%
    paste0(URL, . , ".txt" )
}


#' OEIS_xml2: Get sequence content from OEIS web
#'
#' @param ID A string with the OEIS sequence ID
#'
#' @importFrom magrittr "%>%"
#' @importFrom xml2 read_html
#' @return \code{xml_document} from OEIS web with the sequence content
#' @export
#'
#' @examples
#'  id <- "A000156"
#'  test_seq_html <- OEIS_xml2(id)
OEIS_xml2 <- function(ID) {
  . <- NULL
  ID %>%
    OEIS_url %>%
    xml2::read_html(.)
}


#' OEIS_description: Get OEIS sequence description from xml2 data
#'
#' @param seq_xml A xml_document from an OEIS sequence
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr extract2
#' @importFrom rvest html_nodes
#'
#' @return A string with the OEIS sequence description
#' @export
#'
#' @examples
#' id <- "A000056"
#' test_seq_xml <- OEIS_xml2(id)
#' OEIS_description(test_seq_xml)
OEIS_description <- function(seq_xml) {
  . <- NULL
  seq_xml %>%
    rvest::html_nodes(. , xpath = "//td/text()") %>%
    magrittr::extract2(16) %>%
    gsub("\n", "", .) %>%
    trimws
}


#' OEIS_terms: Get OEIS sequence terms from xml2 data
#'
#' @param seq_xml A xml_document from an OEIS sequence
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr extract2
#' @importFrom rvest html_text
#' @importFrom rvest html_nodes
#'
#' @return A character list with the OEIS sequence terms
#' @export
#'
#' @examples
#' id <- "A000056"
#' test_seq_html <- OEIS_xml2(id)
#' OEIS_terms(test_seq_html)
OEIS_terms <- function(seq_xml) {
  . <- NULL
  seq_xml %>%
  rvest::html_nodes(. , xpath = "//tt/text()") %>%
  magrittr::extract2(1) %>%
  rvest::html_text(.) %>%
  strsplit(., ",") %>%
  lapply(., trimws) %>%
  unlist
}


# library(xml2)
# library(rvest)
# library(magrittr)
#
# id <- "A000056"
#
# test_seq_html <- OEIS_xml2(id)
#
# OEIS_description(test_seq_html)
#
# OEIS_terms(test_seq_html)

