## code to prepare `DATASET` dataset goes here

pay2 <- read.csv("data-raw/jfpay2.csv",
                 header = TRUE,
                 stringsAsFactors = TRUE)

pay3 <- read.csv("data-raw/jfpay3.csv",
                header = TRUE,
                stringsAsFactors = TRUE)

pay2 <- pay2[-c(1)]
pay3 <- pay3[-c(1)]

pay2$date <- as.Date(pay2$date, "%Y-%m-%d")
pay2$year <- as.character(pay2$year)

pay3$date <- as.Date(pay3$date, "%Y-%m-%d")
pay3$year <- as.character(pay3$year)

usethis::use_data(pay2, pay3, overwrite = TRUE)
