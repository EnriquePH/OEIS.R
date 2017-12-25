id_error <- "A002000Z"

test_that("OEIS_check shows an error", {
  testthat::expect_error(OEIS_check(id_error))
})

id_ok <- "A002000"

test_that("OEIS_check works", {
  testthat::expect_error(OEIS_check(id_ok), NA)
})

test_that("OEIS_check returns an object of the class OEIS_ID", {
  testthat::expect_identical(class(OEIS_check(id_ok)), "OEIS_ID")
})
