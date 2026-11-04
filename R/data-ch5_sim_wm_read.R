#' Simulated working memory and reading comprehension scores
#'
#' Simulated data (not real learners): a population of 10,000 learners,
#' each with a working memory score and a reading comprehension score. The
#' two scores correlate at exactly r = .30, the overall correlation
#' reported in Shin's (2020) meta-analysis of working memory and reading
#' comprehension. Used in Chapter 5 (Code Blocks 5.1-5.3).
#'
#' Generated with \code{MASS::mvrnorm()} using \code{empirical = TRUE} and
#' \code{set.seed(852)}, so the population means, standard deviations, and
#' correlation are exact. A random sample of 50 learners was then drawn
#' (without replacement); these learners are marked by \code{in_sample} and
#' placed in rows 1-50, in the order they were drawn.
#'
#' @format A data frame with 10,000 rows and 3 variables:
#' \describe{
#'   \item{WM}{Working memory capacity score (e.g., from an operation span
#'     task). Population mean = 45, SD = 1.}
#'   \item{reading}{Reading comprehension score. Population mean = 70,
#'     SD = 1.}
#'   \item{in_sample}{TRUE for the 50 learners randomly sampled for the
#'     regression analysis in Chapter 5 (rows 1-50); FALSE otherwise.}
#' }
#' @source Simulated for this book, based on Shin (2020). The generating
#'   script is \code{data-raw/ch5_sim_wm_read.R} in the package's source
#'   repository.
#' @examples
#' data("ch5_sim_wm_read")
#' cor(ch5_sim_wm_read$WM, ch5_sim_wm_read$reading)   # .30 in the population
#'
#' d_sample <- subset(ch5_sim_wm_read, in_sample, select = c(WM, reading))
#' summary(lm(reading ~ WM, data = d_sample))
"ch5_sim_wm_read"
