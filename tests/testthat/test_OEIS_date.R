# test_OEIS_date.R

id_date <- "A138240"
id_no_date <- "A000240"

test_that("OEIS_date finds date", {
  testthat::expect_equal(id_date %>% OEIS_date, as.Date("2008-03-07"))
})

test_that("OEIS_date works with a dateless sequence", {
  testthat::expect_true(id_no_date %>% OEIS_date %>% is.na)
})

