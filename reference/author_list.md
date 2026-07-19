# Getting authors list from author vectors

Getting authors list from author vectors

## Usage

``` r
author_list(x)
```

## Arguments

- x:

  A character list with sequence authors

## Value

A character with the author list properly joined with commas and the
conjunction "and"

## Examples

``` r
author_test <- c("first author", "second author", "last author")
author_test2 <- c("first author", "second author")
author_list(author_test)
#> [1] "first author, second author and last author"
author_list(author_test2)
#> [1] "first author and second author"
```
