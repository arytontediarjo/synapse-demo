library(tidyverse)
library(synapser)
library(data.table)
library(here)

PARENT_ID <- "syn25258506"

manifest <- tibble::tibble(
    path = purrr::map_chr(list.files("data"), ~(glue::glue(file.path(here(),"data",.x)))),
    parent = PARENT_ID,
    name = list.files("data"),
    used = "syn23555388",
    executed = "https://github.com/arytontediarjo/synapse-demo/blob/main/Notebook/file_upload.Rmd",
    dataType = "samples-demo"
) %>% write.table(., "manifest.tsv", sep = "\t", row.names = FALSE, quote = FALSE)
