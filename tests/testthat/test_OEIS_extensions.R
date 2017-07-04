# A000055_
id_no_extensions <- "A000055"

test_that("OEIS_extensions returns NULL in a sequence without extensions", {
  testthat::expect_equal(id_no_extensions %>%
                           OEIS_extensions, NULL)
})
