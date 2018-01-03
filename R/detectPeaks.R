#' @title Detect peaks
#'
#' @description This function detects peaks from a time series. Here we specify
#' the function so it deals at once with both climate change and biodiversity
#' articles time series.
#'
#' @param newsPapers A data frame that includes the number of newpapers articles
#' for climate change and biodiversity.
#'
#' @return
#' A list of two elements: significant peaks for climate change (\code{peakCC})
#' and biodiversity (\code{peakBD}).
#'
#' @author Nicolas Casajus & Kevin Cazelles
#'
#' @examples
#' data(newsPapers)
#' newsPapers
#' detectPeaks(newsPapers)
#' @export


detectPeaks <- function(newsPapers) {
    out <- list()
    
    # Climate change peaks
    tmpCC <- cardidates::peakwindow(seq(1, nrow(newsPapers), 1), apply(newsPapers[, 
        grepl(names(newsPapers), pattern = "CC")], 1, sum), minpeak = 0.1, mincut = 0.6)$peaks$index
    out$peakCC <- as.character(newsPapers[tmpCC, 1])
    
    # Biodiversity peaks
    tmpBD <- cardidates::peakwindow(seq(1, nrow(newsPapers), 1), apply(newsPapers[, 
        grepl(names(newsPapers), pattern = "BD")], 1, sum), minpeak = 0.1, mincut = 0.6)$peaks$index
    out$peakBD <- as.character(newsPapers[tmpBD, 1])
    
    out
}
