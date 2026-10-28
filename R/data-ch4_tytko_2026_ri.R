#' Tytko, Hui, and Pand\enc{ž}{z}a (2026) reading plus image data
#'
#' Participant-level reading comprehension and eye-movement measures from
#' the reading plus image (RI) condition of Tytko, Hui, and
#' Pand\enc{ž}{z}a (2026). Adult L1 English beginner learners of Spanish
#' read parts of a story under three conditions: reading only (RO),
#' reading plus image (RI), and reading plus image and audio (RIA). This
#' dataset contains the RI condition only, averaged within each
#' participant. It was created from the study's raw files with Code
#' Block 4.S1. Used in Chapter 4 (Code Blocks 4.3-4.12).
#'
#' @format A data frame with 65 rows (one per participant) and 4
#'   variables. Participant P136 is excluded, as in Code Block 4.S1.
#' \describe{
#'   \item{ID}{Participant ID (e.g., "P101").}
#'   \item{comprehension}{Proportion of comprehension questions in the RI
#'     condition answered correctly (0-1). Item Q40 was removed, so
#'     participants in Lists 1 and 6 answered 29 RI questions and all
#'     other participants answered 30.}
#'   \item{dwell_image}{Proportion of dwell time spent on the image,
#'     Picture / (Text + Picture), computed for each RI screen and then
#'     averaged across the participant's 21 RI screens (0-1). Higher
#'     values mean more viewing time on the image.}
#'   \item{integrative_saccades}{Mean number of integrative saccades
#'     (eye movements between the text and the image) per RI screen,
#'     averaged across the participant's 21 RI screens.}
#' }
#' @source Tytko, T., Hui, B., & Pand\enc{ž}{z}a, N. B. (2026).
#'   The effect of multimodal input on L2 learners' reading comprehension:
#'   A preregistered eye-tracking study. \emph{Modern Language Journal, 110}, 210-239.
#'   \doi{10.1111/modl.70023}. Data: \url{https://osf.io/hq57n}.
#'   License: TO CONFIRM (the OSF project lists no license as of
#'   October 2026).
#' @examples
#' data("ch4_tytko_2026_ri")
#' head(ch4_tytko_2026_ri)
#' cor.test(~ integrative_saccades + comprehension, data = ch4_tytko_2026_ri)
"ch4_tytko_2026_ri"


