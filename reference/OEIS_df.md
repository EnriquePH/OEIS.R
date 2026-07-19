# Get OEIS sequence information lines from XML document data

This lines are useful to get all the sequence format data.

## Usage

``` r
OEIS_df(seq_xml)
```

## Arguments

- seq_xml:

  A class `OEIS_xml` document extracted from an OEIS sequence.

## Value

A `data.frame` with the sequence information lines.

## References

[Explanation of Terms Used in Reply
From](https://oeis.org/eishelp2.html#RS)

## See also

- [`OEIS_xml()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_xml.md)

&nbsp;

- [`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)

## Examples

``` r
if (FALSE) { # \dontrun{
id <- "A008406"
xml <- OEIS_xml(id)
df <- OEIS_df(xml)
df
} # }
```
