# Get OEIS sequence status

Status depends on sequence information updates.

## Usage

``` r
OEIS_status(x)
```

## Arguments

- x:

  Can be one of the following:

  - A character string with sequence `ID`.

  - A S3 object of classes `OEIS_xml` and `xml_document`, with the
    sequence content from OEIS web.

  - An object of `OEIS_sequence` class, that contains all sequence
    related data.

  - An object of `OEIS_ID` class.

## Value

A character string with the OEIS sequence status.

## Note

Possible status can be:

- "approved"

- "editing"

- "proposed"

- "reviewed".

## See also

- [`OEIS_check()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_check.md)

&nbsp;

- [`OEIS_df()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_df.md)

&nbsp;

- [`OEIS_xml()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_xml.md)

## Examples

``` r
if (FALSE) { # \dontrun{
id <- "A000108"
test_seq_xml <- OEIS_xml(id)
OEIS_status(test_seq_xml)
} # }
```
