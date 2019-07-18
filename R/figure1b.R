#' @title Code that creates figure 1b found in Legagneux et al. 2018
#'
#' @description Code that creates a figure presenting the number of worldwide scientific
#' papers published in peer-reviewed literature on biodiversity (\code{colBD})
#' and climate change (\code{colCC}) from 1991 to 2016.
#'
#' @param time time values.
#' @param CC_f Time series values of the research funding allocated to climate change.
#' @param PB_f Time series values of the research funding allocated to biodiversity.
#' @param colCC A specification for the first color associated with climate change data.
#' @param colBD A specification for the second color associated with biodiversity data.
#'
#' @return
#' Creates a figure.
#'
#' @author Kevin Cazelles & Nicolas Casajus
#'
#' @importFrom graphics axis polygon par text lines points mtext barplot
#'
#' @examples
#' \dontrun{
#' # data(fundingUSCAN)
#' grDevices::png('inst/fig/ms-figure1b.png', height = 5, width = 7, res = 300, unit = 'in')
#' figure1b(
#'   fundingUSCAN$year,
#'   fundingUSCAN$CC_CA + fundingUSCAN$CC_US,
#'   fundingUSCAN$BD_CA + fundingUSCAN$BD_US,
#'   colCC = '#b57653', colBD = '#8bcf35'
#' )
#' grDevices::dev.off()
#' }
#' @export


figure1b <- function(time, CC_f, PB_f, colCC = "#594023", colBD = "#9eb844") {

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
    points(seqt - 0.14, CC_f, type = "h", lwd = 6, col = colCC)
    points(seqt + 0.14, PB_f, type = "h", lwd = 6, col = colBD)

    ##-- axes and labels
    axis(4, at = c(0, 3e+09), labels = F, lwd = cex_mt, lwd.ticks = 0)
    axis(4, at = seq(0, 3e+09, 5e+08), labels = paste0(format(seq(0, 3, 0.5)), "G"),
        lwd = 0, lwd.ticks = cex_mt)
    axis(1, at = seq(1992, 2016, 4), labels = seq(1992, 2016, 4), lwd = 0, lwd.ticks = cex_mt)
    axis(1, at = c(1990.5, 2016.5), labels = F, lwd = cex_mt, lwd.ticks = 0)
    par(xpd = TRUE)
    text(1990, (par()$usr[3] + par()$usr[4])/4, "b)", pos = 4, cex = 1.8, font = 2)
    par(xpd = FALSE)

    ##-- Top-left barplot
    par(new = TRUE, fig = c(0, 0.7, 0.63, 1), mar = c(3, 1, 2, 2))
    graphics::plot(0, type = "n", axes = FALSE, ann = FALSE, xlim = c(0, 35), ylim = c(0.1,
        2.25))

    axis(1, at = c(0, 35), labels = F, lwd = cex_mt, lwd.ticks = 0)
    axis(1, at = seq(0, 30, 10), labels = paste0(seq(0, 30, 10), "G"), lwd = cex_mt)

    barplot(c(sum(CC_f), sum(PB_f))/1e+09, col = c(colCC, colBD), width = 0.76, space = 0.38,
        border = NA, horiz = TRUE, add = TRUE, axes = FALSE)
    mtext(1, text = "Financement total (US$)", line = 2.4, cex = 1.8)
    text(c(-.7, -.7), c(0.62, 1.62), labels = c("Changements climatiques", "Biodiversit\u00e9"), pos = 4, col = "grey95",
        cex = cex_mt -.2)

    ##-- returns NULL
    invisible(NULL)
}
