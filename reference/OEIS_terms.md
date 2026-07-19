# Get OEIS sequence terms from `XML` document.

This is the data included in the sequence. These lines give the
beginning of the sequence. Ideally the entry gives enough terms to fill
about three lines on the screen. The terms must be integers. If the
terms are fractions, then the numerators and denominators appear as
separate sequences, labeled with the Keyword "frac", and with links
connecting the two sequences. Only sequences that are well-defined and
of general interest are included

## Usage

``` r
OEIS_terms(x)
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

A character list with the OEIS sequence terms.

## Note

For more terms see
[`OEIS_bfile()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_bfile.md).

## See also

- [`OEIS_internal_format()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_internal_format.md)

&nbsp;

- [`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)

&nbsp;

- [`OEIS_bfile()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_bfile.md)

&nbsp;

- [`OEIS_xml()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_xml.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# Wieferich primes: primes p such that p^2 divides 2^(p-1) - 1.
id <- "A001220"
internal_format <- OEIS_internal_format(id)
OEIS_terms(internal_format)
} # }
```
