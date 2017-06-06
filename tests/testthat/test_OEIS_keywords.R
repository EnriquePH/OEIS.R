# A126669:		Erroneous version of A126668.
id_dead_sequence <- "A126669"

test_that("OEIS_example does not return 'dead' from erroneous sequence", {
  testthat::expect_equal(id_dead_sequence  %>%
                           OEIS_keywords, "dead")
})
