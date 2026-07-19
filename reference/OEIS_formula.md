# OEIS sequence formula lines from sequence `internal_format`

These lines give formulae, recurrences, generating functions, etc. for
the sequence. **a(n)** usually denotes the n-th term of the sequence,
and **n** is a typical subscript.

## Usage

``` r
OEIS_formula(x)
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

A character string with the OEIS sequence formula lines or `NULL` if
there are no formulae.

## References

<https://oeis.org/FAQ.html#Z08>

## See also

[`OEIS_description()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_description.md)

[`OEIS_internal_format()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_internal_format.md)

[`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)

[`OEIS_example()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_example.md)

## Examples

``` r
if (FALSE) { # \dontrun{
id <- "A105805"
internal_format <- OEIS_internal_format(id)
formula <- OEIS_formula(internal_format)
cat(formula, sep = "\n")
} # }
```
