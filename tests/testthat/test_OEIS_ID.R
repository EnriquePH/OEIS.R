# test_OEIS_ID.R

id_ok <- "A169890"

test_that("OEIS_ID returns class", {
  testthat::expect_equal(class(OEIS_ID(id_ok)), "OEIS_ID")
})

test_that("OEIS_ID returns ID", {
  testthat::expect_equal(OEIS_ID(id_ok)[1], id_ok)
})
