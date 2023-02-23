id <- "A123456"
x <- OEIS_sequence(id)

test_that("OEIS_ggplot class is ok", {
  testthat::expect_equal(class(OEIS_ggplot(x))[2], "ggplot")
})

test_that("OEIS_ggplot class is ok", {
  testthat::expect_equal(class(OEIS_ggplot(x))[1], "gg")
})
