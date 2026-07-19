# Get sequence internal format

In OEIS **internal format**, each sequence, is described by about 10
lines, each line beginning %x Aabcdef where x is a letter (I, S, T, N,
etc.) and abcdef is the 6-digit identification number (or catalog
number) of the sequence. Each sequence gets a unique A-number.

## Usage

``` r
OEIS_internal_format(ID)
```

## Arguments

- ID:

  A string with the OEIS sequence identifier `ID` number. The A-number
  or sequence `ID` is the absolute catalog number of the sequence. It
  consists of "A" followed by 6 digits.

## Value

An object of the classes `data.frame` and `OEIS_internal` with the full
sequence text internal format.
[`OEIS_check()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_check.md)

## References

[Internal Format Used In](https://oeis.org/eishelp1.html)

## See also

- [`OEIS_url()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_url.md)

&nbsp;

- [`OEIS_xml()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_xml.md)

&nbsp;

- [`OEIS_ID()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_ID.md)

## Examples

``` r
if (FALSE) { # \dontrun{
id <- "A000055"
OEIS_internal_format(id)
} # }
```
