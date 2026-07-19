# OEIS Adjacent sequences from XML document

Adjacent sequences `ID`s in OEIS. These are the three sequences whose
A-numbers are immediately before and after the A-number of the sequence.

## Usage

``` r
OEIS_seqs_adjacent(x)
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

[`OEIS_seqs_in_context()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_seqs_in_context.md)

[`OEIS_crossrefs()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_crossrefs.md)

[`OEIS_cf()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_cf.md)

[`OEIS_xml()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_xml.md)

## Examples

``` r
if (FALSE) { # \dontrun{
id <- "A000112"
seq_html <- OEIS_xml(id)
OEIS_seqs_adjacent(seq_html)
} # }
```
