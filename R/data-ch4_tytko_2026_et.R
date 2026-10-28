#' Tytko, Hui, and Pand\enc{ž}{z}a (2026) eye-tracking data (raw)
#'
#' Raw file from Tytko, Hui, and Pand\enc{ž}{z}a (2026), as shared on the
#' study's OSF page. Used in Chapter 4 (Code Block 4.S1 and exercise
#' 4.7.2), which combines the four raw files
#' (\code{ch4_tytko_2026_comp}, \code{ch4_tytko_2026_list},
#' \code{ch4_tytko_2026_con}, \code{ch4_tytko_2026_et}) into
#' participant-level data such as \code{ch4_tytko_2026_ri}.
#'
#' @format A data frame with 6,825 rows and 14 variables: one row per
#'   participant, screen, and interest area. Each of the 65 participants
#'   (P136 is not included) read 21 screens per condition; reading-only
#'   (RO) screens have one interest area (the text) and RI and RIA screens
#'   have two (text and picture), giving 105 rows per participant. Code
#'   Block 4.S1 selects columns by position, so the column order matters.
#' \describe{
#'   \item{X}{Row number from the authors' export.}
#'   \item{ID}{Participant ID (e.g., "P101").}
#'   \item{TRIAL_INDEX}{Screen number, 1-63.}
#'   \item{TRIAL_IA_COUNT}{Number of interest areas on the screen: 1 (RO)
#'     or 2 (RI, RIA).}
#'   \item{con}{Condition: "RO", "RI", or "RIA".}
#'   \item{PvsT}{Interest area: "Picture" or "Text"; empty for RO screens.}
#'   \item{IA_ID}{Interest area number.}
#'   \item{TRIAL_DWELL_TIME}{Total dwell time on the screen, in
#'     milliseconds.}
#'   \item{IA_DWELL_TIME}{Dwell time in this interest area, in
#'     milliseconds.}
#'   \item{TRIAL_FIXATION_COUNT}{Number of fixations on the screen.}
#'   \item{IA_FIXATION_COUNT}{Number of fixations in this interest area.}
#'   \item{IAFixationPercent}{Proportion of the screen's fixations that
#'     fell in this interest area (0-1).}
#'   \item{IAAvgFixDur}{Mean fixation duration in this interest area, in
#'     milliseconds; NA when the area received no fixations (7 rows).}
#'   \item{IntegrSacc}{Number of integrative saccades (between the text
#'     and the picture) on the screen. Code Block 4.S1 uses the value on
#'     the Picture rows.}
#' }
#' @source See \code{ch4_tytko_2026_ri} for the full citation.
#'   Original file: ET_Data_Cleaned_Trimmed.csv, \url{https://osf.io/hq57n}.
#' @examples
#' data("ch4_tytko_2026_et")
#' head(ch4_tytko_2026_et)
#' table(ch4_tytko_2026_et$con, ch4_tytko_2026_et$PvsT, useNA = "ifany")
"ch4_tytko_2026_et"
