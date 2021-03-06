% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/thaipdf.R
\name{thaipdf_book}
\alias{thaipdf_book}
\title{Convert R Markdown to a PDF book with Thai Language Compatibility}
\usage{
thaipdf_book(...)
}
\arguments{
\item{...}{Arguments to pass to \href{https://pkgs.rstudio.com/bookdown/reference/pdf_book.html}{\code{bookdown::pdf_book()}}, and then to \code{\link[=thaipdf_document]{thaipdf_document()}}. You may supply argument \code{thai_font} and \code{line_spacing} in here.}
}
\value{
An S3 object of class "rmarkdown_output_format" to pass to \code{\link[rmarkdown:render]{rmarkdown::render()}}
}
\description{
\strong{Thai language} supported conversion of R Markdown to a PDF after resolving the special tokens of \strong{bookdown} (e.g., the tokens for references and labels) to native LaTeX commands.
It is a wrapper around \href{https://pkgs.rstudio.com/bookdown/reference/pdf_book.html}{\code{bookdown::pdf_book()}} with argument \code{base_format} set to \code{\link[=thaipdf_document]{thaipdf_document()}}.
}
\examples{
\dontrun{
 library(rmarkdown)

 # Simple Conversion
 render("input.Rmd", output_format = thaipdf::thaipdf_book())

 # Render with Thai font "Laksaman" and font size 10pt
 render("input.Rmd",
        output_format = thaipdf::thaipdf_book(
          thai_font = "Laksaman", # you must have this font in your system
          pandoc_args = pandoc_metadata_arg("fontsize", "10pt")
        ))
}
}
\seealso{
\itemize{
\item How to use \code{\link[bookdown:pdf_book]{bookdown::pdf_book()}}, please see \href{https://bookdown.org/yihui/bookdown/latexpdf.html}{official documentation}
\item How to use \code{\link[=thaipdf_document]{thaipdf_document()}}.
}
}
