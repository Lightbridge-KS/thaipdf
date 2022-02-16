

# Test: use_thai_preamble() -----------------------------------------------


test_that("use_thai_preamble() works", {

  # create file
  path <- suppressMessages(use_thai_preamble())
  # Check exist & path
  expect_true(fs::file_exists("thai-preamble.tex"))
  expect_type(path, "character")
  # clean up
  fs::file_delete("thai-preamble.tex")

})

