ch3_kakitani_2024 <- read.csv("data-raw/ch3_kakitani_2024.csv")
usethis::use_data(ch3_kakitani_2024, overwrite = TRUE)


ch5_fake <- read.csv("data-raw/ch5_fake.csv")
usethis::use_data(ch5_fake, overwrite = TRUE)

# Chapter 4: Tytko, Hui, & Pandža (2026), RI condition (Code Blocks 4.3-4.12)
ch4_tytko_2026_ri <- read.csv("data-raw/ch4_tytko_2026_ri.csv")
usethis::use_data(ch4_tytko_2026_ri, overwrite = TRUE)

# Chapter 4: simulated Swahili data (Table 4.1, Figure 4.1b, Code Blocks 4.1-4.2)
# Generated once by data-raw/ch4_sim_swahili.R
ch4_sim_swahili <- read.csv("data-raw/ch4_sim_swahili.csv")
usethis::use_data(ch4_sim_swahili, overwrite = TRUE)


# Chapter 3: simulated listening scores (Code Block 3.4, Figure 3.10)
# Generated once by data-raw/ch3_sim_listen_overlap.R
ch3_sim_listen_overlap <- read.csv("data-raw/ch3_sim_listen_overlap.csv")
usethis::use_data(ch3_sim_listen_overlap, overwrite = TRUE)

# Chapter 4: Tytko et al. (2026) raw files (Code Block 4.S1, exercise 4.7.2)
ch4_tytko_2026_comp <- read.csv("data-raw/ch4_tytko_2026_comp.csv")
ch4_tytko_2026_list <- read.csv("data-raw/ch4_tytko_2026_list.csv")
ch4_tytko_2026_con  <- read.csv("data-raw/ch4_tytko_2026_con.csv")
ch4_tytko_2026_et   <- read.csv("data-raw/ch4_tytko_2026_et.csv")
usethis::use_data(ch4_tytko_2026_comp, ch4_tytko_2026_list,
                  ch4_tytko_2026_con, ch4_tytko_2026_et, overwrite = TRUE)
