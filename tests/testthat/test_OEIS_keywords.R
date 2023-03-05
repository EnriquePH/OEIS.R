# A126669:		Erroneous version of A126668.
id_dead_sequence <- "A126669"
id_sequence <-"A000001"

test_that("OEIS_keywords does not return 'dead' from erroneous sequence", {
  testthat::expect_equal(id_dead_sequence  %>%
                           OEIS_keywords, "dead")
})

test_that("OEIS_keywords returns a character", {
  testthat::expect_equal(id_sequence  %>%
                           OEIS_keywords %>%
                           class, "character")
})
