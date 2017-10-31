#' @title Code that creates figure 1a
#'
#' @description Code that creates figure 1a.
#'
#' @param file a character string giving the name of the file (see \code{\link[grDevices]{pdf}}).
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
#' figure1a()
#'
#' @export


figure1a <- function(file = "ms-figure1a.pdf", col1 = "#594023", col2 = "#9eb844") {
    
    ##-- rename data to use shoter names
    # us = burningHouse::fundingUS ca2 = burningHouse::fundingCAN_BD ca1 =
    # burningHouse::fundingCAN_CC ##-- CC = tapply(ca1$Amount, ca1$Year, sum) PB =
    # tapply(ca2$Amount, ca2$Year, sum) ca = data.frame(year = names(CC), CC, PB)
    # ca$year = as.numeric(as.character(ca$year)) ##-- data(rateExch) dat =
    # data.frame(year = exchRates$YEAR, exchRates = exchRates$CADUS) ca = merge(ca,
    # dat, by = 'year', all = TRUE) uk = merge(uk, dat, by = 'year', all = TRUE) ca =
    # ca[-c(1, 27), ] ca$CC = ca$CC * ca$devise ca$PB = ca$PB * ca$devise # uk$CC =
    # uk$CC * uk$exchRates # uk$PB = uk$PB * uk$exchRates uk = uk[-c(1, 27), ]
    # uk[1:10, 2] = 0 uk[1:10, 3] = 0 us = us[-c(1, 27), ] CC_f =
    # as.numeric(as.character(us$CC)) + as.numeric(as.character(ca$CC)) PB_f =
    # as.numeric(as.character(us$PB)) + as.numeric(as.character(ca$PB)) cex_mt <- 1.8
    # ##-- Figure # pdf('~/Dropbox/CCvsPB/ms/figs/ms-figure2a.pdf', height = 5, width
    # = 7)# res=300, pointsize = 24) png('~/Dropbox/CCvsPB/ms/figs/ms-figure2a.png',
    # height = 5, width = 7, res = 300, unit = 'in') par(lend = 2, xaxs = 'i', yaxs =
    # 'i', las = 1, mar = c(4, 1, 3, 3.8), mgp = c(2.5, .75,0), cex.axis = 1.34,
    # family = 'serif') plot(0, type = 'n', axes = FALSE, ann = FALSE, xlim =
    # c(1990.5, 2016.5), ylim = c(0, 3e9)) seqt <- as.numeric(names(CC))
    # points(seqt-.14, CC_f, type='h', lwd=6, col=col1) points(seqt+.14, PB_f,
    # type='h', lwd=6, col=col2) axis(4, at = c(0, 3e9), labels = F, lwd = cex_mt,
    # lwd.tick = 0) axis(4, at = seq(0, 3e9, .5e9), labels = paste0(format(seq(0, 3,
    # .5)), 'G'), lwd = 0, lwd.tick = cex_mt) axis(1, at = seq(1992, 2016, 4), labels
    # = seq(1992, 2016, 4), lwd = 0, lwd.tick = cex_mt) axis(1, at =
    # c(1990.5,2016.5), labels = F, lwd = cex_mt, lwd.tick = 0) par(xpd = TRUE)
    # text(1990, (par()$usr[3] + par()$usr[4])/4, 'a)', pos = 4, cex = 1.6, font = 2)
    # par(xpd = FALSE) ## Fig 2 par(new = TRUE, fig = c(0, .7, .63, 1), mar = c(3, 1,
    # 2, 2)) plot(0, type = 'n', axes = FALSE, ann = FALSE, xlim = c(0, 35), ylim =
    # c(0.1, 2.25)) axis(1, at = c(0, 35), labels = F, lwd = cex_mt, lwd.tick = 0)
    # axis(1, at = seq(0, 30, 10), labels = paste0(seq(0, 30, 10), 'G'), lwd =
    # cex_mt) barplot(c(sum(CC_f), sum(PB_f))/1000000000, col = c(col1, col2), width
    # = .75, space = .4, border = NA, horiz = TRUE, add = TRUE, axes = FALSE)
    # mtext(1, text = 'Total fundings (USD)', line = 2.4, cex = 1.8) text(c(0, 0),
    # c(.62, 1.62), labels = c('CC', 'BD'), pos = 4, col = 'grey95', cex = cex_mt-.1)
    # dev.off()
    
    invisible(NULL)
}
