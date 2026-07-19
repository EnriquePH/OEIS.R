# OEIS.R 0.2.0

OEIS redesigned its sequence pages (the old `<tt>`/table-based HTML layout was
replaced with `div.section`/`div.sectname`/`div.sectbody`/`div.sectline`
markup), which broke every function that scraped the full sequence page.
This release re-targets all of that scraping at the new page structure and
fixes a couple of latent parsing bugs found along the way.

* Fixed `OEIS_df()` (and everything built on it: `OEIS_status()`,
  `OEIS_crossrefs()`, `OEIS_cf()`, `OEIS_seqs_in_context()`,
  `OEIS_seqs_adjacent()`, and the `OEIS_xml` methods of `OEIS_comments()`,
  `OEIS_links()`, `OEIS_example()`, `OEIS_formula()`, `OEIS_mathematica()`,
  `OEIS_extensions()`, `OEIS_author()`, `OEIS_date()`) to use OEIS's current
  page markup. This was the root cause of `OEIS_sequence()` failing outright.
* Fixed `OEIS_description.OEIS_xml()`, `OEIS_formerly.OEIS_xml()`,
  `OEIS_terms.OEIS_xml()`, `OEIS_offset.OEIS_xml()`, and
  `OEIS_keywords.OEIS_xml()`, which relied on `<tt>` elements that no longer
  exist on the page.
* Fixed a bug in `OEIS_formerly()` that returned the sequence's revision
  number and last-modified timestamp (e.g. `"#400"`, `"Jun"`, `"2026"`)
  alongside, or instead of, the actual M-/N-number.
* Fixed `OEIS_total_sequences()`, which no longer matched OEIS's front page
  markup; it now reads the total from `div.dbinfo` and returns
  `NA_integer_` (instead of a silently stale hardcoded count) when the page
  can't be parsed.
* Removed the `stringr` dependency introduced in a work-in-progress fix;
  the total-sequences count is now extracted with base R regular
  expressions, consistent with the rest of the package.
* `.onAttach()` no longer prints a hardcoded, stale sequence count when
  `OEIS_total_sequences()` fails.
* Updated `README.md`: fixed Quick Start examples that referenced
  functions that don't exist (`OEIS_plot()`, `OEIS_name()`), removed an
  unsubstantiated Shiny app link, and pointed the Contributing section at
  the new `CONTRIBUTING.md`.
* Added `CONTRIBUTING.md` with development setup, test, and pull request
  guidelines.

# OEIS.R 0.1.0.1

* Added a `NEWS.md` file to track changes to the package.
* Improved documentation 
* Fixes to `OEIS_links`, `OEIS_mathematica`
