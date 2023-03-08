# Test OEIS_description

id <- "A000056"
internal_format <- OEIS_internal_format(id)
seq <- OEIS_sequence(id)

test_that("OEIS_description works with internal_format and id", {
  testthat::expect_equal(OEIS_description(internal_format),
                         OEIS_description(id))
})

test_that("OEIS_description works with sequence and id", {
  testthat::expect_equal(OEIS_description(seq),
                         OEIS_description(id))
})
