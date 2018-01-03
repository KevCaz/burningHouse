#' @title Code that creates figure 1a
#'
#' @description Code that creates figure 1a found in Legagneux et al. 2018.
#'
#' @param time time values.
#' @param CC_p Time series values of the research papers pertaining to climate change.
#' @param PB_p Time series values of the research papers pertaining to biodiversity.
#' @param colCC A specification for the first color associated with climate change data.
#' @param colBD A specification for the second color associated with biodiversity data.
#'
#' @return
#' Creates a figure.
#'
#' @author Kevin Cazelles & Nicolas Casajus
#'
#' @importFrom graphics axis polygon par axis text lines points mtext barplot
#'
#' @examples
#' # Not run:
#' # data(sciPapers)
#' # grDevices::png('inst/fig/ms-figure1a.png', height = 5, width = 7, res = 300, unit = 'in')
#' #   figure1a(
#' #     sciPapers$year,
#' #     sciPapers$records_CC,
#' #     sciPapers$records_BD
#' #   )
#' # grDevices::dev.off()
#'
#' @export


figure1a <- function(time, CC_p, PB_p, colCC = "#594023", colBD = "#9eb844") {
    
    # set graphical parameters up
    par(lend = 2, xaxs = "i", yaxs = "i", las = 1, mar = c(4, 1, 3, 3.8), mgp = c(2.5, 
        0.75, 0), cex.axis = 1.34, family = "serif")
    cex_mt <- 1.8
    
    # empty plot
    graphics::plot(0, type = "n", axes = FALSE, ann = FALSE, xlim = c(1990.5, 2016.5), 
        ylim = c(0, 25))
    
    # barplots
    seqt <- as.numeric(time)
    points(seqt - 0.14, CC_p, type = "h", lwd = 6, col = colCC)
    points(seqt + 0.14, PB_p, type = "h", lwd = 6, col = colBD)
    
    # axes and labels
    axis(4L, at = seq(0, 25, 5), labels = F, lwd = cex_mt, lwd.ticks = 0)
    axis(4L, at = seq(0, 25, 5), labels = paste0(seq(0, 25, 5), "K"), lwd = 0, lwd.ticks = cex_mt)
    axis(1L, at = seq(1992, 2016, 4), labels = seq(1992, 2016, 4), lwd = 0, lwd.ticks = cex_mt)
    axis(1L, at = c(1990.5, 2016.5), labels = F, lwd = cex_mt, lwd.ticks = 0)
    text(1990, (par()$usr[3] + par()$usr[4])/4, "a)", pos = 4, cex = 1.8, font = 2)
    
    
    # Top-left barplot
    par(new = TRUE, fig = c(0, 0.7, 0.63, 1), mar = c(3, 1, 2, 2))
    graphics::plot(0, type = "n", axes = FALSE, ann = FALSE, xlim = c(0, 175), ylim = c(0.1, 
        2.25))
    
    axis(1, at = c(0, 175), labels = F, lwd = cex_mt, lwd.ticks = 0)
    axis(1, at = seq(0, 175, 50), labels = paste0(seq(0, 175, 50), "K"), lwd = cex_mt)
    
    barplot(c(sum(CC_p), sum(PB_p)), col = c(colCC, colBD), width = 0.75, space = 0.4, 
        border = NA, horiz = TRUE, add = TRUE, axes = FALSE)
    mtext(1, text = "Total number of publications", line = 2.4, cex = 1.8)
    text(c(0, 0), c(0.62, 1.62), labels = c("CC", "BD"), pos = 4, col = "grey95", 
        cex = cex_mt - 0.1)
    
    
    invisible(NULL)
}
