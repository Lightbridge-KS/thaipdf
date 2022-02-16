

# Config: Set -------------------------------------------------------------

test_that("thaipdf_config_set() works", {

  new_font <- "Sarabun"
  new_config_ls <- thaipdf_config_set(thai_font = new_font)

  expect_equal(new_config_ls[["thai_font"]], new_font)

  default_config_ls <- thaipdf_config_set()

  expect_equal(default_config_ls[["thai_font"]], "TH Sarabun New")

})

# Config: Get -------------------------------------------------------------

test_that("thaipdf_config_get() works",{
  config_ls <- thaipdf_config_get()
  # return list
  expect_type(config_ls, "list")
  # with class
  expect_s3_class(config_ls, "thaipdf_config")
})




# Config: validate --------------------------------------------------------

test_that("thaipdf_config_validate() works", {

  expect_error(thaipdf_config_validate(thai_font = 1))
  expect_error(thaipdf_config_validate(thai_font = c("")))
  expect_error(thaipdf_config_validate(thai_font = c("a", "b")))

})
