

# Config: Set -------------------------------------------------------------

test_that("thaipdf_config_set() works", {

  # Set New
  new_font <- "Sarabun"
  line_spacing <- 2

  new_config_ls <- thaipdf_config_set(thai_font = new_font, line_spacing = line_spacing)

  expect_equal(new_config_ls[["thai_font"]], new_font) # Check font
  expect_equal(new_config_ls[["line_spacing"]], line_spacing) # Check Spacing

  # Reset
  default_config_ls <- thaipdf_config_set()

  expect_equal(default_config_ls[["thai_font"]], "TH Sarabun New")
  expect_equal(default_config_ls[["line_spacing"]], 1.5)

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

  # Thai font
  expect_error(thaipdf_config_validate(thai_font = 1))
  expect_error(thaipdf_config_validate(thai_font = c("")))
  expect_error(thaipdf_config_validate(thai_font = c("a", "b")))

  expect_error(thaipdf_config_validate(line_spacing = "a"))
  expect_error(thaipdf_config_validate(line_spacing = 1:2))

})
