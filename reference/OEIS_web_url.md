# OEIS server main web page url

OEIS server main web page url

## Usage

``` r
OEIS_web_url(license = FALSE)
```

## Arguments

- license:

  A logical `FALSE` as default

## Value

A string with the main OEIS url: <https://oeis.org/>, or the *OEIS
End-User License Agreement* url, if parameter `license` is `TRUE`

## Examples

``` r
OEIS_web_url()
#> [1] "https://oeis.org/"
# Show license url
OEIS_web_url(license = TRUE)
#> [1] "https://oeis.org/LICENSE"
```
