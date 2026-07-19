# OEIS sequence keywords from sequence `internal_format`

These lines give keywords describing the sequence. The actual keywords,
in use, can be found at: [Explanation of Terms
Used](https://oeis.org/eishelp2.html)

## Usage

``` r
OEIS_keywords(x)
```

## Arguments

- x:

  Can be one of the following:

  - A character string with sequence `ID`.

  - A `OEIS_internal` S3 class object, with sequence internal format.

  - A S3 classes object `OEIS_xml` and `xml_document`, with sequence
    content from OEIS web.

  - An object of `OEIS_sequence` class, that contains all sequence
    related data.

## Value

A character vector with the OEIS sequence keywords.

## See also

- [`OEIS_author()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_author.md)

&nbsp;

- [`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)

&nbsp;

- [`OEIS_internal_format()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_internal_format.md)

&nbsp;

- [`OEIS_xml()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_xml.md)

## Examples

``` r
if (FALSE) { # \dontrun{
id <- "A049323"
seq <- OEIS_sequence(id)
xml <- OEIS_xml(id)
frmt <- OEIS_internal_format(id)
OEIS_keywords(id)
# Keywords from "OEIS_sequence" class
OEIS_keywords(seq)
# Keywords from "OEIS_xml"
OEIS_keywords(xml)
# Keywords from internal format: "OEIS_internal" class
OEIS_keywords(frmt)
} # }
```
