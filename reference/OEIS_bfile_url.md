# Get sequence data url in `bfile` format.

A **bfile** is a text formatted file that provides many more terms of a
sequence than the typical fifty to eighty terms that can be shown in the
main sequence entry.

## Usage

``` r
OEIS_bfile_url(ID, URL)
```

## Arguments

- ID:

  A string with the OEIS sequence identifier `ID` number. The A-number
  or sequence `ID` is the absolute catalog number of the sequence. It
  consists of "A" followed by 6 digits.

- URL:

  A logical that selects if the output is the complete url, or just the
  `bfile` file name.

## Value

A string with the sequence **bfile** url, or the **bfile** file name

## See also

- [`OEIS_url()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_url.md)

&nbsp;

- [`OEIS_check()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_check.md)

## Examples

``` r
id <- "A000056"
OEIS_bfile_url(id, URL = FALSE)
#> [1] "b000056.txt"
OEIS_bfile_url(id, URL = TRUE)
#> [1] "https://oeis.org/A000056/b000056.txt"
```
