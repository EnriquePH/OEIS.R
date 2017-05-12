OEIS_server_url <- "https://oeis.org/"

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
  paste0(OEIS_server_url, ID, "/")
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


#' OEIS_html: Get sequence contect from OEIS web
#'
#' @param ID A string with the OEIS sequence ID
#'
#' @importFrom magrittr "%>%"
#' @importFrom xml2 read_html
#' @return xml_document from an OEIS web with sequence content
#' @export
#'
#' @examples
OEIS_html <- function(ID) {
  . <- NULL
  ID %>%
    OEIS_url %>%
    xml2::read_html(.)
}


#' OEIS_description:
#'
#' @param seq_xml A xml_document from an OEIS sequence
#'
#' @importFrom magrittr "%>%"
#' @importFrom magrittr extract2
#' @importFrom rvest html_nodes
#'
#' @return
#' @export
#'
#' @examples
#' id <- "A000056"
#' test_seq_xml <- OEIS_html(id)
#' OEIS_description(test_seq_xml)
OEIS_description <- function(seq_xml) {
  . <- NULL
  seq_xml %>%
    rvest::html_nodes(. , xpath = "//td/text()") %>%
    magrittr::extract2(16) %>%
    gsub("\n", "", .) %>%
    trimws
}

# library(xml2)
# library(rvest)
# library(magrittr)
#
# id <- "A000056"
#
# test_seq_html <- OEIS_html(id)
#
# OEIS_description(test_seq_html)
#
#
# test_seq_html %>%
#   rvest::html_nodes(. , xpath = "//tt/text()") %>%
#   magrittr::extract2(1) %>%
#   rvest::html_text(.) %>%
#   strsplit(., ",") %>%
#   lapply(., trimws) %>%
#   unlist

