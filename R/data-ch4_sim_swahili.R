#' Simulated Swahili listening time and vocabulary data
#'
#' Simulated data (not real learners) for 40 learners of Swahili, used to
#' illustrate a positive correlation in Chapter 4 (Table 4.1, Figure 4.1b,
#' and Code Blocks 4.1-4.2). The first three rows are the three named
#' learners in Table 4.1 (Jimin, Jisoo, and Yuna). The other 37 rows were
#' generated around the regression line through those three learners with
#' \code{set.seed(123)} and rounded to 2 decimals.
#'
#' @format A data frame with 40 rows and 3 variables:
#' \describe{
#'   \item{Name}{Learner name for the first three rows ("Jimin", "Jisoo",
#'     "Yuna") and a generated ID for the rest ("P104" to "P140").}
#'   \item{time_hours}{Time spent listening to Swahili songs per day, in
#'     hours.}
#'   \item{vocab_score}{Vocabulary test score, in percent.}
#' }
#' @source Simulated for this book with the code for Figure 4.1. The
#'   generating script is \code{data-raw/ch4_sim_swahili.R} in the package's
#'   source repository.
#' @examples
#' data("ch4_sim_swahili")
#' head(ch4_sim_swahili)
#' cor.test(ch4_sim_swahili$time_hours, ch4_sim_swahili$vocab_score)
"ch4_sim_swahili"
