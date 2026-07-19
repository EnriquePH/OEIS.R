# Getting Started with OEIS.R

**Note:** `oeis.org` was not reachable while this copy of the vignette
was built, so the code chunks below are shown but were not run and
display no output.

### Introduction

The [On-Line Encyclopedia of Integer Sequences](https://oeis.org/)
(OEIS) is a database of over 390,000 integer sequences, each documented
with a description, formulae, references, links, and example code in
several languages. **OEIS.R** fetches a sequence’s entry from `oeis.org`
and parses it into structured R objects, so it can be explored, cited,
and plotted without leaving R.

Because every function in this vignette talks to `oeis.org` directly
(there are no bundled fixtures), building it requires an internet
connection, and the output you see reflects the live state of OEIS at
build time. Please respect [OEIS’s terms of
use](https://oeis.org/OEISTermsOfUse.pdf) and avoid hammering the server
with tight loops over many sequences.

### Installation

``` r

# install.packages("devtools")
devtools::install_github("EnriquePH/OEIS.R")
```

### Loading the package

``` r

library(OEIS.R)
```

### OEIS urls

``` r

OEIS_web_url()
OEIS_web_url(license = TRUE)
```

[`OEIS_search_url()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_search_url.md)
builds a URL for a free-text search of the encyclopedia:

``` r

OEIS_search_url("Dedekind psi function")
```

### Number of sequences in the encyclopedia

``` r

OEIS_total_sequences()
```

## Fetching a sequence

### The `OEIS_sequence` S3 class

[`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)
takes an `ID` (a string of the form `"A"` followed by 6 digits) and
downloads and parses the sequence’s full entry:

``` r

id <- "A001615"
A001615 <- OEIS_sequence(id)
class(A001615)
names(A001615)
```

An invalid `ID` is rejected up front, before any network request is
made:

``` r

OEIS_check("hello")
```

### Basic sequence information

``` r

A001615$ID
A001615$description
A001615$formerly   # old M-/N-number from Sloane's printed catalogs
A001615$offset
A001615$keywords
A001615$status
A001615$url
```

### Author and date

``` r

A001615$author
```

Not every entry has a parseable trailing date on its author line — when
it doesn’t, `$date` is `NULL` rather than a `Date`:

``` r

A001615$date

A138240 <- OEIS_sequence("A138240")
A138240$date
```

### Terms

`$terms` holds the (typically 50-80) leading terms shown on the
sequence’s page:

``` r

head(A001615$terms, 15)
```

For longer runs, use the sequence’s **b-file**, which OEIS provides
separately and which this package downloads via
[`OEIS_bfile()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_bfile.md):

``` r

A001615$bfile$min_n
A001615$bfile$max_n
head(A001615$bfile$data)
```

### Comments, formula, and links

``` r

length(A001615$comments)
A001615$comments[1]

length(A001615$formula)
A001615$formula[1:3]
```

``` r

library(knitr)
kable(data.frame(link = A001615$links[1:5]))
```

### Cross references

Besides the sequences explicitly referenced in the entry’s `CROSSREFS`
section (`$cf`), OEIS also shows the neighboring sequences in
lexicographic order (`$seqs_in_context`) and by `A`-number
(`$seqs_adjacent`):

``` r

A001615$crossrefs$cf
A001615$crossrefs$seqs_in_context
A001615$crossrefs$seqs_adjacent
```

## Plotting

### Base R

``` r

plot(A001615)
```

### `ggplot2`

[`OEIS_ggplot()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_ggplot.md)
plots the full b-file (not just the leading terms shown above) and
returns a normal `ggplot` object you can extend:

``` r

library(ggplot2)

OEIS_ggplot(A001615) +
  geom_line() +
  geom_point(size = 0.5, color = "green") +
  labs(title = paste("OEIS", id, "-", A001615$description))
```

## Citing a sequence

[`OEIS_bibtex()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_bibtex.md)
builds a citable `bibentry` for a sequence, following the citation
format suggested by [OEIS
itself](https://oeis.org/wiki/Welcome#reference):

``` r

bref <- OEIS_bibtex(A001615)
print(bref, style = "Bibtex")
bref$note
```

## Working from just an `ID`

Every accessor used above
([`OEIS_description()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_description.md),
[`OEIS_formula()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_formula.md),
…) also works directly on a character `ID`, without building the full
`OEIS_sequence` object first — useful when you only need one or two
fields and want to avoid the extra requests
[`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)
makes (crossrefs and b-file, in particular, each cost a separate
request):

``` r

OEIS_description(id)
OEIS_keywords(id)
```

Internally, a character `ID` is validated into an `OEIS_ID` object and
then, for most fields, converted to the sequence’s parsed *internal
format* (OEIS’s compact `%`-tagged export format). You can inspect that
intermediate object directly:

``` r

internal_format <- OEIS_internal_format(id)
class(internal_format)
head(internal_format)
```

## Session info

``` r

sessionInfo()
```
