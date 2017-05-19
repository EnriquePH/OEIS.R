test_that("OEIS_check shows an error", {
  testthat::expect_error(OEIS_check("A002000Z"))
})

test_that("OEIS_check works", {
  testthat::expect_error(OEIS_check("A002000"), NA)
})
