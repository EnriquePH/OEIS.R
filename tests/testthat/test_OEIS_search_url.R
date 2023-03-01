# test_OEIS_search_url

search_txt <- "Numbers n with property that in base 4 representation"
http_text <- "https://oeis.org/search?q="

len1 <- search_txt %>% OEIS_search_url %>% nchar
len2 <- http_text %>% nchar
len3 <- search_txt %>% nchar

test_that("OEIS_search_url number of characters", {
  testthat::expect_equal(len1, len2 + len3)
})
