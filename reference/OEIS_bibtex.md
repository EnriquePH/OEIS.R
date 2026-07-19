# Getting BibTeX citation from OEIS sequence

Getting BibTeX citation from OEIS sequence

## Usage

``` r
OEIS_bibtex(x)
```

## Arguments

- x:

  An object of class `OEIS_sequence`

## Value

An object of class `bibentry` with the citation, the function populates
a `Misc` entry type, for use when nothing else fits, with the following
fields:

- **key**: a character string giving the citation key for the OEIS
  sequence.

- **author**: The name(s) of the author(s) (in the case of more than one
  author, separated by `and`).

- **title**: The **O**n-**L**ine **E**ncyclopedia of **I**nteger
  **S**equences.

- **url**: Link to sequence in OEIS.

- **year**: The year of publication (or, if unpublished, the year of
  creation).

- **month**: The month of publication (or, if unpublished, the month of
  creation).

- **note**: Sequence description.

## Note

Fields tags are separated by commas. The last tag finishes with a comma
, although is not necessarily. The tag's name is not case-sensitive but
caps are used.

For more help on `bibentry` class, see:
[`utils::bibentry()`](https://rdrr.io/r/utils/bibentry.html)

## References

- [BibTeX Format Description](http://www.bibtex.org/Format/)

- [BibTeX AUTOMATIC OEIS
  CITATIONS](http://psychedelic-geometry.blogspot.com.es/2010/02/bibtex-automatic-oeis-citations.md)

- [Mathematica OEIS
  Package](https://github.com/Psychedelic-Geometry/OEIS-Mathematica/wiki)

- [Wikipedia: BibTex](https://en.wikipedia.org/wiki/BibTeX)

- [Referencing a Particular
  Sequence](https://oeis.org/wiki/Welcome#reference)

## See also

- [`utils::person()`](https://rdrr.io/r/utils/person.html)

&nbsp;

- [`utils::toBibtex()`](https://rdrr.io/r/utils/toLatex.html)

&nbsp;

- [`OEIS_author()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_author.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- OEIS_sequence("A170401")
bref <- OEIS_bibtex(x)
# BibTeX and citation.
print(bref, style = "Bibtex")
print(bref, style = "citation")
} # }
```
