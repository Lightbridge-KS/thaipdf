


#' New thaipdf_config object
#'
#' @param x a list
#'
#' @return a thaipdf_config object
#' @noRd
new_thaipdf_config <- function(x = list()){
  # Validate
  stopifnot(is.list(x))
  # Add Class
  class(x) <- c("thaipdf_config", class(x))
  x
}


#' thaipdf_config class check
#'
#' @param x object to test class
#'
#' @return Logical
#' @noRd
is_thaipdf_config <- function(x){

  inherits(x, "thaipdf_config")

}
