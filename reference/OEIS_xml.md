# Retrieves content from OEIS web as an `XML` document

The `XML` document contains all the information from the OEIS web
related to the sequence.

## Usage

``` r
OEIS_xml(ID)
```

## Arguments

- ID:

  A string with the OEIS sequence identifier `ID` number. The A-number
  or sequence `ID` is the absolute catalog number of the sequence. It
  consists of "A" followed by 6 digits.

## Value

An `OEIS_xml` S3 class and `xml_document` from OEIS web with the
sequence content.

## See also

- [`OEIS_url()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_url.md)

&nbsp;

- [`OEIS_check()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_check.md)

## Examples

``` r
if (FALSE) { # \dontrun{
 id <- "A000156"
 test_seq_xml <- OEIS_xml(id)
 class(test_seq_xml)
} # }
```
