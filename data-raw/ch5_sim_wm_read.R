# =========================================================
# data-raw/ch5_sim_wm_read.R
# Creates data-raw/ch5_sim_wm_read.csv: the simulated working memory and
# reading population used in Chapter 5 (Code Blocks 5.1-5.3).
#
# This is Bronson's original code (BronsonCode.R). The 50-learner sample is
# drawn right after mvrnorm(), with no second set.seed(), exactly as in his
# script; that sample produced every number printed in Chapter 5.
#
# The sampled learners are marked in_sample = TRUE and moved to rows 1-50,
# in the order they were drawn, so subset(d, in_sample) returns the same
# sample in the same row order (Code Block 5.2 refers to "row 3").
# Moving rows does not change anything about the population.
#
# Run ONCE, from the package project. Afterwards the CSV is the source of
# truth; make-data.R reads the CSV, not this script.
# =========================================================
set.seed(852)

pop <- as.data.frame(
  MASS::mvrnorm(
    n = 10000,
    mu = c(WM = 45, reading = 70),
    Sigma = matrix(c(1, 0.3,
                     0.3, 1), nrow = 2),
    empirical = TRUE
  ))

# Random sample of 50 learners (without replacement), as in Bronson's script
idx <- sample(nrow(pop), 50)

ch5_sim_wm_read <- rbind(pop[idx, ], pop[-idx, ])
ch5_sim_wm_read$in_sample <- c(rep(TRUE, 50), rep(FALSE, nrow(pop) - 50))
rownames(ch5_sim_wm_read) <- NULL

# Checks against the chapter before saving
print(cor(ch5_sim_wm_read$WM, ch5_sim_wm_read$reading))       # 0.3
s <- subset(ch5_sim_wm_read, in_sample, select = c(WM, reading))
print(round(cor(s$WM, s$reading), 4))                         # 0.2518
print(coef(lm(reading ~ WM, data = s)))                       # 60.149279 0.216833
print(round(c(s$reading[3], s$WM[3]), 4))                     # 70.2041 46.5705

write.csv(ch5_sim_wm_read, "data-raw/ch5_sim_wm_read.csv", row.names = FALSE)
