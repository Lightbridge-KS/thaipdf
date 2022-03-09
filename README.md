
<!-- README.md is generated from README.Rmd. Please edit that file -->

# thaipdf

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/Lightbridge-KS/thaipdf/workflows/R-CMD-check/badge.svg)](https://github.com/Lightbridge-KS/thaipdf/actions)
[![Codecov test
coverage](https://codecov.io/gh/Lightbridge-KS/thaipdf/branch/main/graph/badge.svg)](https://app.codecov.io/gh/Lightbridge-KS/thaipdf?branch=main)

<!-- badges: end -->

> R package :package: นี้จะช่วยให้สร้าง PDF document จาก R Markdown
> ที่ใช้ **ภาษาไทย** ได้ง่ายขึ้น

| 1                                                   | 2                                                   |
|:----------------------------------------------------|:----------------------------------------------------|
| ![Thai book example 1](man/figures/book-th-ex1.png) | ![Thai book example 2](man/figures/book-th-ex2.png) |

### Contents

-   [เกริ่นนำ (Introduction)](#introduction)

-   [วิธีการติดตั้ง
    (](#Installation)[Installation](#installation)[)](#Installation)

-   [วิธีการใช้งานเบื้องต้น (Basic Usage)](#basic-usage)

    -   [แบบเอกสารเดี่ยว (Stand-alone R Markdown
        Template)](#stand-alone-r-markdown-template)

    -   [การตั้งค่าภาพรวม (Global Setting)](#global-setting)

-   [วิธีการใช้งานขั้นสูง (Advance Usage)](#advance-usage)

-   [แหล่งอ้างอิง (References)](#references)

# Introduction

### Goal

จุดมุ่งหมายของ R package นี้ เพื่อให้ท่านสามารถ**สร้าง PDF
เป็นภาษาไทยจาก R Markdown ได้โดยง่าย** จาก **R Markdown template** และ
**LaTeX preamble** ที่มีการตั้งค่าสำหรับภาษาไทยมาให้

### Problem

ถ้าท่านได้ลองพิมพ์ภาษาไทยใน R Markdown แล้ว knit เป็น `pdf_document`
จะพบว่าเกิด error ขึ้น

    Error: LaTeX failed to compile something.tex.

การสร้าง PDF จาก R Markdown นั้น จะผ่านกระบวนการที่แปลงเอกสารหลายขั้นตอน
ซึ่ง **ภาษาไทย** จะมีปัญหาที่ขั้นตอน

> **LaTeX -\> PDF**

วิธีแก้นั้น จะต้องมีการตั้งค่าต่างๆ ใน LaTeX preamble และ YAML header
ของ R Markdown เพื่อให้รองรับกับการใช้งานภาษาไทยได้ โดย R package
นี้จึงถูกสร้างขึ้นเพื่อ**ช่วยให้ง่ายขึ้น**ใน workflow จุดนี้

(อ้างอิงจาก: [คําแนะนําการตั้งค่า LATEX
สําหรับใช้ภาษาไทย](http://pioneer.netserv.chula.ac.th/~wdittaya/LaTeX/LaTeXThai.pdf))

# Installation

การ install เหล่านี้ทำเพียงครั้งเดียวเท่านั้น

-   **Install thaipdf:** ติดตั้ง development version ของ thaipdf จาก
    [GitHub](https://github.com/Lightbridge-KS/thaipdf) ด้วย:

``` r
# install.packages("remotes")
remotes::install_github("Lightbridge-KS/thaipdf")
```

-   **Install XeLaTeX และ LaTeX package** ที่จำเป็นสำหรับการใช้ภาษาไทย
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

โดย LaTeX package ที่จำเป็นสำหรับ type setting ภาษาไทยคือ “fontspec”,
“ucharclasses”, “setspace” และ “polyglossia”

-   **Check font:** ตรวจสอบว่าในเครื่องมีฟอนท์ [TH Sarabun
    New](https://www.f0nt.com/release/th-sarabun-new/)
    ถ้าไม่มีให้ติดตั้งด้วย (เนื่องจาก thaipdf ใช้ font นี้เป็นตัวหลัก)

# Basic Usage

## Stand-alone R Markdown Template

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

โปรดสังเกตุว่าการที่ภาษาไทยใช้งานได้นั้น เนื่องจากมีการตั้งค่า YAML
header ในส่วน

``` yaml
output: thaipdf::thaipdf_document
```

โดยที่ template ของ thaipdf ทั้ง 2 แบบ

-   **Thai PDF R Markdown** — ใช้ output เป็น `thaipdf_document()`
    ซึ่งเป็น wrapper ของ
    [`pdf_document()`](https://pkgs.rstudio.com/rmarkdown/reference/pdf_document.html)
    ที่สามารถรองรับ**ภาษาไทย**ได้ สำหรับการใช้งานอย่างง่าย หรือ

-   **Thai PDF Bookdown** — ใช้ output เป็น `thaipdf_book()` ซึ่งเป็น
    wrapper ของ
    [`bookdown::pdf_book()`](https://pkgs.rstudio.com/bookdown/reference/pdf_book.html)
    ที่สามารถรองรับ**ภาษาไทย**ได้ และมี feature ของ bookdown
    ที่เหมาะสำหรับการเขียน technical report หรือ
    หนังสือที่มีการวิเคราะห์ข้อมูล

เนื่องจากที่ทั้ง 2 function ของ thaipdf นี้ (`thaipdf_document()`,
`thaipdf_book()`) สามารถส่ง argument อื่นๆต่อไปยัง
[`pdf_document()`](https://pkgs.rstudio.com/rmarkdown/reference/pdf_document.html)
หรือ
[`bookdown::pdf_book()`](https://pkgs.rstudio.com/bookdown/reference/pdf_book.html)
ได้ ดังนั้นเราจึงสามารถ customize เพิ่มเติม โดยใส่ metadata อื่นๆ ใน
output field ของ YAML header ที่ 2 function หลังนี้ยอมรับได้เลย เช่น

``` yaml
title: "R Markdown ภาษาไทย"
author: "`thaipdf` package"
date: "09/03/2022"
fontsize: 10pt
output: 
  thaipdf::thaipdf_document:
    toc: true
    keep_tex: true
```

คือ ตั้งค่าขนาด `font` เท่ากับ 10pt คือกำหนดให้มีสารบัญ (`toc: true`)
และเก็บ intermediate LaTeX ไฟล์ไว้ด้วย (`keep_tex: true`)

## Global Setting

`{thaipdf}` มี global setting ที่เก็บไว้ในตัว package
ไว้สำหรับตั้งค่าเอกสารต่างๆ โดยมีคำสั่ง

-   **`thaipdf::thaipdf_config_get()`** ไว้เรียกดูการตั้งค่า global
    setting และ

-   **`thaipdf::thaipdf_config_set()`** ไว้ตั้งค่า global setting
    ซึ่งในขณะนี้มี option คือ argument

    -   `thai_font`: ตั้งค่าชนิดฟอนท์ภาษาไทยที่ต้องการ (default font
        จะเป็น “TH Sarabun New”)

    -   `line_spacing`: ตั้งค่าระยะห่างระหว่างบรรทัด
        ตัวอักษรภาษาไทยแนะนำให้ห่าง บรรทัดครึ่ง default จึงเป็น `1.5`

``` r
library(thaipdf)
```

ดูการตั้งค่า

``` r
# View Global Configuration
thaipdf_config_get() 
#> 
#> ── thaipdf Global Setting ──
#> 
#> • Thai font setting is "TH Sarabun New"
#> • Line spacing is 1.5
```

เปลี่ยน font เป็น “Laksaman”

``` r
# Change Thai font to "Laksaman"
thaipdf_config_set(thai_font = "Laksaman")
#> ✓ Setting thaipdf global configuration
#> 
#> ── thaipdf Global Setting ──
#> 
#> • Thai font setting is "Laksaman"
#> • Line spacing is 1.5
```

------------------------------------------------------------------------

# Advance Usage

## R Markdown Template with LaTeX preamble

สำหรับผู้ที่ใช้ LaTeX เป็น และต้องการ customize หลายสิ่งกับ LaTeX
ให้ลองเลือก template ที่ชื่อว่า `Thai PDF R Markdown (with preamble)`

<img src="man/figures/rmd-from-temp-preamble.png" alt="New R Markdown Template with Preamble" width="500"/>

จากนั้นใส่ชื่อไฟล์และตำแหน่งที่ให้สร้างที่ช่อง **Name** กับ **Location**
แล้วคลิก **OK**

จะมีการสร้าง folder ใน structure แบบนี้ (`<NAME>` คือชื่อที่กรอกในช่อง
Name ไป)

    <NAME>/
     |
     |--> <NAME>.Rmd
     |
     |--> preTeX/
           |
           |--> thai-preamble.tex

ใน folder จะมี R Markdown file ที่มี YAML header ที่ตั้งค่าที่สำคัญคือ:

``` yaml
output:
  pdf_document:
    latex_engine: xelatex  # จำเป็นต้องใช้ xelatex สำหรับภาษาไทย
    includes:
      in_header: "preTeX/thai-preamble.tex" # path ไปยัง preamble ที่มีปรับให้ใช้ภาษาไทยได้
```

-   **`latex_engine`** เป็น “xelatex” เพื่อให้ใช้ภาษาไทยได้

-   **`includes`** คือการนำไฟล์ LaTeX preamble
    ที่ตั้งค่าให้ใช้ภาษาไทยได้ (`thai-preamble.tex`) มาแทรกใน preamble
    header (`in_header`) ของ output LaTeX อีกที ก่อนที่จะ compile เป็น
    PDF

ดังนั้นเราจึงสามารถเขียน LaTeX เพิ่มเติม หรือ load package
และตั้งค่าอื่นๆ ในไฟล์ `thai-preamble.tex` ได้อีกด้วย เช่นทำ link
ให้มีสี (เหมือนภาพแรกสุดที่แสดง)

## Use LaTeX preamble for Thai Language

ทางเลือกนี้สำหรับผู้ที่มีไฟล์ R Markdown อยู่แล้ว
แต่ต้องการปรับให้ใช้กับภาษาไทยได้ โดยหลักการคือจะต้องใช้ LaTeX engine
เป็น xelatex และใช้ LaTeX preamble ที่มี package และคำสั่งต่างๆ สำหรับ
type setting ภาษาไทย

ฟังก์ชั่น **`thaipdf::use_thai_preamble()`** ถูกออกแบบในทำนอง [usethis
package](https://usethis.r-lib.org) โดยจะทำการ

-   **สร้างไฟล์ LaTeX preamble** ชื่อว่า `thai-preamble.tex` (default)
    โดยจะมีการเรียกใช้ LaTeX package และคำสั่งต่างๆ
    ในการตั้งค่าภาษาไทยในไฟล์นี้ เช่น ฟอนท์ภาษาไทย (`thai_font`) หรือ
    ระยะห่างระหว่างบรรทัด (`line_spacing`)

จากนั้นให้ **ปรับ [YAML
header](https://bookdown.org/yihui/rmarkdown-cookbook/rmarkdown-anatomy.html)**
ของ R Markdown ในส่วนของ
[`pdf_document:`](https://pkgs.rstudio.com/rmarkdown/reference/pdf_document.html)
หรือ
[`bookdown::pdf_document2:`](https://pkgs.rstudio.com/bookdown/reference/html_document2.html)
ซึ่งต้องทำเอง ดังนี้

-   ตั้ง `latex_engine: xelatex`

-   ใส่ path ให้ `thai-preamble.tex` ถูก includes ไปที่ `in_header:`

-   ใส่คำสั่ง `\sloppy` เพื่อตัดคำภาษาไทย ไปที่ R Markdown ส่วนต้น
    (หลังจาก YAML header)

### Example

``` r
thaipdf::use_thai_preamble()
#> ✓ Writing "thai-preamble.tex" at '/Users/kittipos/my_pkg/thaipdf/thai-preamble.tex'
#> ✓ Thai font was set to "TH Sarabun New" in the preamble.
#> ✓ Line spacing was set to 1.5 in the preamble.
#> 
#> ── TODO ────────────────────────────────────────────────────────────────────────
#> For YAML header of R Markdown in `pdf_document:` or `bookdown::pdf_document2:`
#> • Set `latex_engine` to `xelatex`
#> • Set to include the path to LaTeX preamble
#> 
#> ── Like This ───────────────────────────────────────────────────────────────────
#>     latex_engine: xelatex
#>     includes:
#>       in_header: thai-preamble.tex
#> 
#> ────────────────────────────────────────────────────────────────────────────────
#> 
#> • Add LaTeX macro `\sloppy` to the beginning of the body of R Markdown (just
#> after YAML header).
#> 
#> For more details see
#> • How to include preamble in R Markdown
#> <https://bookdown.org/yihui/rmarkdown-cookbook/latex-preamble.html>
#> • LaTeX setting in Thai
#> <http://pioneer.netserv.chula.ac.th/~wdittaya/LaTeX/LaTeXThai.pdf>
```

**จากนั้นใน R Markdown** (`pdf_document`) ปรับ **YAML header**
และใส่คำสั่ง `\sloppy`

``` markdown
---
title: "ทดสอบภาษาไทย" 
output:
  pdf_document:
    latex_engine: xelatex  # จำเป็นต้องใช้ xelatex สำหรับภาษาไทย
    includes:
      in_header: "preTeX/thai-preamble.tex" # path ไปยัง preamble ที่มีปรับให้ใช้ภาษาไทยได้
---

\sloppy

# สวัสดีชาวโลก
```

# References

-   [คําแนะนําการตั้งค่า LaTeX สําหรับใช้ภาษาไทย (ฑิตยา
    หวานวารี)](http://pioneer.netserv.chula.ac.th/~wdittaya/LaTeX/LaTeXThai.pdf)
-   [How to add LaTeX code to the
    preamble](https://bookdown.org/yihui/rmarkdown-cookbook/latex-preamble.html)
-   [polygloTeX template by
    mathmd](https://github.com/mathmd/polygloTeX/blob/master/polyglot_template.tex)

# Todo

-   [x] Write unit test

-   [ ] PKG down site

------------------------------------------------------------------------

Last Updated: 2022-03-09
