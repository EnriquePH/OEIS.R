# Get OEIS sequence former `ID`

This is an alternate `ID` for some sequences that also have a 4-digit
M-number, such as `M1459`, which is the number they carried in "The
Encyclopedia of Integer Sequences" by N.J.A. Sloane and S. Plouffe,
Academic Press, San Diego, CA, 1995. 'Some older sequences also have a
4-digit N-number, such as N0577, which is the number they carried in the
"Handbook of Integer Sequences", by N. J. A. Sloane, Academic Press, NY,
1973

## Usage

``` r
OEIS_formerly(x)
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

A string with the OEIS former `ID` or `NULL`, if there is no former
sequence designation.

## See also

- [`OEIS_description()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_description.md)

&nbsp;

- [`OEIS_internal_format()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_internal_format.md)

&nbsp;

- [`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)

&nbsp;

- [`OEIS_xml()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_xml.md)

## Examples

``` r
if (FALSE) { # \dontrun{
id <- "A000056"
internal_format <- OEIS_internal_format(id)
OEIS_formerly(internal_format)
} # }
```
