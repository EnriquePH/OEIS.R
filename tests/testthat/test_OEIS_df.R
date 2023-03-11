# test OEIS_df

id <- "A008406"
xml <- OEIS_xml(id)
df <- OEIS_df(xml)

test_that("OEIS df columns are OK", {
  testthat::expect_equal(colnames(OEIS_df(xml)), c("Line", "Description"))
})
