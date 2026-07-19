id <- "A123456"
x <- OEIS_sequence(id)

test_that("OEIS_ggplot class is ok", {
  testthat::expect_true("ggplot" %in% class(OEIS_ggplot(x)))
})

test_that("OEIS_ggplot class is ok", {
  testthat::expect_true("gg" %in% class(OEIS_ggplot(x)))
})
