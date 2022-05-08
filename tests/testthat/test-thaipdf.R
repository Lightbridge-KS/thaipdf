

#' Render Thaipdf Document to a File
#'
#' @param out_pdf name of the output PDF file
#' @param out_tex name of the output TeX file
#' @param out_dir name of the output dir
#'
#' @return path of `out_tex`
render_thaipdf_template <- function(out_pdf = "testing.pdf",
                                    out_tex = "testing.tex",
                                    out_dir = tempdir() # tempdir() or "tests/test-local"
) {

  # Path to "Thai PDF R Markdown" Template
  path_thaipdf_temp1 <-
    fs::path_package("thaipdf", "rmarkdown", "templates",
                     "thai-pdf-rmd",
                     "skeleton", "skeleton.Rmd")

  path_pdf <- rmarkdown::render(path_thaipdf_temp1,
                                output_format = thaipdf::thaipdf_document(keep_tex = TRUE),
                                output_file = out_pdf,
                                output_dir =  out_dir)

  fs::path(out_dir, out_tex)
}


# Test Render PDF ---------------------------------------------------------


test_that("thaipdf_document() expect_snapshot_file", {

  skip_on_ci()
  skip_on_cran()
  # Test Render file To PDF
  path_tex <- render_thaipdf_template()
  expect_snapshot_file(path_tex)

})


# Test: Thai PDF ----------------------------------------------------------


test_that("thaipdf_document() return `rmarkdown_output_format`",{

  expect_s3_class(thaipdf::thaipdf_document(), "rmarkdown_output_format")

})


# Test: Thai Book ----------------------------------------------------------


test_that("thaipdf_book() return `rmarkdown_output_format`",{

  expect_s3_class(thaipdf::thaipdf_book(), "rmarkdown_output_format")

})
