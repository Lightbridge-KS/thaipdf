## Resubmission

This is a re-submission. In this version I have:

-   Added \value to .Rd file of `thaipdf_book.Rd` with an explanation of the returned object (object type and class), and the use case of that object.

-   Removed `if(FALSE)` from all examples.

-   Wrapped examples of `thaipdf_book.Rd` and `thaipdf_document.Rd` in `\dontrun{}`. The reasons are the followings: 

    -   A specific Thai font is required to be installed in the system to be able to render example to a PDF.
    -   It takes a long time to run in each render (about 4.9 - 5.3 sec).
    -   I also checked the source code of the main function that this package depends on `rmarkdown::pdf_document()` which use `\dontrun{}` in their example as well.
  

## R CMD check results

`rhub::check_for_cran()` was used to perform checking.

There were no ERRORs or WARNINGs.

There were 2 NOTEs:

-   1st Note: This is a new submission.

-   2nd Note (in Windows): Found the following files/directories: 'lastMiKTeXException'

```
checking for detritus in the temp directory ... NOTE Found the following files/directories: 'lastMiKTeXException'
```

The 2nd note was appears in this platform

-   Windows Server 2022, R-devel, 64 bit

but **not** in these platforms

-   Ubuntu Linux 20.04.1 LTS, R-release, GCC

-   Fedora Linux, R-devel, clang, gfortran

-   My computer which is "macOS 12.2.1 (21D62)"

For the 2nd note in Windows, I've checked the artifact in `Rdlatex.log` and found that the problem might occurs when converting Rd to PDF which involves MiKTeX.

However, using win-builder from `devtools::check_win_devel()` did not produce the 2nd note.
