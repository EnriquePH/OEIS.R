% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/OEIS_description.R
\name{OEIS_description}
\alias{OEIS_description}
\title{Get OEIS sequence description}
\usage{
OEIS_description(x)
}
\arguments{
\item{x}{Can be one of the following:
\itemize{
\item A character string with sequence \code{ID}.
\item A \code{OEIS_internal} S3 class object, with sequence internal format.
\item A S3 classes object \code{OEIS_xml} and \code{xml_document}, with
sequence content from OEIS web.
\item An object of \code{OEIS_sequence} class, that contains all sequence
related data.
}}
}
\value{
A string with the OEIS sequence description.
}
\description{
Sequence description gives a brief definition of the sequence.
In the description, \emph{a(n)} usually denotes the n-th term of the
sequence, and \emph{n} is a typical subscript.
In some cases however \emph{n} denotes a typical term in the sequence.
}
\examples{

# Sequence description from ID
id <- "A000056"
OEIS_description(id)

# Alternate example using internal format
id <- "A003400"
internal_format <- OEIS_internal_format(id)
OEIS_description(internal_format)

# Sequence description from "OEIS_sequence" class
 id <- "A002315"
 seq <- OEIS_sequence(id)
 OEIS_description(seq)

}
\seealso{
\itemize{
\item \code{\link{OEIS_internal_format}}
}

\itemize{
\item \code{\link{OEIS_sequence}}
}

\itemize{
\item \code{\link{OEIS_xml}}
}

\itemize{
\item \code{\link{OEIS_check}}
}
}
