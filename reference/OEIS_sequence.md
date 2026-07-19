# S3 class constructor for `OEIS_sequence`

S3 class constructor for `OEIS_sequence`

## Usage

``` r
OEIS_sequence(ID)
```

## Arguments

- ID:

  A string with the OEIS sequence identifier `ID` number. The A-number
  or sequence `ID` is the absolute catalog number of the sequence. It
  consists of "A" followed by 6 digits.

## Value

An object of the S3 class `OEIS_sequence`.

## References

[Explanation of Terms Used in Reply
From](https://oeis.org/eishelp2.html#RS)

## See also

- [`OEIS_check()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_check.md)

&nbsp;

- [`OEIS_url()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_url.md)

&nbsp;

- [`OEIS_description()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_description.md)

&nbsp;

- [`OEIS_formerly()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_formerly.md)

&nbsp;

- [`OEIS_bfile()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_bfile.md)

&nbsp;

- [`OEIS_terms()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_terms.md)

&nbsp;

- [`OEIS_xml()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_xml.md)

&nbsp;

- [`OEIS_internal_format()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_internal_format.md)

&nbsp;

- [`OEIS_df()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_df.md)

## Examples

``` r
if (FALSE) { # \dontrun{
id <- "A003456"
A003456 <- OEIS_sequence(id)
class(A003456)
A003456
} # }
```
