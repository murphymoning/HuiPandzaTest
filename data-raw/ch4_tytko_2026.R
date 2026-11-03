# =========================================================
# data-raw/ch4_tytko_2026.R
# Creates data-raw/ch4_tytko_2026.csv: participant-level comprehension and
# eye-tracking measures for the RI and RIA conditions of Tytko, Hui, and
# Pandza (2026). Used in Chapter 4 (Section 4.6 and exercise 4.7.2).
#
# The processing is Code Block 4.S1, run once for each condition.
# Inputs are the four raw files from the study's OSF page (osf.io/hq57n),
# kept in data-raw/ under these names (not installed with the package):
#   ch4_tytko_2026_comp.csv  <- Comprehension.csv
#   ch4_tytko_2026_list.csv  <- ListInfo.csv
#   ch4_tytko_2026_con.csv   <- con.csv
#   ch4_tytko_2026_et.csv    <- ET_Data_Cleaned_Trimmed.csv
#
# Run ONCE, from the package project. Afterwards the CSV is the source of
# truth; make-data.R reads the CSV, not this script.
# =========================================================
library(dplyr)
library(tidyr)

comp <- read.csv("data-raw/ch4_tytko_2026_comp.csv", header = TRUE) %>%
  slice(1:66) %>%
  filter(ID != "P136") %>%
  select(-Q40)
list_info <- read.csv("data-raw/ch4_tytko_2026_list.csv") %>% select(1:2)
con_info  <- read.csv("data-raw/ch4_tytko_2026_con.csv")
et <- read.csv("data-raw/ch4_tytko_2026_et.csv") %>%
  filter(ID != "P136") %>%
  mutate(con = toupper(con))

comp_long <- comp %>%
  pivot_longer(cols = -ID, names_to = "Q", values_to = "acc") %>%
  left_join(list_info, by = "ID") %>%
  left_join(con_info, by = c("List", "Q")) %>%
  mutate(acc = as.numeric(acc), con = toupper(con))

# Code Block 4.S1 for one condition ("RI" or "RIA")
build <- function(cond) {
  comp_summary <- comp_long %>%
    filter(con == cond) %>%
    group_by(ID, con) %>%
    summarise(mean_comprehension = mean(acc, na.rm = TRUE), .groups = "drop")

  dwell_summary <- et %>%
    select(1:9) %>%
    filter(con == cond) %>%
    select(ID, con, TRIAL_INDEX, PvsT, IA_DWELL_TIME) %>%
    pivot_wider(names_from = PvsT, values_from = IA_DWELL_TIME) %>%
    mutate(dwell_prop_image = Picture / (Text + Picture)) %>%
    group_by(ID, con) %>%
    summarise(mean_dwell_image = mean(dwell_prop_image, na.rm = TRUE),
              .groups = "drop")

  sacc_summary <- et %>%
    select(1:7, 14) %>%
    filter(con == cond) %>%
    select(ID, con, TRIAL_INDEX, PvsT, IntegrSacc) %>%
    filter(PvsT != "Text") %>%
    group_by(ID, con) %>%
    summarise(mean_integrative_saccades = mean(IntegrSacc, na.rm = TRUE),
              .groups = "drop")

  comp_summary %>%
    left_join(dwell_summary, by = c("ID", "con")) %>%
    left_join(sacc_summary,  by = c("ID", "con")) %>%
    select(ID,
           condition            = con,
           comprehension        = mean_comprehension,
           dwell_image          = mean_dwell_image,
           integrative_saccades = mean_integrative_saccades)
}

ch4_tytko_2026 <- bind_rows(build("RI"), build("RIA")) %>% as.data.frame()

# Checks before saving
print(dim(ch4_tytko_2026))            # 130 5
print(table(ch4_tytko_2026$condition)) # RI 65, RIA 65
print(head(ch4_tytko_2026, 3))         # P101 RI 0.8965517 0.1053705 4.428571

write.csv(ch4_tytko_2026, "data-raw/ch4_tytko_2026.csv", row.names = FALSE)
