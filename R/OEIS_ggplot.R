#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: OEIS_ggplot.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  The MIT License (MIT)
#  ---------------------------------------------------------------------------

#' OEIS_ggplot
#' Plot OEIS sequence with ggplot
#'
#' @param x An object of class `OEIS_sequence`
#'
#' @importFrom ggplot2 ggplot aes xlab ylab ggtitle geom_point
#' @importFrom ggplot2 scale_y_continuous
#' @return A graphic object of the classes `gg` and `ggplot`
#'
#' @seealso * [OEIS_bibtex()]
#' @seealso * [OEIS_sequence()]
#' @examples
#' # A123456: Ludwig van Beethoven, Bagatelle No. 25, Für Elise.
#' id <- "A123456"
#' x <- OEIS_sequence(id)
#' OEIS_ggplot(x)
#'
#' @export
OEIS_ggplot <- function(x) {
UseMethod("OEIS_ggplot", x)
}

#' @method OEIS_ggplot OEIS_sequence
#' @export
OEIS_ggplot.OEIS_sequence  <- function(x) {
  df <- x$bfile$data
  df[[2]] <- as.numeric(df[[2]])
  plot_title <- paste0(strwrap(OEIS_bibtex(x)$note, 70), collapse = "\n")
  ggplot2::ggplot(df, aes(x = !!ggplot2::sym(names(df)[[1]]),
                          y = !!ggplot2::sym(names(df)[[2]]))) +
    ggplot2::ggtitle(plot_title) +
    ggplot2::xlab("n") +
    ggplot2::ylab("a(n)") +
    ggplot2::geom_point(size = 0.1) +
    ggplot2::scale_y_continuous(breaks = NULL)
}
