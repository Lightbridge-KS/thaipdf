

#' Create a \LaTeX Preamble for Thai Language in R Markdown
#'
#' @description
#' This function creates \LaTeX preamble file needed to render Thai language in R Markdown to a PDF document.
#'
#' @details
#' Here is the steps:
#'
#' 1. Call `use_thai_preamble()`. You can set other file name by `name` argument and Thai font to use by `thai_font` argument.
#'
#' 2. Follow the instructions printed to R console.
#'
#'     *   File `thai-preamble.tex` should be created in the current working directory (by default).
#'     *  (If not already) Create R Markdown file with `pdf_document:` or `bookdown::pdf_document2` format.
#'     *  Modify YAML header  in `pdf_document:` or `bookdown::pdf_document2` option. Set `latex_engine` to `xelatex` and set to include path to the \LaTeX preamble file.
#'     *  Add \LaTeX macro `\sloppy` to the beginning of the body of R Markdown (just after YAML header).
#'
#' 3. Write some Thai language in R Markdown then knit to PDF. It's DONE!
#'
#'
#'
#' @param name (Character) Thai \LaTeX preamble file name or path of file to create, relative to current working directory. Defaults is `thai-preamble.tex`
#' @param thai_font (Character) Name of the Thai font to use, i.e., "TH Sarabun New" (default), "Laksaman".
#' @param line_spacing (Numeric) Spacing between each line. Line spacing 1.5 is recommended for Thai language (default).
#' @param open (Logical) Open the newly created file for editing? Using default editor of `.tex` to open.
#' @param overwrite (Logical) If file already exist, do you want to overwrite?
#'
#' @return (Invisible) A path to \LaTeX preamble being created.
#' @export
#'
#' @examples
#' if (FALSE) {
#'  # Running this will write `thai-preamble.tex` to your working directory
#'  use_thai_preamble()
#'  # Write `thai-preamble.tex` under preTeX/ directory
#'  use_thai_preamble(name = "preTeX/thai-preamble.tex")
#'  # Specify Thai font to use
#'  use_thai_preamble(thai_font = "Laksaman")
#' }
use_thai_preamble <- function(name = "thai-preamble.tex",
                              thai_font = "TH Sarabun New",
                              line_spacing = 1.5,
                              open = FALSE,
                              overwrite = FALSE
){

  ### Build path
  name_clean <- fs::path(fs::path_ext_remove(name), ext = "tex")
  out_path <- fs::path_wd(name_clean)
  out_name <- fs::path_file(out_path)
  ### If file already exist, not overwrite unless instructed to do so.
  is_file_exist <- fs::file_exists(out_path)
  if (is_file_exist && !overwrite) {
    cli::cli_alert_danger("file {.val {out_path}} already exist, to overwrite set {.code overwrite = TRUE}")
    return(invisible(NA_character_))
  }

  # Validate Metadata
  thaipdf_config_validate(thai_font = thai_font, line_spacing = line_spacing)
  # Metadata: Named List as Pandoc Var
  metadata <- list(thai_font = thai_font, line_spacing = line_spacing)

  # All relevant file paths in PKG
  paths <- thaipdf_paths()
  ## Template Path
  paths_temp <- paths[["path_temp"]]

  # Main Engine:
  ## Render to Output at Specified Location
  write_path <- rmarkdown::pandoc_template(
    metadata = metadata,
    template = paths[["path_temp"]],
    output = out_path
  )
  # Info to Console
  cli::cli_alert_success("Writing {.val {out_name}} at {.file {write_path}}")
  cli::cli_alert_success("Thai font was set to {.val {thai_font}} in the preamble.")
  cli::cli_alert_success("Line spacing was set to {.val {line_spacing}} in the preamble.")

  # Inform what TODO
  ui_inform_yaml(name_clean)

  if (open) {
    fs::file_show(write_path)
  }
  # Return Path of Output file
  invisible(write_path)

}


# Inform YAML -------------------------------------------------------------



#' Print what TODO about R Markdown YAML to the R console
#'
#' @param in_header Text to `in_header` fields of YAML
#'
#' @return A character
#' @noRd
ui_inform_yaml <- function(in_header = "path-to-preamble.tex") {

  par_end <- function(){ cli::cli_par(); cli::cli_end() }

  cli::cli_h1("TODO")

  cli::cli_text("For YAML header of R Markdown in {.code pdf_document:} or {.code bookdown::pdf_document2:}")
  cli::cli_li("Set {.code latex_engine} to {.code xelatex}")
  cli::cli_li("Set to include the path to LaTeX preamble")

  par_end()

  cli::cli_rule(left = "Like This")

  message("    latex_engine: xelatex
    includes:
      in_header: ", in_header)
  message("\n")

  cli::cli_rule()

  par_end()

  cli::cli_li("Add LaTeX macro {.code \\sloppy} to the beginning of the body of R Markdown (just after YAML header).")

  par_end()

  cli::cli_text("{.strong For more details see}")
  cli::cli_li("How to include preamble in R Markdown {.url https://bookdown.org/yihui/rmarkdown-cookbook/latex-preamble.html}")
  cli::cli_li("LaTeX setting in Thai {.url http://pioneer.netserv.chula.ac.th/~wdittaya/LaTeX/LaTeXThai.pdf}")

}



