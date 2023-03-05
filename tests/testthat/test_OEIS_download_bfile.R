# OEIS_download_bfile.R

id <- "A102030"
destpath <- "."

download_delete <- function(ID, destpath){
  code <- OEIS_download_bfile(ID,
                              destpath,
                              quiet = TRUE)
  if(code==0){
    file.remove(paste0(destpath, "/", OEIS_bfile_url(ID)))
  }
  code
}

test_that("OEIS_download_bfile works", {
  testthat::expect_equal(download_delete(id, destpath), 0)
})
