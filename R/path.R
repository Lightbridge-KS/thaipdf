


# Construct Path ----------------------------------------------------------


#' Construct Path to files in thatpdf package
#'
#' @param th_pre preamble filename
#'
#' @return a list of paths
#' @noRd
thaipdf_paths <- function(th_pre = "thai-preamble.tex") {

  ## Template file name
  temp_filename <- paste0("template-", th_pre)

  # Input Path
  ## Template path
  path_temp <- fs::path_package("thaipdf", "templates", temp_filename)
  ## config.yml path
  path_config <- fs::path_package("thaipdf", "templates", "config.yml")

  # Output Path
  ## Global Preamble at PreTeX/
  path_pre_global <- fs::path_package("thaipdf", "preTeX", th_pre)
  ## Global PreTeX/before_body.tex for \sloppy macro
  path_before_body <- fs::path_package("thaipdf", "preTeX", "before_body.tex")
  ## At rmarkdown/
  ### Thai PDF with Preamble (for Project)
  path_pre_proj <- fs::path_package("thaipdf", "rmarkdown", "templates",
                                    "thai-pdf-rmd-w-pre",
                                    "skeleton", "preTeX", th_pre)


  list(
    path_temp = path_temp,
    path_config = path_config,
    path_pre_global = path_pre_global,
    path_before_body = path_before_body,
    path_pre_proj = path_pre_proj
  )
}


# Path to Global Preamble -------------------------------------------------


#' Path to Global Thai Preamble
#'
#' Give path to global Thai preamble from `{thaipdf}` package.
#' Intended to be used in the `in_header` argument of [`rmarkdown::includes()`](https://pkgs.rstudio.com/rmarkdown/reference/includes.html)
#' of [`rmarkdown::pdf_document()`](https://pkgs.rstudio.com/rmarkdown/reference/pdf_document.html) or [`bookdown::pdf_document2()`](https://pkgs.rstudio.com/bookdown/reference/html_document2.html)
#' @return A path to global Thai preamble.
#'
#' @examples
#' if(FALSE){
#' library(rmarkdown)
#' pdf_document(includes = includes(before_body = thaipdf::thai_preamble()))
#' }
#' @noRd
thai_preamble <- function(){
  thaipdf_paths()[["path_pre_global"]]
}


# Path to before body -----------------------------------------------------



#' Path to Global before body
#'
#' @noRd
before_body <- function(){
  thaipdf_paths()[["path_before_body"]]
}

