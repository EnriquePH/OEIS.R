# These tests build an OEIS_sequence-shaped object by hand instead of
# fetching one from oeis.org. Most OEIS_*.OEIS_sequence methods (and a few
# other functions) are pure lookups/transformations on already-fetched
# data, so they can be tested deterministically without any network access
# or dependence on oeis.org being reachable.

fake_seq <- structure(
  list(
    ID = "A999999",
    url = "https://oeis.org/A999999/",
    description = "A fake sequence for offline testing.",
    formerly = c("M1234", "N5678"),
    bfile = list(
      bfile_url = "https://oeis.org/A999999/b999999.txt",
      data = data.frame(n = 0:4, A999999 = c(1, 1, 2, 3, 5))
    ),
    terms = c("1", "1", "2", "3", "5"),
    offset = c("0", "1"),
    comments = c("First fake comment.", "Second fake comment."),
    links = c("Fake Link One", "Fake Link Two"),
    example = "a(4) = 5.",
    formula = "a(n) = a(n-1) + a(n-2).",
    mathematica = "Fibonacci[Range[0, 10]]",
    crossrefs = structure(
      list(
        cf = c("A000045", "A000032"),
        seqs_in_context = c("A111111", "A222222", "A333333"),
        seqs_adjacent = c("A999997", "A999998", "A999999")
      ),
      class = "OEIS_crossrefs"
    ),
    keywords = c("nonn", "easy"),
    author = "Jane Doe (jdoe@example.com)",
    date = as.Date("2020-01-01"),
    extensions = "More terms from Jane Doe.",
    status = "approved",
    internal_format = NULL,
    seq_df = NULL,
    seq_xml = NULL
  ),
  class = "OEIS_sequence"
)

test_that("OEIS_ID.OEIS_sequence returns the stored ID", {
  expect_equal(OEIS_ID(fake_seq), "A999999")
})

test_that("OEIS_description.OEIS_sequence returns the stored description", {
  expect_equal(OEIS_description(fake_seq), fake_seq$description)
})

test_that("OEIS_formerly.OEIS_sequence returns the stored formerly IDs", {
  expect_equal(OEIS_formerly(fake_seq), fake_seq$formerly)
})

test_that("OEIS_terms.OEIS_sequence returns the stored terms", {
  expect_equal(OEIS_terms(fake_seq), fake_seq$terms)
})

test_that("OEIS_offset.OEIS_sequence returns the stored offset", {
  expect_equal(OEIS_offset(fake_seq), fake_seq$offset)
})

test_that("OEIS_comments.OEIS_sequence returns the comments, not the example", {
  expect_equal(OEIS_comments(fake_seq), fake_seq$comments)
  expect_false(identical(OEIS_comments(fake_seq), fake_seq$example))
})

test_that("OEIS_links.OEIS_sequence returns the stored links", {
  expect_equal(OEIS_links(fake_seq), fake_seq$links)
})

test_that("OEIS_example.OEIS_sequence returns the stored example", {
  expect_equal(OEIS_example(fake_seq), fake_seq$example)
})

test_that("OEIS_formula.OEIS_sequence returns the stored formula", {
  expect_equal(OEIS_formula(fake_seq), fake_seq$formula)
})

test_that("OEIS_mathematica.OEIS_sequence returns the stored code", {
  expect_equal(OEIS_mathematica(fake_seq), fake_seq$mathematica)
})

test_that("OEIS_keywords.OEIS_sequence returns the stored keywords", {
  expect_equal(OEIS_keywords(fake_seq), fake_seq$keywords)
})

test_that("OEIS_date.OEIS_sequence returns the stored date", {
  expect_equal(OEIS_date(fake_seq), fake_seq$date)
})

test_that("OEIS_extensions.OEIS_sequence returns the stored extensions", {
  expect_equal(OEIS_extensions(fake_seq), fake_seq$extensions)
})

test_that("OEIS_status.OEIS_sequence returns the stored status", {
  expect_equal(OEIS_status(fake_seq), fake_seq$status)
})

test_that("crossref accessors read from $crossrefs", {
  expect_equal(OEIS_cf(fake_seq), fake_seq$crossrefs$cf)
  expect_equal(
    OEIS_seqs_in_context(fake_seq),
    fake_seq$crossrefs$seqs_in_context
  )
  expect_equal(OEIS_seqs_adjacent(fake_seq), fake_seq$crossrefs$seqs_adjacent)
})

test_that("OEIS_author.OEIS_sequence strips the email by default", {
  expect_equal(OEIS_author(fake_seq), "Jane Doe")
})

test_that("OEIS_author.OEIS_sequence keeps the email when requested", {
  expect_equal(OEIS_author(fake_seq, email = TRUE), fake_seq$author)
})

test_that("plot.OEIS_sequence draws without error", {
  tmp <- tempfile(fileext = ".png")
  grDevices::png(tmp)
  on.exit({
    grDevices::dev.off()
    unlink(tmp)
  })
  expect_error(plot(fake_seq), NA)
})

test_that("OEIS_ggplot.OEIS_sequence returns a ggplot object", {
  p <- OEIS_ggplot(fake_seq)
  expect_true("ggplot" %in% class(p))
  expect_true("gg" %in% class(p))
})

test_that("OEIS_bibtex.OEIS_sequence builds a bibentry with a date", {
  bref <- OEIS_bibtex(fake_seq)
  expect_s3_class(bref, "bibentry")
  expect_equal(bref$note, "A999999: A fake sequence for offline testing.")
  expect_equal(format(bref$year), "2020")
})

test_that("OEIS_bibtex.OEIS_sequence handles a NULL date", {
  seq_no_date <- fake_seq
  seq_no_date$date <- NULL
  bref <- OEIS_bibtex(seq_no_date)
  # bibentry() drops empty-string fields entirely
  expect_null(bref$year)
  expect_null(bref$month)
})

test_that("OEIS_ID.OEIS_bfile extracts the ID from the bfile url", {
  bf <- structure(
    list(bfile_url = "https://oeis.org/A000055/b000055.txt"),
    class = "OEIS_bfile"
  )
  expect_equal(OEIS_ID(bf)[1], "A000055")
})

test_that("OEIS_bfile_url builds the file name and the full url", {
  expect_equal(OEIS_bfile_url("A000055"), "b000055.txt")
  expect_equal(
    OEIS_bfile_url("A000055", URL = TRUE),
    paste0(OEIS_url("A000055"), "b000055.txt")
  )
})

test_that("author_list joins one, two, and several authors correctly", {
  expect_equal(author_list("Alice"), "Alice")
  expect_equal(author_list(c("Alice", "Bob")), "Alice and Bob")
  expect_equal(
    author_list(c("Alice", "Bob", "Carol")),
    "Alice, Bob and Carol"
  )
})

test_that("char0toNULL converts character(0)/list() to NULL, else passes", {
  expect_null(OEIS.R:::char0toNULL(character(0)))
  expect_null(OEIS.R:::char0toNULL(list()))
  expect_equal(OEIS.R:::char0toNULL("A000055"), "A000055")
  expect_equal(OEIS.R:::char0toNULL(c("a", "b")), c("a", "b"))
})

test_that("OEIS_web_url returns the license url when requested", {
  expect_equal(OEIS_web_url(license = TRUE), paste0(OEIS_web_url(), "LICENSE"))
})
