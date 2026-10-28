# =========================================================
# data-raw/ch3_sim_listen_overlap.R
# Creates data-raw/ch3_sim_listen_overlap.csv: the simulated listening
# scores used in Chapter 3 (Code Block 3.4, Figure 3.10).
#
# This is the data part of the Figure 3.10 code (Ch3_Quarto.qmd), with the
# plotting removed. Code Block 3.4 prints the t-test on the SHIFTED data
# (data2_adj in the figure code), so that is what is saved here.
#
# Run ONCE, from the package project. Afterwards the CSV is the source of
# truth; make-data.R reads the CSV, not this script.
# =========================================================

# 1) Find simulated data where the Welch t-test p-value is about .05
find_near_p <- function(target_p = 0.05, tol = 0.002,
                        n = 20, mean_esl = 75, mean_efl = 72.4,
                        sd = 5, max_tries = 100000) {
  for (s in 1:max_tries) {
    set.seed(s)
    esl <- rnorm(n, mean = mean_esl, sd = sd)
    efl <- rnorm(n, mean = mean_efl, sd = sd)
    data2 <- data.frame(score = c(esl, efl),
                        group = rep(c("ESL", "EFL"), each = n))
    tt <- t.test(score ~ group, data = data2)
    if (abs(tt$p.value - target_p) < tol) {
      return(list(seed = s, data = data2, tt = tt))
    }
  }
  NULL
}

res <- find_near_p()
if (is.null(res)) stop("No match found.")
cat("Found seed:", res$seed, "\n")        # 2
data2 <- res$data

# 2) Shift the ESL scores so the upper CI of the difference is -0.01
U0 <- t.test(score ~ group, data = data2)$conf.int[2]
shift <- U0 - (-0.01)
ch3_sim_listen_overlap <- data2
ch3_sim_listen_overlap$score[ch3_sim_listen_overlap$group == "ESL"] <-
  ch3_sim_listen_overlap$score[ch3_sim_listen_overlap$group == "ESL"] + shift

# Check against Code Block 3.4 before saving:
# t = -2.0308, df = 37.557, p-value = 0.0494, 95% CI -7.19017 -0.01000,
# mean in group EFL 72.39859, mean in group ESL 75.99868
print(t.test(score ~ group, data = ch3_sim_listen_overlap))

write.csv(ch3_sim_listen_overlap, "data-raw/ch3_sim_listen_overlap.csv",
          row.names = FALSE)
