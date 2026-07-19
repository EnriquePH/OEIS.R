# OEIS Wolfram Mathematica code from sequence `internal_format`

These lines give `Mathematica` code to produce the sequence.

## Usage

``` r
OEIS_mathematica(x)
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

A character string with the OEIS sequence lines of examples or `NULL` if
there are no examples.

## See also

- [`OEIS_description()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_description.md)

&nbsp;

- [`OEIS_author()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_author.md)

&nbsp;

- [`OEIS_internal_format()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_internal_format.md)

&nbsp;

- [`OEIS_formula()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_formula.md)

&nbsp;

- [`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)

&nbsp;

- [`OEIS_xml()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_xml.md)

## Examples

``` r
if (FALSE) { # \dontrun{
id <- "A105805"
internal_format <- OEIS_internal_format(id)
mathematica <- OEIS_mathematica(internal_format)
cat(mathematica, sep = "\n")
} # }
```
