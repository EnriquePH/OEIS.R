# Get OEIS sequence description

Sequence description gives a brief definition of the sequence. In the
description, *a(n)* usually denotes the n-th term of the sequence, and
*n* is a typical subscript. In some cases however *n* denotes a typical
term in the sequence.

## Usage

``` r
OEIS_description(x)
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

A string with the OEIS sequence description.

## See also

- [`OEIS_internal_format()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_internal_format.md)

&nbsp;

- [`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)

&nbsp;

- [`OEIS_xml()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_xml.md)

&nbsp;

- [`OEIS_check()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_check.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# Sequence description from ID
id <- "A000056"
OEIS_description(id)

# Alternate example using internal format
id <- "A003400"
internal_format <- OEIS_internal_format(id)
OEIS_description(internal_format)

# Sequence description from "OEIS_sequence" class
 id <- "A002315"
 seq <- OEIS_sequence(id)
 OEIS_description(seq)
} # }
```
