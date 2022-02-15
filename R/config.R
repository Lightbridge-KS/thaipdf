

#' Set or Get Global thaipdf Configuration
#'
#' @description
#' Set and Get global configuration for `{thaipdf}` package. This setting will be applied to
#' all templates from this package.
#'
#' *  [thaipdf_config_set()] for setting `thaipdf` global configuration
#' *  [thaipdf_config_get()] for viewing `thaipdf` global configuration
#'
#' @details
#' For example, If you want use Thai font as "Laksaman" for all
#' of your project, set `thai_font = "Laksaman"`.
#' Then, future templates created by this package will have "Laksaman" as main font.
#'
#'
#'
#' @param thai_font (Character) Global Thai font to set for this package, must be a valid font in your machine.
#'
#' @return Display message to R console and return list of configurations (invisibly)
#' @export
#'
#' @examples
#' if(FALSE){
#' # Set Global Thai font
#' thaipdf_config_set(thai_font = "Laksaman")
#' # View Settings
#' thaipdf_config_get()
#' }
thaipdf_config_set <- function(thai_font = "TH Sarabun New"){

  # Validate Metadata
  thaipdf_config_validate(thai_font = thai_font)
  # Metadata: Named List as Pandoc Var
  metadata <- list(thai_font = thai_font)

  # All relevant file paths in PKG
  paths <- thaipdf_paths()
  ## Template Path
  paths_temp <- paths[["path_temp"]]

  ## Output Paths (UPDATE HERE)
  paths_out <- list(
    paths[["path_pre_global"]],
    paths[["path_pre_proj"]]
  )

  # Write config.yml
  yaml::write_yaml(metadata, file = paths[["path_config"]])

  # Render to all output: thai-preamble.tex
  for (i in seq_along(paths_out)) {
    rmarkdown::pandoc_template(
      metadata = metadata,
      template = paths[["path_temp"]],
      output = paths_out[[i]]
    )
  }
  # Display Message
  cli::cli_alert_success("Setting thaipdf global configuration")
  thaipdf_config_get()

}


# Get Config --------------------------------------------------------------



#' @export
#' @rdname thaipdf_config_set
thaipdf_config_get <- function(){

  path_config <- fs::path_package("thaipdf", "templates", "config.yml")
  ## Read YAML
  config_ls <- suppressWarnings(yaml::read_yaml(file = path_config))
  ## Add class "thaipdf_config
  new_thaipdf_config(config_ls)

}


# Validate Config ---------------------------------------------------------



#' Validate thaipdf_config Input
#'
#' @param thai_font
#'
#' @return display error if invalid
#' @noRd
thaipdf_config_validate <- function(thai_font = "TH Sarabun New"){

  is_valid <- all(is.character(thai_font), length(thai_font) == 1, (thai_font != ""))
  if(!is_valid) stop("`thai_font` is invalid. You must provide only 1 valid Thai font name.", call. = FALSE)

}

# Print Method for `thaipdf_config` -----------------------------------------


#' @export
print.thaipdf_config <- function(x, ...){

  th_font <- x[["thai_font"]]
  cli::cli_h2("thaipdf Global Setting")
  cli::cli_li("Thai font setting is {.val {th_font}}")
  invisible(x)

}
