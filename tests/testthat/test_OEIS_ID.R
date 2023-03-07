# test_OEIS_ID.R

id_ok <- "A169890"
seq <- OEIS_sequence(id_ok)

test_that("OEIS_ID returns class", {
  testthat::expect_equal(class(OEIS_ID(id_ok)), "OEIS_ID")
})

test_that("OEIS_ID returns ID", {
  testthat::expect_equal(OEIS_ID(id_ok)[1], id_ok)
})


test_that("OEIS_ID returns ID", {
  testthat::expect_equal(OEIS_ID(id_ok)[1], id_ok)
})

test_that("OEIS_ID returns ID with xml", {
  testthat::expect_equal(OEIS_ID(seq$seq_xml)[1], id_ok)
})

test_that("OEIS_ID returns ID with sequence", {
  testthat::expect_equal(OEIS_ID(seq)[1], id_ok)
})
