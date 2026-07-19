# OEIS Cross references

Cross references IDs

## Usage

``` r
OEIS_crossrefs(x)
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

An object of the class `OEIS_crossrefs` including referenced sequences,
sequences in context and adjacent sequences.

## See also

[`OEIS_seqs_in_context()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_seqs_in_context.md)

[`OEIS_seqs_adjacent()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_seqs_adjacent.md)

[`OEIS_cf()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_cf.md)

[`OEIS_df()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_df.md)

[`OEIS_xml()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_xml.md)

## Examples

``` r
if (FALSE) { # \dontrun{
id <- "A000112"
seq_html <- OEIS_xml(id)
OEIS_crossrefs(seq_html)
} # }
```
