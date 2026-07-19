# OEIS.R

![OEIS.R hexagon
sticker](https://raw.githubusercontent.com/EnriquePH/OEIS.R/master/sticker/OEIS.R-sticker.png)

**Access sequences from the [On-Line Encyclopedia of Integer Sequences
(OEIS)](https://oeis.org/) directly from R**

OEIS is one of the world’s most valuable mathematical resources:
thousands of integer sequences with formulas, comments, references, and
code. It has contributed to mathematical discoveries and is cited in
over 6000 articles. **OEIS.R** brings this data to R in a structured
way, making it easy to visualize, analyze, and use in mathematical
hypotheses or contributions to OEIS.

Full documentation and function reference:
<https://enriqueph.github.io/OEIS.R/>

## Installation

``` r

# install.packages("devtools")  # if you don't have it
devtools::install_github("EnriquePH/OEIS.R")
```

## Quick Start

``` r

library(OEIS.R)

# Download the Fibonacci sequence (A000045)
fib <- OEIS_sequence("A000045")

# Basic info
OEIS_description(fib)
OEIS_formula(fib)

# Quick base R plot
plot(fib)
```

## Another example: Sequence A001615

``` r

library(ggplot2)

id <- "A001615"
x <- OEIS_sequence(id)

OEIS_ggplot(x) +
  geom_line() +
  geom_point(size = 0.5, color = "green") +
  labs(title = paste("OEIS", id, "-", OEIS_description(x)))
```

![Plot of OEIS sequence A001615, the Dedekind psi
function](https://raw.githubusercontent.com/EnriquePH/OEIS.R/master/img/A001615.png)

Plot of OEIS sequence A001615, the Dedekind psi function

## Main Features

Download and parsing of OEIS sequences (terms, description, formula,
offset, etc.). Seamless integration with *ggplot2* for visualization.
Helper functions:

- *OEIS_description()*
- *OEIS_formula()*
- *OEIS_keywords()*

Respects OEIS terms of use (rate limiting recommended).

## Useful Links

- [Official OEIS website](https://oeis.org/)
- [OEIS Terms of Use](https://oeis.org/OEISTermsOfUse.pdf)
- [Wikipedia:
  OEIS](https://en.wikipedia.org/wiki/On-Line_Encyclopedia_of_Integer_Sequences)
- [OEIS Foundation](http://oeisf.org/)

## Citation

To cite the **OEIS.R** package itself:

``` r

citation("OEIS.R")
```

(GitHub’s “Cite this repository” button on this repo’s page uses
[`CITATION.cff`](https://enriqueph.github.io/OEIS.R/CITATION.cff) and
gives the same citation in APA/BibTeX.)

To cite an individual OEIS sequence you’ve fetched (e.g. in a paper),
use [`OEIS_bibtex()`](https://github.com/EnriquePH/OEIS.R) instead:

``` r

x <- OEIS_sequence("A001615")
print(OEIS_bibtex(x), style = "Bibtex")
```

## Contributing

Contributions are welcome! See
[CONTRIBUTING.md](https://enriqueph.github.io/OEIS.R/CONTRIBUTING.md)
for how to set up a development environment, run the test suite, and
submit pull requests.

## Author

Enrique Pérez Herrero

- GitHub: [@EnriquePH](https://github.com/EnriquePH)
- LinkedIn: [eph3000](https://www.linkedin.com/in/eph3000)

**Built with [RStudio](https://posit.co/download/rstudio-desktop/)** •
Licensed under the [MIT
License](https://enriqueph.github.io/OEIS.R/LICENSE.md)
