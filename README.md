<!-- badges: start -->
[![R-CMD-check](https://github.com/EnriquePH/OEIS.R/actions/workflows/R-CMD-check.yaml/badge.svg?branch=master)](https://github.com/EnriquePH/OEIS.R/actions/workflows/R-CMD-check.yaml) [![Travis-CI Build Status](https://travis-ci.org/EnriquePH/OEIS.R.svg?branch=master)](https://travis-ci.org/EnriquePH/OEIS.R) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/EnriquePH/OEIS.R?branch=master&svg=true)](https://ci.appveyor.com/project/EnriquePH/OEIS.R) [![Codecov test coverage](https://codecov.io/gh/EnriquePH/OEIS.R/branch/master/graph/badge.svg)](https://app.codecov.io/gh/EnriquePH/OEIS.R?branch=master) ![License](https://img.shields.io/:license-mit-blue.svg)
 <!-- badges: end -->

# OEIS.R Package

Data from [The On-Line Encyclopedia of Integer Sequences](https://oeis.org/) in
R

<img src="https://raw.githubusercontent.com/EnriquePH/OEIS.R/master/sticker/OEIS.R-sticker.png" rel="OEIS.R-sticker" width="172" height="200">

## Summary

[The On-Line Encyclopedia of Integer Sequences](https://oeis.org/) is one of
the most amazing projects to document and improve mathematical knowledge:
formulas, comments, computer code, links, references...

The database of integer sequences, OEIS records information about integer
sequences of interest to both professional mathematicians and amateurs, and it
is widely cited.

Due to OEIS, many new mathematical truth has been found, more than 6000 articles
are actually referencing OEIS.

On the other hand, _R_ is an _open source programming language and software
environment for statistical computing and graphics_, that is supported by the [R
Foundation for Statistical Computing](https://www.r-project.org/foundation/).
_R language_ is widely used among statisticians, data scientists, and data
miners for developing statistical software and data analysis.

This extension for _R_ helps to include organized data from the [The On-Line
Encyclopedia of Integer Sequences](https://oeis.org/) in your code, and it can
be used to find, visualize and test, new mathematical hypothesis and also can be
used to improve the content of the data in OEIS.


## Package installation:

```r
# install.packages("devtools")
library(devtools)
devtools::install_github("EnriquePH/OEIS.R")
```

## Take the first steps with `OEIS.R`

```r
# Loading packages
library(OEIS.R)
library(ggplot2)

# Download sequence from OEIS
id <- "A001615"
x <- OEIS_sequence(id)

# Plot sequence
OEIS_ggplot(x) +
 geom_line() +
 geom_point(size = 0.5, color = "green")
```
![](https://raw.githubusercontent.com/EnriquePH/OEIS.R/master/img/A001615.png)

## OEIS.R App
This a `shiny` application that makes use of OEIS.R package. 
[shiny OEIS App](https://kikesoft.shinyapps.io/OEIS/)

## Links:
* [OEIS: Explanation of Terms](https://oeis.org/eishelp2.html)
* [THE OEIS TERMS OF USE AGREEMENT](https://oeis.org/OEISTermsOfUse.pdf)
* [Wikipedia: On-Line Encyclopedia of Integer Sequences](https://en.wikipedia.org/wiki/On-Line_Encyclopedia_of_Integer_Sequences)
* [The OEIS Foundation Inc](http://oeisf.org/)

