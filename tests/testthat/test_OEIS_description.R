# Test OEIS_description

id <- "A000056"
internal_format <- OEIS_internal_format(id)
seq <- OEIS_sequence(id)
xml <- OEIS_xml(id)

test_that("OEIS_description works with internal_format and id", {
  testthat::expect_equal(OEIS_description(internal_format),
                         OEIS_description(id))
})

test_that("OEIS_description works with sequence and id", {
  testthat::expect_equal(OEIS_description(seq),
                         OEIS_description(id))
})

test_that("OEIS_description works with xml and id", {
  testthat::expect_equal(OEIS_description(xml),
                         OEIS_description(id))
})


OEIS_description(xml)

library(magrittr)

xml %>%
  rvest::html_table(., fill = TRUE) %>%
  magrittr::extract2(5) %>%
  magrittr::extract2(3)
