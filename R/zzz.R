#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: zzz.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: eph.project1500@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

.onAttach <- function(libname, pkgname) {
  if (interactive()) {
    total <- try(OEIS_total_sequences(), silent = TRUE)
    if (!inherits(total, "try-error")) {
      packageStartupMessage(paste("OEIS contains", total, "sequences."))
    } else {
      packageStartupMessage("Welcome to OEIS.R!")
    }
  }
}
