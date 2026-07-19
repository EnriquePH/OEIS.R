# OEIS sequence extensions from sequence `internal_format`

This field is to claim credit for additions to the entry that can't be
properly acknowledged in other fields. The most common use is to
acknowledge more terms for sequences that had only a few previously.

## Usage

``` r
OEIS_extensions(x)
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

A character string with the OEIS sequence extensions lines or `NULL` if
there are no extensions.

## Note

[OEIS Wiki: Style sheet for
contributors](http://oeis.org/wiki/Style_Sheet)

## See also

- [`OEIS_description()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_description.md)

&nbsp;

- [`OEIS_internal_format()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_internal_format.md)

&nbsp;

- [`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)

&nbsp;

- [`OEIS_example()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_example.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# A008406: Triangle T(n,k) read by rows, giving number of graphs with n nodes
# (n >= 1) and k edges (0 <= k <= n(n-1)/2).
id <- "A008406"
internal_format <- OEIS_internal_format(id)
extensions <- OEIS_extensions(internal_format)
cat(extensions, sep = "\n")
} # }
```
