# A100623: Erroneous version of A005649.
id_no_examples <- "A100623"

test_that("OEIS_example returns NULL in a sequence without examples", {
  testthat::expect_equal(id_no_examples %>% OEIS_example, NULL)
})
