# OEIS sequence authors from `internal format`, or from the sequence `ID`.

This function gives the name of the person, or persons, who contributed
the sequence and their emails, if they are present and selected.

## Usage

``` r
OEIS_author(x, email = FALSE)
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

- email:

  A logical, by specifying: `email = TRUE`, the author's email is
  returned, if present, with the author's name. The default value of
  `email` is `FALSE`.

## Value

A character vector with the OEIS sequence authors and emails.

## See also

- [`OEIS_description()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_description.md)

&nbsp;

- [`OEIS_internal_format()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_internal_format.md)

&nbsp;

- [`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)

&nbsp;

- [`OEIS_check()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_check.md)

## Examples

``` r
if (FALSE) { # \dontrun{
id <- "A169890"
OEIS_author(id, email = TRUE)
} # }
```
