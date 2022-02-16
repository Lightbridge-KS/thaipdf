
# Fun: path() -------------------------------------------------------------


test_that("path() is working",{
  path <- thaipdf_paths()
  expect_type(path, "list")
})


test_that("thai_preamble() is working", {
  path_pre <- thai_preamble()
  expect_type(path_pre, "character")
})


test_that("before_body() is working", {
  path_bb <- before_body()
  expect_type(path_bb, "character")
})
