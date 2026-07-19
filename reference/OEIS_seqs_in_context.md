# OEIS Sequences in context from from XML document

This line show the three sequences `ID`s immediately before and after
the sequence in the lexicographic listing.

## Usage

``` r
OEIS_seqs_in_context(x)
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

A character vector OEIS sequences in context IDs

## See also

[`OEIS_seqs_adjacent()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_seqs_adjacent.md)

[`OEIS_crossrefs()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_crossrefs.md)

[`OEIS_cf()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_cf.md)

[`OEIS_xml()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_xml.md)

[`OEIS_df()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_df.md)

[`OEIS_ID()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_ID.md)

## Examples

``` r
if (FALSE) { # \dontrun{
id <- "A000112"
seq_xml <- OEIS_xml(id)
OEIS_seqs_in_context(seq_xml)
} # }
```
