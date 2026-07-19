# OEIS ID Validation

OEIS ID Validation

## Usage

``` r
OEIS_check(ID)
```

## Arguments

- ID:

  A string with the OEIS sequence identifier `ID` number. The A-number
  or sequence `ID` is the absolute catalog number of the sequence. It
  consists of "A" followed by 6 digits.

## Value

An object of class `"OEIS_ID"` or an error if `ID` is not an OEIS valid
ID

## See also

- [`OEIS_url()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_url.md)

&nbsp;

- [`OEIS_ID()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_ID.md)

## Examples

``` r
OEIS_check("A002000")
#> [1] "A002000"
#> attr(,"class")
#> [1] "OEIS_ID"
```
