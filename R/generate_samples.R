library(tidyverse)
library(data.table)
library(purrr)

N_ROWS <- 5
ITER <- 10

get_data <- function(iter_num){
    tibble::tibble(
        user = stringi::stri_rand_strings(N_ROWS, 10),
        createdOn = sample(seq(
            lubridate::as_datetime('2020/01/01'), 
            lubridate::as_datetime('2021/01/01'), by="day"), N_ROWS),
        x = rnorm(N_ROWS), 
        y = rnorm(N_ROWS)) %>% 
        arrange(createdOn) %>%
        write.table(., glue::glue("data/sample_{iter_num}.tsv"), 
                    sep = "\t", row.names=FALSE, quote=FALSE)
}

purrr::map(seq(10), ~get_data(.x))
