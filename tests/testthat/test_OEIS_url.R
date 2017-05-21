id_error <- "A00005"

test_that("OEIS_url shows an error", {
  testthat::expect_error(OEIS_url(id_error))
})

id_ok <- "A000055"

test_that("OEIS_url returns and object of class character", {
  testthat::expect_equal(class(OEIS_url(id_ok)), "character")
})
