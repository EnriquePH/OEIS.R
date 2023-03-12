# test OEIS_links

id <- "A105805"
internal_format <- OEIS_internal_format(id)
#xml <- OEIS_xml(id)
seq <- OEIS_sequence(id)

test_that("OEIS_links from internal format and id", {
  testthat::expect_equal(OEIS_links(internal_format), OEIS_links(id))
})

test_that("OEIS_links from sequence and id", {
  testthat::expect_equal(OEIS_links(seq), OEIS_links(id))
})


