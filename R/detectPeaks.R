#' @title Detect peaks in the newspapers articles time series.
#'
#' @description Code used to detect peaks in the newspapers articles time series.
#'
#' @param newsPapers A data frame that includes the number of newpapers articles.
#'
#' @return
#' A list of two elements
#'
#' @author Nicolas Casajus & Kevin Cazelles
#'
#' @examples
#' data(newsPapers)
#' newsPapers
#' detectPeaks(newsPapers)
#' @export


detectPeaks <- function(newsPapers) {
    ##----
    out <- list()
    ##---- Climate change peaks
    tmpCC <- cardidates::peakwindow(seq(1, nrow(newsPapers), 1), apply(newsPapers[, 
        grepl(names(newsPapers), pattern = "CC")], 1, sum), minpeak = 0.1, mincut = 0.6)$peaks$index
    out$peakCC <- as.character(newsPapers[tmpCC, 1])
    ##---- Biodiversity peaks
    tmpBD <- cardidates::peakwindow(seq(1, nrow(newsPapers), 1), apply(newsPapers[, 
        grepl(names(newsPapers), pattern = "BD")], 1, sum), minpeak = 0.1, mincut = 0.6)$peaks$index
    out$peakBD <- as.character(newsPapers[tmpBD, 1])
    ##----
    out
}
