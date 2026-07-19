# S3 class constructor for `bfile` data.

A `bfile` is a text formatted file that provides many more terms of a
sequence than the typical fifty to eighty terms that can be shown in the
main sequence entry.

## Usage

``` r
OEIS_bfile(ID)
```

## Arguments

- ID:

  A character string or an object of the class `OEIS_ID`

## Value

A S3 object of the class `OEIS_bfile` with the following structure:

- **bfile_name**: Name of `bfile`.

- **bfile_url**: Url to `bfile` in the OEIS server.

- **min_n**: Minimum `n` position of the first term for available values
  of the sequence.

- **max_n**: Maximum `n` position of the last term for available values
  of the sequence.

- **comments**: Text comments included into the `bfile`

- **data**: A data frame including all data within the `bfile` with two
  columns: **n** and other named as the sequence `ID` including sequence
  values for **a(n)**.

## See also

- [`OEIS_bfile_url()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_bfile_url.md)

&nbsp;

- [`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)

&nbsp;

- [`OEIS_check()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_check.md)

&nbsp;

- [`OEIS_download_bfile()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_download_bfile.md)

## Examples

``` r
if (FALSE) { # \dontrun{
id <- "A000056"
OEIS_bfile(id)
} # }
```
