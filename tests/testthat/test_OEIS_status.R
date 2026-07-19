# test_OEIS_status

skip_if_oeis_unreachable()

id_status <- "A000108"

test_that("OEIS_status works", {
  testthat::expect_equal(OEIS_status(id_status), "approved")
})
