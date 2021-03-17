library(tidyverse)
library(synapser)
library(data.table)
library(here)

manifest <- fread("example_manifest_template.tsv")
manifest$path <- purrr::map(list.files("data"), ~(glue::glue(file.path(here(),.x))))
manifest$parent <- "syn25257395"
manifest$name <- "bulk upload test"
manifest$used <- ""
manifest$executed <- ""
