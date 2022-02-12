
<!-- README.md is generated from README.Rmd. Please edit that file -->

# thaipdf

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

<!-- badges: end -->

> R package :package: ช่วยสร้าง PDF document จาก R Markdown ที่ใช้
> **ภาษาไทย**

## Installation

ท่านสามารถติดตั้ง development version ของ thaipdf จาก
[GitHub](https://github.com/Lightbridge-KS/thaipdf) ด้วยคำสั่ง:

``` r
# install.packages("remotes")
remotes::install_github("Lightbridge-KS/thaipdf")
```

## Goal

จุดมุ่งหมายของ R package นี้ **เพื่อให้ท่านสามารถสร้าง PDF
เป็นภาษาไทยจาก R Markdown ได้โดยง่าย** (อาจไม่จำเป็นต้องใช้งาน LaTeX
เป็นเลย หรือรู้จักเพียงเล็กน้อย)

## Problem

ถ้าท่านได้ลองพิมพ์ภาษาไทยใน R Markdown แล้ว knit เป็น pdf_document
จะพบว่าเกิด error ขึ้น

    Error: LaTeX failed to compile something.tex.

การสร้าง PDF จาก R Markdown นั้น จะผ่านกระบวนการที่แปลงเอกสารหลายขั้นตอน
ซึ่ง **ภาษาไทย** จะมีปัญหาที่ขั้นตอน

> **LaTeX -> PDF**

วิธีแก้นั้น จะต้องมีการตั้งค่าต่างๆ ใน LaTeX preamble และ YAML header
ของ R Markdown เพื่อให้รองรับกับการใช้งานภาษาไทยได้ โดย R package
นี้จึงถูกสร้างขึ้นเพื่อช่วยง่ายขึ้นใน workflow จุดนี้

## Usage (TODO)
