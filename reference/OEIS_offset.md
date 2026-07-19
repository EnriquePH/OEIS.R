# OEIS sequence offset from `xml2` data.

This line usually gives the subscript of the first term in the sequence.
If the sequence gives the decimal expansion of a constant, the offset is
the number of digits before the decimal point. In the OEIS web internal
format, there is a second offset, which says which term (counting from
the left, and starting with 1), first exceeds 1 in absolute value. This
is set to 1 if all the terms are 0 or +-1

## Usage

``` r
OEIS_offset(x)
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

A character vector with the OEIS sequence offsets.

## Note

In the internal format for a sequence the offset line (the %O line)
contains two numbers. The first is the offset as just defined. The
second gives the position of first entry greater than or equal to 2 in
magnitude in the sequence (or 1 if no such entry exists), starting
counting at 1. The second offset is used to determine the position of
the sequence in the lexicographic order in the database.

## References

[Explanation of the Different Lines](https://oeis.org/eishelp2.html#RS)

[What does the "offset" mean?](https://oeis.org/FAQ.html#Z23)

## See also

- [`OEIS_internal_format()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_internal_format.md)

&nbsp;

- [`OEIS_description()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_description.md)

&nbsp;

- [`OEIS_xml()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_xml.md)

&nbsp;

- [`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)

## Examples

``` r
if (FALSE) { # \dontrun{
id <- "A000056"
internal_format <- OEIS_internal_format(id)
OEIS_offset(internal_format)
} # }
```
