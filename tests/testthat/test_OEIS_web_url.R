test_that("OEIS_web_url license parameter is FALSE as default", {
  testthat::expect_equal(OEIS_web_url(), OEIS_web_url(license = FALSE))
})
