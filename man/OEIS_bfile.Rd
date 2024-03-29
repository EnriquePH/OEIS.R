% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/OEIS_bfile.R
\name{OEIS_bfile}
\alias{OEIS_bfile}
\title{S3 class constructor for \code{bfile} data.}
\usage{
OEIS_bfile(ID)
}
\arguments{
\item{ID}{A character string or an object of the class \code{OEIS_ID}}
}
\value{
A S3 object of the class \code{OEIS_bfile} with the following structure:
\itemize{
\item \strong{bfile_name}: Name of \code{bfile}.
\item \strong{bfile_url}: Url to \code{bfile} in the OEIS server.
\item \strong{min_n}:  Minimum \code{n} position of the first term for available values of the sequence.
\item \strong{max_n}:  Maximum \code{n} position of the last term for available values of the sequence.
\item \strong{comments}: Text comments included into the \code{bfile}
\item \strong{data}: A data frame including all data within the \code{bfile} with two
columns: \strong{n} and other named as the sequence \code{ID} including sequence values for \strong{a(n)}.
}
}
\description{
A \code{bfile} is a text formatted file that provides many more terms of a
sequence than the typical fifty to eighty terms that can be shown in the main
sequence entry.
}
\examples{
id <- "A000056"
OEIS_bfile(id)

}
\seealso{
\itemize{
\item \code{\link{OEIS_bfile_url}}
}

\itemize{
\item \code{\link{OEIS_sequence}}
}

\itemize{
\item \code{\link{OEIS_check}}
}

\itemize{
\item \code{\link{OEIS_download_bfile}}
}
}
