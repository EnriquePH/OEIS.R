# These tests talk to the live oeis.org, not fixtures. CI runners are
# occasionally rate-limited or transiently blocked by OEIS's Cloudflare
# front end, which surfaces as a connection error unrelated to any code
# change. Guard every network-dependent test file with
# skip_if_oeis_unreachable() so that failure shows up as SKIP, not FAIL.

oeis_reachable <- function(timeout = 5) {
  old_timeout <- getOption("timeout")
  on.exit(options(timeout = old_timeout), add = TRUE)
  options(timeout = timeout)
  isTRUE(tryCatch({
    con <- url(OEIS_web_url(), open = "rb")
    close(con)
    TRUE
  }, error = function(e) FALSE, warning = function(w) FALSE))
}

skip_if_oeis_unreachable <- function() {
  testthat::skip_if_not(
    oeis_reachable(),
    "oeis.org is not reachable from this test environment"
  )
}
