## R CMD check results

`rhub::check_for_cran()` was used to perform checking.

There were no ERRORs or WARNINGs.

There were 2 NOTEs:

-   1st Note: This is a new submission.

-   2nd Note (in Windows): Found the following files/directories: 'lastMiKTeXException'

```{=html}
<!-- -->
```
    checking for detritus in the temp directory ... NOTE Found the following files/directories: 'lastMiKTeXException'

The 2nd note was appears in this platform

-   Windows Server 2022, R-devel, 64 bit

but **not** in these platforms

-   Ubuntu Linux 20.04.1 LTS, R-release, GCC

-   Fedora Linux, R-devel, clang, gfortran

-   My computer which is "macOS 12.2.1 (21D62)"

For the 2nd note in Windows, I've checked the artifact in `Rdlatex.log` and found that the problem might occurs when converting Rd to PDF which involves MiKTeX.

However, using win-builder from `devtools::check_win_devel()` did not produce the 2nd note.
