# Changelog

## OEIS.R 0.2.0

OEIS redesigned its sequence pages (the old `<tt>`/table-based HTML
layout was replaced with
`div.section`/`div.sectname`/`div.sectbody`/`div.sectline` markup),
which broke every function that scraped the full sequence page. This
release re-targets all of that scraping at the new page structure and
fixes a couple of latent parsing bugs found along the way.

- Fixed
  [`OEIS_df()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_df.md)
  (and everything built on it:
  [`OEIS_status()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_status.md),
  [`OEIS_crossrefs()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_crossrefs.md),
  [`OEIS_cf()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_cf.md),
  [`OEIS_seqs_in_context()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_seqs_in_context.md),
  [`OEIS_seqs_adjacent()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_seqs_adjacent.md),
  and the `OEIS_xml` methods of
  [`OEIS_comments()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_comments.md),
  [`OEIS_links()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_links.md),
  [`OEIS_example()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_example.md),
  [`OEIS_formula()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_formula.md),
  [`OEIS_mathematica()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_mathematica.md),
  [`OEIS_extensions()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_extensions.md),
  [`OEIS_author()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_author.md),
  [`OEIS_date()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_date.md))
  to use OEIS’s current page markup. This was the root cause of
  [`OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_sequence.md)
  failing outright.
- Fixed `OEIS_description.OEIS_xml()`, `OEIS_formerly.OEIS_xml()`,
  `OEIS_terms.OEIS_xml()`, `OEIS_offset.OEIS_xml()`, and
  `OEIS_keywords.OEIS_xml()`, which relied on `<tt>` elements that no
  longer exist on the page.
- Fixed a bug in
  [`OEIS_formerly()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_formerly.md)
  that returned the sequence’s revision number and last-modified
  timestamp (e.g. `"#400"`, `"Jun"`, `"2026"`) alongside, or instead of,
  the actual M-/N-number.
- Fixed
  [`OEIS_total_sequences()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_total_sequences.md),
  which no longer matched OEIS’s front page markup; it now reads the
  total from `div.dbinfo` and returns `NA_integer_` (instead of a
  silently stale hardcoded count) when the page can’t be parsed.
- Removed the `stringr` dependency introduced in a work-in-progress fix;
  the total-sequences count is now extracted with base R regular
  expressions, consistent with the rest of the package.
- `.onAttach()` no longer prints a hardcoded, stale sequence count when
  [`OEIS_total_sequences()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_total_sequences.md)
  fails.
- Updated `README.md`: fixed Quick Start examples that referenced
  functions that don’t exist (`OEIS_plot()`, `OEIS_name()`), removed an
  unsubstantiated Shiny app link, and pointed the Contributing section
  at the new `CONTRIBUTING.md`.
- Added `CONTRIBUTING.md` with development setup, test, and pull request
  guidelines.
- Test files that talk to the live OEIS site now call
  `skip_if_oeis_unreachable()` first, so a CI runner that can’t reach
  `oeis.org` (rate limiting, a transient block, no network) shows up as
  SKIP rather than failing the whole suite.
- GitHub Actions traffic is currently getting a `403 Forbidden` from
  `oeis.org` (Cloudflare), which was crashing `R CMD check` outright
  during `checking examples` (an `@examples` failure there aborts the
  whole check, unlike a test failure). Every `@examples` block that hits
  the network is now wrapped in `\dontrun{}`, and the vignette probes
  `oeis.org` once up front and skips evaluating its (also live) code
  chunks if it’s unreachable, instead of failing the build.
- Fixed `OEIS_comments.OEIS_sequence()`, which returned `x$example`
  instead of `x$comments` (copy-paste bug).
- Added `inst/CITATION` so `citation("OEIS.R")` works, a root-level
  `CITATION.cff` so GitHub’s “Cite this repository” button works, and a
  Citation section to `README.md`.
- Added a pkgdown site (`_pkgdown.yml`,
  `.github/workflows/pkgdown.yml`), deployed to GitHub Pages from the
  `gh-pages` branch. Added `URL:` and `BugReports:` to `DESCRIPTION`,
  removed the meaningless `Config/Needs/website: oeis.org` line (that
  field lists R package names, not URLs), and fixed two pkgdown
  accessibility warnings in `README.md` (a relative image path pkgdown
  couldn’t resolve, and missing alt text on the sticker image).
- Fixed the mechanical `lintr` findings across the package (long lines,
  inconsistent indentation, missing spaces around operators/braces, dead
  code, an unwrapped multi-line anonymous function, a stray unused
  `. <- NULL`). Added `.lintr` documenting two *intentional* style
  choices that default `lintr` flags but that this package deliberately
  keeps: `OEIS_*`-style exported names (renaming would be a breaking API
  change) and consistent use of the `magrittr` `%>%` pipe throughout
  (rather than mixing in the base `|>` pipe).
- Added `tests/testthat/test_offline_accessors.R`, covering the
  `OEIS_*.OEIS_sequence` accessor methods,
  [`OEIS_bibtex()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_bibtex.md),
  [`OEIS_ggplot()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_ggplot.md),
  [`plot.OEIS_sequence()`](https://enriqueph.github.io/OEIS.R/reference/plot.OEIS_sequence.md),
  `OEIS_ID.OEIS_bfile()`,
  [`OEIS_bfile_url()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_bfile_url.md),
  [`author_list()`](https://enriqueph.github.io/OEIS.R/reference/author_list.md),
  and
  [`char0toNULL()`](https://enriqueph.github.io/OEIS.R/reference/char0toNULL.md)
  against a hand-built fake `OEIS_sequence` object. Unlike the rest of
  the suite, these tests need no network access at all, so they keep
  running (and keep contributing to coverage) even while `oeis.org` is
  blocking CI traffic — this is what caught the
  [`OEIS_comments()`](https://enriqueph.github.io/OEIS.R/reference/OEIS_comments.md)
  bug above.

## OEIS.R 0.1.0.1

- Added a `NEWS.md` file to track changes to the package.
- Improved documentation
- Fixes to `OEIS_links`, `OEIS_mathematica`
