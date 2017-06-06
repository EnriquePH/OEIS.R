# A126669:		Erroneous version of A126668.
id_no_formula <- "A126669"

test_that("OEIS_example returns NULL in a sequence without formula", {
  testthat::expect_equal(id_no_formula %>%
                           OEIS_formula, NULL)
})
