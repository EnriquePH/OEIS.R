# Contributing to OEIS.R

Thanks for considering a contribution! **OEIS.R** is a small R package,
and contributions of any size — bug reports, documentation fixes, new
accessor functions, or bigger changes — are welcome.

## Before you start

Please open an issue first for anything beyond a small fix (typos,
obvious bugs), so we can agree on the approach before you invest time in
it.

## A note on how this package works

`OEIS.R` gets its data by talking to <https://oeis.org/> directly: the
`fmt=text` search endpoint for most sequence fields, and the sequence’s
HTML page for a few fields that aren’t in the text export
(cross-reference context, adjacent sequences). There are no fixtures or
mocks — the test suite runs against the live site.

This has one important consequence: **OEIS occasionally changes its page
markup or text format, and when it does, this package can silently or
loudly break** even though no line of R code changed. If you’re fixing a
bug, it’s worth checking with `curl` or
[`xml2::read_html()`](http://xml2.r-lib.org/reference/read_xml.md) what
the current live page/response actually looks like rather than assuming
the existing parsing logic is still correct — a past example (fixed in
v0.2.0) was a full CSS/HTML redesign of the sequence page that broke
every function scraping it.

## Development setup

``` r

# install.packages("devtools")
devtools::install_deps(dependencies = TRUE)
```

Key dependencies you’ll want available: `roxygen2` (documentation),
`testthat` (tests), and `devtools`.

## Making changes

1.  **Fork and branch** from `master`.

2.  **Write/update code** in `R/`. Each exported function generally
    follows the same S3 dispatch pattern used throughout the package: a
    generic plus methods for `character`, `OEIS_ID`, `OEIS_internal`,
    `OEIS_xml`, and `OEIS_sequence` inputs (see
    e.g. `R/OEIS_description.R` for a compact example). New functions
    should follow this convention unless there’s a good reason not to.

3.  **Document with roxygen2** — do not hand-edit files in `man/` or
    `NAMESPACE`; they’re generated. After changing roxygen comments,
    run:

    ``` r

    devtools::document()
    ```

4.  **Add or update tests** in `tests/testthat/`. Since tests hit the
    live OEIS site, prefer sequence IDs that are unlikely to change
    (old, well-established sequences) and keep the network calls
    minimal.

5.  **Run the test suite**:

    ``` r

    devtools::test()
    ```

6.  **Run a full check** before opening a PR:

    ``` r

    devtools::check()
    ```

## Style

- Follow the existing style in the file you’re editing rather than
  introducing a new one. Notably, this codebase consistently uses the
  `magrittr` `%>%` pipe rather than the base R `|>` pipe — stick with
  `%>%` in package code.
- Keep roxygen documentation (`@param`, `@return`, `@examples`,
  `@seealso`) up to date with any signature or behavior changes.
- Prefer small, focused pull requests over large ones that mix unrelated
  changes.

## Submitting a pull request

- Describe what changed and why, and reference any related issue.
- Make sure `devtools::test()` and `devtools::check()` pass locally.
- Update `NEWS.md` with a short bullet describing the change.

## Reporting bugs

Please include: the OEIS sequence `ID` you used (if applicable), the
code you ran, the actual output/error, and what you expected instead. If
you suspect OEIS changed something server-side, a link to the relevant
page or a snippet of the raw response is very helpful.

## License

By contributing, you agree that your contributions will be licensed
under the same [MIT License](https://enriqueph.github.io/OEIS.R/LICENSE)
that covers the rest of the project.
