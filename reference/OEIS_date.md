# OEIS sequence creation date from `data.frame`

Sequence creation date.

## Usage

``` r
OEIS_date(x)
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

A `Date` object with the OEIS sequence creation date, or `NA` if no date
is found.

## Examples

``` r
if (FALSE) { # \dontrun{
id <- "A221863"
OEIS_date(id)
} # }
```
