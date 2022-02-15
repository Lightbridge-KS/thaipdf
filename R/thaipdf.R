
# Wrap R Markdown ---------------------------------------------------------



#' Convert to a PDF/LaTeX document with Thai Language Compatibility
#'
#' @description **Thai language** supported conversion of R Markdown to a PDF or LaTeX document.
#' It is a wrapper around [`rmarkdown::pdf_document()`](https://pkgs.rstudio.com/rmarkdown/reference/pdf_document.html).
#'
#' @details To achieve Thai language compatibility for \LaTeX,
#' This function injects preamble fragment of Thai \LaTeX typesetting into the preamble of output \LaTeX via [`includes`](https://pkgs.rstudio.com/rmarkdown/reference/includes.html) argument,
#' and set `latex_engine` to "xelatex".
#'
#'
#' @param ... Arguments passed to [`pdf_document()`](https://pkgs.rstudio.com/rmarkdown/reference/pdf_document.html). You may supply any arguments of [`pdf_document()`] except
#' for `includes` and `latex_engine`.
#'
#'
#' @return R Markdown output format passing to [`rmarkdown::render()`]
#' @export
#'
#' @seealso
#' How to use [`rmarkdown::pdf_document`], please see [official documentation](https://bookdown.org/yihui/rmarkdown/pdf-document.html#other-features).
#'
#' @examples
#' if(FALSE){
#'  library(rmarkdown)
#'
#'  # Simple Conversion
#'  render("input.Rmd", output_format = thaipdf::thaipdf_document())
#'
#'  # Render with Table of Contents and set font size to 10pt
#'  render("alone/alone.Rmd",
#'         output_format = thaipdf::thaipdf_document(
#'           toc = TRUE,
#'           pandoc_args = pandoc_metadata_arg("fontsize", "10pt")
#'         ))
#' }
thaipdf_document <- function(...) {
  rmarkdown::pdf_document(
    latex_engine = "xelatex",
    includes = rmarkdown::includes(
      in_header = thai_preamble(),
      before_body = before_body()
    ),
    ...
  )
}


# Wrap Bookdown -----------------------------------------------------------



#' Convert R Markdown to a PDF book with Thai Language Compatibility
#'
#' @description **Thai language** supported conversion of R Markdown to a PDF after resolving the special tokens of **bookdown** (e.g., the tokens for references and labels) to native LaTeX commands.
#' It is a wrapper around [`bookdown::pdf_book()`](https://pkgs.rstudio.com/bookdown/reference/pdf_book.html) with argument `base_format` set to [thaipdf_document()].
#'
#' @param ... Arguments passed to [`pdf_book()`](https://pkgs.rstudio.com/bookdown/reference/pdf_book.html). You may supply any arguments of `pdf_book()` except
#' for `includes` and `latex_engine`.
#'
#' @seealso
#' How to use [`bookdown::pdf_book()`], please see [official documentation](https://bookdown.org/yihui/bookdown/latexpdf.html)
#'
#' @export
#'
thaipdf_book <- function(...) {

  # Check bookdown
  if (!requireNamespace("bookdown")) {
    cli::cli_alert_warning("This function require package {.pkg bookdown} installed.")
    cli::cli_li("To install run {.code install.packages('bookdown')}")
  }

  bookdown::pdf_book(
    base_format = thaipdf::thaipdf_document,
    ...
  )
}
