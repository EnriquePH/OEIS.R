# OEIS sequence linked cross references from sequence information `data.frame`

OEIS sequence linked cross references from sequence information
`data.frame`

## Usage

``` r
OEIS_cf(x)
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

A character vector with OEIS sequence linked cross references `ID`s.

## See also

- [`OEIS_seqs_adjacent()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_seqs_adjacent.md)

&nbsp;

- [`OEIS_crossrefs()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_crossrefs.md)

&nbsp;

- [`OEIS_xml()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_xml.md)

&nbsp;

- [`OEIS_df()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_df.md)

## Examples

``` r
if (FALSE) { # \dontrun{
id <- "A240106"
seq_html <- OEIS_xml(id)
seq_df <- OEIS_df(seq_html)
OEIS_cf(seq_df)
} # }
```
