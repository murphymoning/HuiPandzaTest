ch3 <- read.csv("data-raw/test_data.csv")

usethis::use_data(ch3, overwrite = TRUE)


ch5_fake <- read.csv("data-raw/ch5_fake.csv")
usethis::use_data(ch5_fake, overwrite = TRUE)

# Chapter 4: Tytko, Hui, & Pandža (2026), RI condition (Code Blocks 4.3-4.12)
tytko_2026_ri <- read.csv("data-raw/tytko_2026_ri.csv")
usethis::use_data(tytko_2026_ri, overwrite = TRUE)
