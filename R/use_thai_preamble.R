

#' Create a \LaTeX Preamble for Thai Language in R Markdown
#'
#' This function creates \LaTeX preamble which is needed to render Thai language in R Markdown to a PDF document.
#'
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
#' @param name (Character) Thai \LaTeX preamble file name or path of file to create, relative to root of active project. Defaults is `thai-preamble.tex`
#' @param thai_font (Character) Name of the Thai font to use, i.e., "TH Sarabun New" (default), "Laksaman".
#' @param ignore (Logical) Should the newly created file be added to .Rbuildignore?
#' @param open (Logical) Open the newly created file for editing? Happens in RStudio, if applicable, or via `utils::file.edit()` otherwise.
#' @param overwrite (Logical) If file already exist, do you want to overwrite?
#'
#' @return (Invisible) A logical vector indicating if \LaTeX preamble file was modified.
#' @export
#'
#' @examples
use_thai_preamble <- function(name = "thai-preamble.tex",
                              thai_font = "TH Sarabun New",
                              ignore = FALSE,
                              open = FALSE,
                              overwrite = FALSE
) {
  ### Build path
  name <- fs::path(fs::path_ext_remove(name), ext = "tex")
  ### If file already exist, not overwrite unless instructed to do so.
  is_file_exist <- fs::file_exists(name)
  if(is_file_exist && !overwrite){
    cli::cli_alert_danger("file {usethis::ui_value(name)} already exist, to overwrite set {.code overwrite = TRUE}")
    return(invisible(FALSE))
  }

  # Main Engine: Copy template & set thai font
  thai_font_wrapped <- paste0("{", thai_font,"}")
  is_new <- usethis::use_template(
    "thai-preamble.tex",
    save_as = name,
    data = list(thai_font = thai_font_wrapped),
    ignore = ignore,
    open = open,
    package = "thaipdf"
  )

  ### File Not change
  if(!is_new){
    usethis::ui_done("Checking {usethis::ui_value(name)}")
  }
  ### Set font Information
  usethis::ui_line("  - Thai font was set to {usethis::ui_value(thai_font)} in the preamble.")

  ### If files is newly created, Inform what TODO about YAML.
  if(is_new && !is_file_exist){
    ui_inform_yaml(name)
  }
  ## Return whether file is modified
  invisible(is_new)
}


# Inform YAML -------------------------------------------------------------



#' Print what TODO about R Markdown YAML to the R console
#'
#' @param in_header Text to `in_header` fields of YAML
#'
#' @return A character
ui_inform_yaml <- function(in_header = "path-to-preamble.tex") {

  par_end <- function(){ cli::cli_par(); cli::cli_end() }

  cli::cli_h1("TODO")

  cli::cli_text("For YAML header of R Markdown in {.code pdf_document:} or {.code bookdown::pdf_document2:}")
  cli::cli_li("Set {.code latex_engine} to {.code xelatex}")
  cli::cli_li("Set to include the path to LaTeX preamble")

  par_end()

  cli::cli_rule(left = "Like This")

  usethis::ui_code_block("
    latex_engine: xelatex
      includes:
        in_header: {in_header}
", copy = F)

  cli::cli_rule()

  par_end()

  cli::cli_li("Add LaTeX macro {.code \\sloppy} to the beginning of the body of R Markdown (just after YAML header).")

  par_end()

  cli::cli_text("{.strong For more details see}")
  cli::cli_li("How to include preamble in R Markdown {.url https://bookdown.org/yihui/rmarkdown-cookbook/latex-preamble.html}")
  cli::cli_li("LaTeX setting in Thai {.url http://pioneer.netserv.chula.ac.th/~wdittaya/LaTeX/LaTeXThai.pdf}")

}
