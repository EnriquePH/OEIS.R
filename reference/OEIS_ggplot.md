# OEIS_ggplot Plot OEIS sequence with ggplot

OEIS_ggplot Plot OEIS sequence with ggplot

## Usage

``` r
OEIS_ggplot(x)
```

## Arguments

- x:

  An object of class `OEIS_sequence`

## Value

A graphic object of the classes `gg` and `ggplot`

## See also

- [`OEIS_bibtex()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_bibtex.md)

&nbsp;

- [`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# A123456: Ludwig van Beethoven, Bagatelle No. 25, Für Elise.
id <- "A123456"
x <- OEIS_sequence(id)
OEIS_ggplot(x)
} # }
```
