library(fs)
library(rio)
library(purrr)
library(readr)

excel_files <- dir_ls(file.path("raw", "old"), regexp = "add\\.xlsx")
imported <- map(excel_files, import)
out_files <- gsub("\\.xlsx", "\\.txt", excel_files)

walk2(imported, gsub("old/", "", out_files),
      ~write_delim(.x, .y, delim = "|"))
