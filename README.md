
<!-- README.md is generated from README.Rmd. Please edit that file -->

# thaipdf

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/Lightbridge-KS/thaipdf/workflows/R-CMD-check/badge.svg)](https://github.com/Lightbridge-KS/thaipdf/actions)
[![codecov](https://codecov.io/gh/Lightbridge-KS/thaipdf/branch/main/graph/badge.svg?token=QPhwQZt2vf)](https://codecov.io/gh/Lightbridge-KS/thaipdf)

<!-- badges: end -->

> R package :package: ช่วยสร้าง PDF document จาก R Markdown ที่ใช้
> **ภาษาไทย :thailand:**

| 1                                                   | 2                                                   |
|:----------------------------------------------------|:----------------------------------------------------|
| ![Thai book example 1](man/figures/book-th-ex1.png) | ![Thai book example 2](man/figures/book-th-ex2.png) |

# Goal

จุดมุ่งหมายของ R package นี้ เพื่อให้สามารถ**สร้าง PDF เป็นภาษาไทย
:thailand: จาก R Markdown ได้โดยง่าย** จาก **R Markdown template** และ
**LaTeX preamble** ที่มีการตั้งค่าสำหรับภาษาไทยมาให้

# Install

**Install thaipdf:** ติดตั้ง development version ของ thaipdf จาก
[GitHub](https://github.com/Lightbridge-KS/thaipdf) ด้วย:

``` r
# install.packages("remotes")
remotes::install_github("Lightbridge-KS/thaipdf")
```

**Install XeLaTeX และ LaTeX package** ที่จำเป็นสำหรับการใช้ภาษาไทย
อาจทำได้อย่างง่ายโดยใช้ [{tinytex}](https://yihui.org/tinytex/) R
package:

``` r
install.packages("tinytex")

# For using R Markdown
tinytex::install_tinytex() 

# Install LaTeX PKG required by `thaipdf`
tinytex::tlmgr_install(c(
  "fontspec", "ucharclasses", "setspace", "polyglossia"
))
```

**Check font:** ตรวจสอบว่าในเครื่องมีฟอนท์ [TH Sarabun
New](https://www.f0nt.com/release/th-sarabun-new/)
ถ้าไม่มีให้ติดตั้งด้วย (เนื่องจาก thaipdf ใช้ font นี้เป็นตัวหลัก)

# Usage

วิธีใช้ที่ง่ายที่สุด คือสร้าง R Markdown ที่รองรับภาษาไทยจาก template
ที่ package นี้มีให้

ถ้าท่านใช้ RStudio ให้ไปที่
`File -> New File -> R Markdown... -> From Template`

<img src="man/figures/rmd-from-temp.png" alt="New R Markdown Template" width="500"/>

เลือก template **Thai PDF R Markdown** หรือ **Thai PDF Bookdown**
จากเมนู

กดปุ่ม **`OK`** จะเปิดไฟล์ R Markdown template ที่รองรับกับภาษาไทย

<img src="man/figures/rstudio-rmd.png" alt="thaipdf R Markdown in RStudio" width="600"/>

จากนั้นกดปุ่ม **`Knit`** (cmd/ctr + shift + K) ได้เลย จะได้เอกสารเป็น
PDF ภาษาไทยที่มี เนื้อหา โค้ด และ กราฟ อยู่รวมกัน

![ตัวอย่าง R Markdown PDF ภาษาไทย](man/figures/pdf-doc-1.png)

# Learn more

------------------------------------------------------------------------

Last Updated: 2022-03-09
