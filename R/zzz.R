#  ----------------------------------------------------------------------------
#  OEIS.R PACKAGE
#  Data from The On-Line Encyclopedia of Integer Sequences in R
#  File: zzz.R
#  (c) 2017 - Enrique Pérez Herrero
#  email: energycode.org@gmail.com
#  GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
#  ---------------------------------------------------------------------------

.onAttach <- function(libname, pkgname) {
  if (interactive()) {
    total <- try(OEIS_total_sequences(), silent = TRUE)
    if (!inherits(total, "try-error") && !is.na(total)) {
      packageStartupMessage("Welcome to OEIS.R!\n",
                            "The OEIS currently contains ", total,
                            " sequences.")
    } else {
      packageStartupMessage("Welcome to OEIS.R!")
    }
  }
}
