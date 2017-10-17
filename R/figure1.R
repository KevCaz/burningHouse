#' @title Code that creates figure 1
#'
#' @description Format alien output and return an object of class \code{alienPredict}.
#'
#' @param file a character string giving the name of the file (see \linkpdf)
#' @param col1 A specification for the first color.
#' @param col2 A specification for the second color.
#'
#' @return
#' Cretes a figure  An object of the class \code{alienPredict} is returned .
#'
#' @author Nicolas Casajus & Kevin Cazelles
#'
#' @importFrom graphics axis polygon par axis text lines points mtext
#'
#' @examples
#' figure1()
#'
#' @export


figure1 <- function(file = "./inst/ms-figure1.pdf", col1 = "#594023", col2 = "#9eb844") {
    
    ##---
    pts <- events
    
    ##----
    month <- monthcan
    month$CC <- monthcan$CC + monthusa$CC + monthgbr$CC
    month$PB <- monthcan$PB + monthusa$PB + monthgbr$PB
    month$month <- as.Date(paste0(as.character(month$month), "-15"))
    ymax <- max(na.omit(as.vector(as.matrix(month$CC))))
    yrng <- ifelse(ymax > 2000, 200, ifelse(ymax > 900, 100, 50))
    
    
    grDevices::pdf("./inst/ms-figure1.pdf", width = 8, height = 6)
    # png(paste0('~/Dropbox/CCvsPB/ms/figs/ms-figure1.png'), width = 8, height = 6,
    # res = 300, unit = 'in')
    par(mar = c(3, 1, 0.5, 3), mgp = c(2.5, 0.75, 0), xaxs = "i", yaxs = "i", family = "serif", 
        new = FALSE, fig = c(0, 1, 0, 1))
    
    ##-- Empty plot
    
    graphics::plot(0, type = "n", xlab = "", ylab = "Number of articles", xlim = c(as.Date("1989-12-01"), 
        as.Date("2016-12-15")), ylim = c(0, yrng * (floor(ymax/yrng) + 1) + (yrng/2)), 
        bty = "n", axes = FALSE, font.lab = 2)
    
    
    
    ##-- Add times series
    polygon(x = c(as.Date("1990-01-15"), as.Date(month$month[1:323]), as.Date("2016-12-15")), 
        y = c(0, month$CC[1:323], 0), col = paste0(col1, "CC"), border = col1)
    polygon(x = c(as.Date("1990-01-15"), as.Date(month$month[1:323]), as.Date("2016-12-15")), 
        y = c(0, month$PB[1:323], 0), col = paste0(col2, "CC"), border = col2)
    
    
    
    ##-- Add frame and axes
    axis(4, seq(0, yrng * (floor(ymax/yrng) + 1), yrng), seq(0, yrng * (floor(ymax/yrng) + 
        1), yrng), las = 1, lwd = 1, lwd.ticks = 1)
    axis(1, as.Date(paste0(seq(1990, 2016, 2), "-01-15")), seq(1990, 2016, 2), lwd = 0, 
        lwd.ticks = 1)
    axis(1, c(as.Date("1990-01-15"), as.Date("2016-12-31")), labels = FALSE, lwd.ticks = 0)
    
    
    
    ##-- Add peaks
    
    par(xpd = TRUE)
    for (i in 1:17) {
        
        label <- as.character(pts[i, "keyword"])
        if (i %in% c(1, 2, 7)) {
            font <- 2
        } else {
            font <- 1
        }
        
        if (!is.na(pts[i, "date"]) && pts[i, "plot"] == 1) {
            points(month[which(month$month == as.Date(as.character(pts[i, "date"]))), 
                c("month", label)], pch = 19, cex = 0.75)
            
            if (!is.na(pts[i, "l1x2"])) {
                lines(x = c(as.Date(as.character(pts[i, "date"])), as.Date(as.character(pts[i, 
                  "date"])) + pts[i, "l1x2"]), y = c(month[which(month$month == as.Date(as.character(pts[i, 
                  "date"]))), label], pts[i, "l1y2"]))
                if (!is.na(pts[i, "l2x2"])) {
                  lines(x = c(as.Date(as.character(pts[i, "date"])) + pts[i, "l2x1"], 
                    as.Date(as.character(pts[i, "date"])) + pts[i, "l2x2"]), y = c(pts[i, 
                    "l2y2"], pts[i, "l2y2"]))
                  if (pts[i, "l2x2"] > 0) {
                    text(x = as.Date(as.character(pts[i, "date"])) + (pts[i, "l2x2"] - 
                      80), font = font, y = pts[i, "l2y2"], pos = pts[i, "pos"], 
                      cex = 0.75, as.character(pts[i, "event"]))
                  } else {
                    text(x = as.Date(as.character(pts[i, "date"])) + (pts[i, "l2x2"] + 
                      80), font = font, y = pts[i, "l2y2"], pos = pts[i, "pos"], 
                      cex = 0.75, as.character(pts[i, "event"]))
                  }
                } else {
                  if (pts[i, "l1x2"] > 0) {
                    text(x = as.Date(as.character(pts[i, "date"])) + (pts[i, "l1x2"] - 
                      80), font = font, y = pts[i, "l1y2"], pos = pts[i, "pos"], 
                      cex = 0.75, as.character(pts[i, "event"]))
                  } else {
                    text(x = as.Date(as.character(pts[i, "date"])) + (pts[i, "l1x1"] + 
                      80), font = font, y = pts[i, "l1y2"], pos = pts[i, "pos"], 
                      cex = 0.75, as.character(pts[i, "event"]))
                  }
                }
            } else {
                if (pts[i, "pos"] == 2) {
                  text(month[which(month$month == as.Date(as.character(pts[i, "date"]))), 
                    c("month", label)] + c(50, 0), pos = pts[i, "pos"], cex = 0.75, 
                    as.character(pts[i, "event"]), font = font)
                }
                if (pts[i, "pos"] == 3) {
                  text(month[which(month$month == as.Date(as.character(pts[i, "date"]))), 
                    c("month", label)] - c(ifelse(i == 11, -50, 0), 5), pos = pts[i, 
                    "pos"], cex = 0.75, gsub("999", "\n", as.character(pts[i, "event"])), 
                    font = font)
                }
                if (pts[i, "pos"] == 4) {
                  text(month[which(month$month == as.Date(as.character(pts[i, "date"]))), 
                    c("month", label)] - c(50, 0), pos = pts[i, "pos"], cex = 0.75, 
                    as.character(pts[i, "event"]), font = font)
                }
            }
        }
    }
    
    for (i in 18:nrow(pts)) {
        label <- as.character(pts[i, "keyword"])
        if (pts[i, "keyword"] == "CC") {
            ccol <- col1
        } else {
            ccol <- col2
        }
        points(month[which(month$month == as.Date(as.character(pts[i, "date"]))), 
            c("month", label)], pch = 21, col = ccol, bg = "white", cex = 0.85)
    }
    par(xpd = FALSE)
    
    
    points(month[which(month$month == "1992-06-15"), c("month", "PB")], pch = 19, 
        cex = 0.75)
    points(month[which(month$month == "1997-06-15"), c("month", "PB")], pch = 19, 
        cex = 0.75)
    points(month[which(month$month == "2002-08-15"), c("month", "PB")], pch = 19, 
        cex = 0.75)
    # lines(x = c(as.Date('1992-06-15'), as.Date('1992-06-15')), y =
    # c(month[which(month$month == '1992-06-15'), 'PB'], month[which(month$month ==
    # '1992-06-15'), 'CC']), cex = .75) lines(x = c(as.Date('1997-06-15'),
    # as.Date('1997-06-15')), y = c(month[which(month$month == '1997-06-15'), 'PB'],
    # month[which(month$month == '1997-06-15'), 'CC']), cex = .75) lines(x =
    # c(as.Date('2002-09-15'), as.Date('2002-09-15')), y = c(month[which(month$month
    # == '2002-09-15'), 'PB'], month[which(month$month == '2002-09-15'), 'CC']), cex
    # = .75)
    
    
    ### Add source information
    
    # mtext(at = 17150, side = 1, line = 1.825, source, cex = .65, font = 3, adj = 1)
    
    
    
    xmax <- sum(na.omit(month$CC))/1000
    xrng <- ifelse(xmax > 100, 40, ifelse(xmax > 50, 20, 10))
    
    ### Add inset
    
    par(new = TRUE, fig = c(0, 0.5, 0.7, 1), mar = c(3, 1, 1.5, 2), mgp = c(2.5, 
        0.5, 0))
    graphics::plot(x = c(0, 0), y = c(0.5, 2.5), xlim = c(0, xrng * (floor(xmax/xrng) + 
        1)), type = "n", bty = "n", axes = FALSE, ann = FALSE)
    
    rect(xleft = 0, xright = sum(na.omit(month$CC))/1000, ybottom = 0.6, ytop = 1.4, 
        col = col1, border = NA)
    rect(xleft = 0, xright = sum(na.omit(month$PB))/1000, ybottom = 1.6, ytop = 2.4, 
        col = col2, border = NA)
    
    text(x = c(-0.5, -0.5), y = c(0.95, 1.95), labels = c("CC", "BD"), pos = 4, col = c("grey95", 
        "grey95"), cex = 1.15)
    
    axis(1, at = seq(0, xrng * (floor(xmax/xrng) + 1), xrng), labels = paste0(seq(0, 
        xrng * (floor(xmax/xrng) + 1), xrng), "K"))
    mtext(1, text = paste("Total number of media articles", sep = ""), line = 1.75, 
        cex = 1.34)
    
    
    ##-- Close device
    dev.off()
    
    invisible(NULL)
    
}




underline <- function(x, y, label, ...) {
    text(x, y, label, ...)
    sw <- strwidth(label)
    sh <- strheight(label)
    lines(x + c(-sw/2, sw/2), rep(y - 1.5 * sh/2, 2))
}
