# Find url to search in OEIS a given text

Find url to search in OEIS a given text

## Usage

``` r
OEIS_search_url(txt)
```

## Arguments

- txt:

  A string with the text to search in OEIS web

## Value

A string with the search url in OEIS

## See also

- [`OEIS_web_url()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_web_url.md)

&nbsp;

- [`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)

## Examples

``` r
search_txt <- "Numbers n with property that in base 4 representation"
OEIS_search_url(search_txt)
#> [1] "https://oeis.org/search?q=Numbers+n+with+property+that+in+base+4+representation"
```
