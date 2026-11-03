#' Tytko, Hui, and Pand\enc{ž}{z}a (2026) reading comprehension and eye-movement data
#'
#' Participant-level reading comprehension and eye-movement measures from
#' Tytko, Hui, and Pand\enc{ž}{z}a (2026). Adult L1 English beginner
#' learners of Spanish read parts of a story under three conditions:
#' reading only (RO), reading plus image (RI), and reading plus image and
#' audio (RIA). This dataset contains the two conditions with an image (RI
#' and RIA), averaged within each participant and condition. It was created
#' from the study's raw files with Code Block 4.S1, run once for each
#' condition. Used in Chapter 4 (Section 4.6 uses the RI rows; exercise
#' 4.7.2 uses the RIA rows).
#'
#' @format A data frame with 130 rows (65 participants x 2 conditions) and
#'   5 variables. Participant P136 is excluded, as in Code Block 4.S1.
#' \describe{
#'   \item{ID}{Participant ID (e.g., "P101").}
#'   \item{condition}{Reading condition: "RI" (reading plus image) or "RIA"
#'     (reading plus image and audio). Rows 1-65 are RI and rows 66-130
#'     are RIA.}
#'   \item{comprehension}{Proportion of comprehension questions in that
#'     condition answered correctly (0-1). Item Q40 was removed, so a
#'     participant answered 29 questions in the condition that contained
#'     Q40 for their list and 30 otherwise.}
#'   \item{dwell_image}{Proportion of dwell time spent on the image,
#'     Picture / (Text + Picture), computed for each screen and then
#'     averaged across the participant's 21 screens in that condition
#'     (0-1). Higher values mean more viewing time on the image.}
#'   \item{integrative_saccades}{Mean number of integrative saccades (eye
#'     movements between the text and the image) per screen, averaged
#'     across the participant's 21 screens in that condition.}
#' }
#' @source Tytko, T., Hui, B., & Pand\enc{ž}{z}a, N. B. (2026).
#'   The effect of multimodal input on L2 learners' reading comprehension:
#'   A preregistered eye-tracking study. \emph{Modern Language Journal, 110}, 210-239.
#'   \doi{10.1111/modl.70023}. Raw data: \url{https://osf.io/hq57n}.
#'   License: TO CONFIRM (the OSF project lists no license as of
#'   October 2026).
#' @examples
#' data("ch4_tytko_2026")
#' table(ch4_tytko_2026$condition)
#' corr_RI <- subset(ch4_tytko_2026, condition == "RI")
#' cor.test(~ integrative_saccades + comprehension, data = corr_RI)
"ch4_tytko_2026"
