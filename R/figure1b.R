#' @title Code that creates figure 1b
#'
#' @description Code that creates figure 1b.
#'
#' @param time time values.
#' @param CC_f Time-series values of the research funding allocated to climate change.
#' @param PB_f Time-series values of the research funding allocated to biodiversity.
#' @param col1 A specification for the first color.
#' @param col2 A specification for the second color.
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
#' # data(fundingUSCAN)
#' # grDevices::png('inst/fig/ms-figure1a.png', height = 5, width = 7, res = 300, unit = 'in')
#' #   figure1b(
#' #     fundingUSCAN$year,
#' #     fundingUSCAN$CC_CA + fundingUSCAN$CC_US,
#' #     fundingUSCAN$PB_CA + fundingUSCAN$PB_US
#' #   )
#' # grDevices::dev.off()
#'
#' @export


figure1b <- function(time, CC_f, PB_f, col1 = "#594023", col2 = "#9eb844") {
    
    
    ##-- setup graphical parameters
    par(lend = 2, xaxs = "i", yaxs = "i", las = 1, mar = c(4, 1, 3, 3.8), mgp = c(2.5, 
        0.75, 0), cex.axis = 1.34, family = "serif")
    cex_mt <- 1.8
    ##-- empty plot
    graphics::plot(0, type = "n", axes = FALSE, ann = FALSE, xlim = c(1990.5, 2016.5), 
        ylim = c(0, 3e+09))
    
    ##-- time sequence
    seqt <- as.numeric(time)
    ##-- barplot
    points(seqt - 0.14, CC_f, type = "h", lwd = 6, col = col1)
    points(seqt + 0.14, PB_f, type = "h", lwd = 6, col = col2)
    
    ##-- axes and labels
    axis(4, at = c(0, 3e+09), labels = F, lwd = cex_mt, lwd.ticks = 0)
    axis(4, at = seq(0, 3e+09, 5e+08), labels = paste0(format(seq(0, 3, 0.5)), "G"), 
        lwd = 0, lwd.ticks = cex_mt)
    axis(1, at = seq(1992, 2016, 4), labels = seq(1992, 2016, 4), lwd = 0, lwd.ticks = cex_mt)
    axis(1, at = c(1990.5, 2016.5), labels = F, lwd = cex_mt, lwd.ticks = 0)
    par(xpd = TRUE)
    text(1990, (par()$usr[3] + par()$usr[4])/4, "a)", pos = 4, cex = 1.6, font = 2)
    par(xpd = FALSE)
    
    ##-- Top-left barplot
    par(new = TRUE, fig = c(0, 0.7, 0.63, 1), mar = c(3, 1, 2, 2))
    graphics::plot(0, type = "n", axes = FALSE, ann = FALSE, xlim = c(0, 35), ylim = c(0.1, 
        2.25))
    
    axis(1, at = c(0, 35), labels = F, lwd = cex_mt, lwd.ticks = 0)
    axis(1, at = seq(0, 30, 10), labels = paste0(seq(0, 30, 10), "G"), lwd = cex_mt)
    
    barplot(c(sum(CC_f), sum(PB_f))/1e+09, col = c(col1, col2), width = 0.75, space = 0.4, 
        border = NA, horiz = TRUE, add = TRUE, axes = FALSE)
    mtext(1, text = "Total fundings (USD)", line = 2.4, cex = 1.8)
    text(c(0, 0), c(0.62, 1.62), labels = c("CC", "BD"), pos = 4, col = "grey95", 
        cex = cex_mt - 0.1)
    
    ##-- returns NULL
    invisible(NULL)
}
