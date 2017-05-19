

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


#' OEIS_check: OEIS ID Validation
#'
#' @param ID A string with the OEIS sequence ID
#'
#' @return NULL or an error if ID is not valid
#' @export
#'
#' @examples
#' OEIS_check("A002000")
OEIS_check <- function(ID) {
  if(!grepl("^A\\d{6}$", ID)) {
    stop(paste0("\"", ID, "\" is not an OEIS valid ID"))
  }
}


#' OEIS_url:  Get sequence url
#'
#' @inheritParams OEIS_check
#'
#' @return A string with the sequence url
#' @export
#'
#' @examples
#' OEIS_url("A000055")
OEIS_url <- function(ID) {
  OEIS_check(ID)
  paste0(OEIS_web_url(), ID, "/")
}


#' OEIS_bfile_url: Get bfile url
#'
#' @inheritParams OEIS_check
#' @param URL A logical that selects if the output is the complete url or
#'  just the bfile file name.
#'
#' @importFrom magrittr "%>%"
#'
#' @return A string with the sequence bfile url of the bfile file name
#' @export
#'
#' @examples
#' id <- "A000056"
#' OEIS_bfile_url(id, FALSE)
#' OEIS_bfile_url(id, TRUE)
OEIS_bfile_url <- function(ID, URL = FALSE) {
  . <- NULL
  OEIS_check(ID)
  URL <- ifelse(URL, OEIS_url(ID), "")
  ID %>%
    gsub("A", "b", .) %>%
    paste0(URL, . , ".txt" )
}


#' OEIS_xml2: Get sequence content from OEIS web
#'
#' @inheritParams OEIS_check
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
  OEIS_check(ID)
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


#' OEIS_bfile: Class constructor
#'
#' @inheritParams OEIS_check
#'
#' @importFrom  utils read.table
#' @return An object of the class \code{OEIS_bfile}
#' @export
#'
#' @examples
#' id <- "A000056"
#' OEIS_bfile(id)
OEIS_bfile <- function(ID) {
  OEIS_check(ID)
  bfile_url <- OEIS_bfile_url(ID, TRUE)
  lines <- readLines(bfile_url)
  match_comments <- grepl("#", lines)
  comments <- lines[match_comments]
  data <- lines[!match_comments]
  if(identical(comments, character(0))) {
    comments <- NULL
    }

  data <- utils::read.table(text = data, stringsAsFactors = FALSE)
  names(data) <- c("n", ID)
  structure(list(bfile_name = OEIS_bfile_url(ID),
                 bfile_url = OEIS_bfile_url(ID, TRUE),
                 comments = comments,
                 data = data),
            class = c("OEIS_bfile"))
}


#' OEIS_sequence: Class constructor
#'
#' @inheritParams OEIS_check
#'
#' @return An object of the class \code{OEIS_sequence}
#' @export
#'
#' @examples
#' id <- "A003456"
#' x <- OEIS_sequence(id)
#' x
OEIS_sequence <- function(ID){
  seq_xml = OEIS_xml2(ID)
  structure(list(ID = ID,
                 description = OEIS_description(seq_xml),
                 url = OEIS_url(ID),
                 bfile = OEIS_bfile(ID),
                 terms = OEIS_terms(seq_xml),
                 seq_xml = seq_xml),
            class = c("OEIS_sequence"))
}


# library(xml2)
# library(rvest)
# library(magrittr)
#
# id <- "A000056"
# #
# # test_seq_html <- OEIS_xml2(id)
# #
# # OEIS_description(test_seq_html)
# # OEIS_terms(test_seq_html)
# id <- "A001456"
# x <- OEIS_sequence(id)
#
# x$url
#
# x$description
# x$bfile$comments
# x$bfile$data

# plot(x$bfile$data)
#
#
# grepl("^A\\d{6}$", "A000056")
