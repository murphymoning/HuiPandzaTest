# =========================================================
# data-raw/ch4_sim_swahili.R
# Creates data-raw/ch4_sim_swahili.csv: the simulated Swahili data used in
# Chapter 4 (Table 4.1, Figure 4.1b, Code Blocks 4.1-4.2).
#
# This is the data part of the Figure 4.1 code (Ch4_Quarto.qmd), with the
# plotting removed. The random-number calls are the same and in the same
# order, so the result is identical to the original data.csv.
#
# Run ONCE, from the package project. Afterwards the CSV is the source of
# truth; make-data.R reads the CSV, not this script.
# =========================================================

# The three learners from Table 4.1
df_base <- data.frame(
  Name        = c("Jimin", "Jisoo", "Yuna"),
  time_hours  = c(0.3, 1.4, 2.2),
  vocab_score = c(14, 36, 43)
)

# Regression line through those three learners
model <- lm(vocab_score ~ time_hours, data = df_base)
b0 <- coef(model)[1]
b1 <- coef(model)[2]

# 37 simulated learners around that line
set.seed(123)
new_x <- runif(37, 0.2, 2.4)
new_y <- b0 + b1 * new_x + rnorm(37, mean = 0, sd = 4)
new_y <- pmin(pmax(new_y, 2), 50)    # keep scores between 2 and 50

df_extra <- data.frame(
  Name        = paste0("P", 104:140),
  time_hours  = new_x,
  vocab_score = new_y
)

ch4_sim_swahili <- rbind(df_base, df_extra)
ch4_sim_swahili$time_hours  <- round(ch4_sim_swahili$time_hours, 2)
ch4_sim_swahili$vocab_score <- round(ch4_sim_swahili$vocab_score, 2)
rownames(ch4_sim_swahili) <- NULL

# Check against Code Blocks 4.1-4.2 before saving
print(head(ch4_sim_swahili))   # row 4 should be: P104 0.83 20.60
print(dim(ch4_sim_swahili))    # 40 3
print(cor(ch4_sim_swahili$time_hours, ch4_sim_swahili$vocab_score))   # 0.9429707

write.csv(ch4_sim_swahili, "data-raw/ch4_sim_swahili.csv", row.names = FALSE)
