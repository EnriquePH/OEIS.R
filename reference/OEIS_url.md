# Get sequence url in the OEIS server

Get sequence url in the OEIS server

## Usage

``` r
OEIS_url(ID, text)
```

## Arguments

- ID:

  A string with the OEIS sequence identifier `ID` number. The A-number
  or sequence `ID` is the absolute catalog number of the sequence. It
  consists of "A" followed by 6 digits.

- text:

  A logical if `TRUE` the function returns the internal format url, if
  `FALSE` it returns full sequence url.

## Value

A string with the full sequence url, or the internal format url.
[`OEIS_check()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_check.md)

## References

[Internal Format Used In](https://oeis.org/eishelp1.html)

## See also

- [`OEIS_web_url()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_web_url.md)

## Examples

``` r
OEIS_url("A000055")
#> [1] "https://oeis.org/A000055/"
OEIS_url("A000055", text = TRUE)
#> [1] "https://oeis.org/search?q=id:A000055&fmt=text"
```
