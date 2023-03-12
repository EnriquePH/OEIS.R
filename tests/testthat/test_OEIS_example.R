# A100623: Erroneous version of A005649.
id_no_examples <- "A100623"

id_examples <- "A105805"
seq <- OEIS_example(id_examples)
internal_format <- OEIS_internal_format(id_examples)

test_that("OEIS_example returns NULL in a sequence without examples", {
  testthat::expect_equal(id_no_examples %>% OEIS_example, NULL)
})

test_that("OEIS_example id equals OEIS_example internal format", {
  testthat::expect_equal(id_examples %>% OEIS_example,
                         internal_format %>% OEIS_example)
})
