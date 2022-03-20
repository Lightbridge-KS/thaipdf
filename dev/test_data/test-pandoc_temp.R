
## Test `rmarkdown::pandoc_template()`

here::i_am("dev/test_data/test-pandoc_temp.R")
library(here)

here::dr_here()


## Write in current dir
rmarkdown::pandoc_template(
  metadata = list(thai_font = "Somefonts", line_spacing = 2),
  template = here("dev/test_data/test-thai-preamble-temp.tex"),
  output = here("dev/test_data/test-thai-preamble.tex")
  )


