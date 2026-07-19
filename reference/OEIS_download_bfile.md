# Download bfile from the OEIS

This function can be used to download a bfile from <https://oeis.org/>.

## Usage

``` r
OEIS_download_bfile(ID, destpath, ...)
```

## Arguments

- ID:

  A string with the OEIS sequence identifier `ID` number. The A-number
  or sequence `ID` is the absolute catalog number of the sequence. It
  consists of "A" followed by 6 digits.

- destpath:

  A character string with the name where the downloaded `bfile` is saved

- ...:

  Additional parameters (see
  [download.file](https://rdrr.io/r/utils/download.file.html))

## Value

An (invisible) integer code, 0 for success and non-zero for failure.

## See also

- [`OEIS_bfile_url()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_bfile_url.md)

&nbsp;

- [`OEIS_bfile()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_bfile.md)

## Examples

``` r
if (FALSE) { # \dontrun{
OEIS_download_bfile("A102030", "tests", quiet = TRUE)
} # }
```
