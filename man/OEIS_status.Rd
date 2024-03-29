% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/OEIS_status.R
\name{OEIS_status}
\alias{OEIS_status}
\title{Get OEIS sequence status}
\usage{
OEIS_status(x)
}
\arguments{
\item{x}{Can be one of the following:
\itemize{
\item A character string with sequence \code{ID}.
\item A S3 object of classes \code{OEIS_xml} and \code{xml_document}, with
the sequence content from OEIS web.
\item An object of \code{OEIS_sequence} class, that contains all sequence
related data.
\item An object of \code{OEIS_ID} class.
}}
}
\value{
A character string with the OEIS sequence status.
}
\description{
Status depends on sequence information updates.
}
\note{
Possible status can be:
\itemize{
\item "approved"
\item "editing"
\item "proposed"
\item "reviewed".
}
}
\examples{
\dontrun{
id <- "A000108"
test_seq_xml <- OEIS_xml(id)
OEIS_status(test_seq_xml)
}
}
\seealso{
\itemize{
\item \code{\link{OEIS_check}}
}

\itemize{
\item \code{\link{OEIS_df}}
}

\itemize{
\item \code{\link{OEIS_xml}}
}
}
