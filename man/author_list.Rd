% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/OEIS_bibtex.R
\name{author_list}
\alias{author_list}
\title{Getting authors list from author vectors}
\usage{
author_list(x)
}
\arguments{
\item{x}{A character list with sequence authors}
}
\value{
A character with the author list properly joined with commas and the
conjunction "and"
}
\description{
Getting authors list from author vectors
}
\examples{
author_test <- c("first author", "second author", "last author")
author_test2 <- c("first author", "second author")
author_list(author_test)
author_list(author_test2)
}
