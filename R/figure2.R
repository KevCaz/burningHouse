#' @title Code that creates figure 2 found in Legagneux et al. (2018)
#'
#' @description Code that creates figure 2, that is the number of newspaper
#' articles published per month on biodiversity (\code{colBD}) or climate
#' change (\code{colCC}) issues in US, Canada and UK. Detected peaks (plain
#' dots) and associated events are shown. Peaks without associated events (empty
#' dots) could not be associated with a priori events. Events that embraced both
#' CC and BD issues are written in bold.
#'
#' @param pts A dataframe of events.
#' @param newsPapers Monthly publications -- Canada + USA + UK.
#' @param colCC A specification for the first color associated with climate change data.
#' @param colBD A specification for the second color associated with biodiversity data.
#'
#' @return
#' Creates figure 2.
#'
#' @author Nicolas Casajus & Kevin Cazelles
#'
#' @importFrom graphics axis polygon par axis text lines points mtext rect strheight strwidth
#' @importFrom stats na.omit
#'
#' @examples
#' \dontrun{
#' data(events); data(newsPapers);
#' grDevices::png(file='inst/fig/ms-figure2.png', width = 8, height = 6, res = 300, unit = 'in')
#'  figure2(events, newsPapers)
# grDevices::dev.off()
#' }
#' @export

figure2 <- function(pts, newsPapers, colCC = "#594023", colBD = "#9eb844") {

    # print(newsPapers)
    # import data
    newsPapers$CC <- newsPapers$CC_CA + newsPapers$CC_US + newsPapers$CC_UK
    newsPapers$BD <- newsPapers$BD_CA + newsPapers$BD_US + newsPapers$BD_UK
    newsPapers$month <- as.Date(paste0(as.character(newsPapers$month), "-15"))
    ymax <- max(na.omit(as.vector(as.matrix(newsPapers$CC))))
    yrng <- ifelse(ymax > 2000, 200, ifelse(ymax > 900, 100, 50))

    # set
    par(mar = c(3, 1, 0.5, 3), mgp = c(2.5, 0.75, 0), xaxs = "i", yaxs = "i", family = "serif",
        fig = c(0, 1, 0, 1))

    # create an empty plot
    graphics::plot(0, type = "n", xlab = "", ylab = "Number of articles", xlim = c(as.Date("1989-12-01"),
        as.Date("2016-12-15")), ylim = c(0, yrng * (floor(ymax/yrng) + 1) + (yrng/2)),
        bty = "n", axes = FALSE, font.lab = 2)


    # add times series
    polygon(x = c(as.Date("1990-01-15"), as.Date(newsPapers$month[1:323]), as.Date("2016-12-15")),
        y = c(0, newsPapers$CC[1:323], 0), col = paste0(colCC, "CC"), border = colCC)
    polygon(x = c(as.Date("1990-01-15"), as.Date(newsPapers$month[1:323]), as.Date("2016-12-15")),
        y = c(0, newsPapers$BD[1:323], 0), col = paste0(colBD, "CC"), border = colBD)


    # add frame and axes
    axis(4, seq(0, yrng * (floor(ymax/yrng) + 1), yrng), seq(0, yrng * (floor(ymax/yrng) +
        1), yrng), las = 1, lwd = 1, lwd.ticks = 1)
    axis(1, as.Date(paste0(seq(1990, 2016, 2), "-01-15")), seq(1990, 2016, 2), lwd = 0,
        lwd.ticks = 1)
    axis(1, c(as.Date("1990-01-15"), as.Date("2016-12-31")), labels = FALSE, lwd.ticks = 0)


    # add events
    par(xpd = TRUE)
    for (i in 1:17) {
        ##--
        label <- as.character(pts[i, "keyword"])
        font <- 1
        if (i %in% c(1, 2, 7))
            font <- 2

        # add points
        points(newsPapers[which(newsPapers$month == as.Date(as.character(pts[i, "date"]))),
            c("month", label)], pch = 19, cex = 0.75)

        if (!is.na(pts[i, "l1x2"])) {
            lines(x = c(as.Date(as.character(pts[i, "date"])), as.Date(as.character(pts[i,
                "date"])) + pts[i, "l1x2"]), y = c(newsPapers[which(newsPapers$month ==
                as.Date(as.character(pts[i, "date"]))), label], pts[i, "l1y2"]))
            if (!is.na(pts[i, "l2x2"])) {
                lines(x = c(as.Date(as.character(pts[i, "date"])) + pts[i, "l2x1"],
                  as.Date(as.character(pts[i, "date"])) + pts[i, "l2x2"]), y = c(pts[i,
                  "l2y2"], pts[i, "l2y2"]))
                if (pts[i, "l2x2"] > 0) {
                  text(x = as.Date(as.character(pts[i, "date"])) + (pts[i, "l2x2"] -
                    80), font = font, y = pts[i, "l2y2"], pos = pts[i, "pos"], cex = 0.75,
                    as.character(pts[i, "event"]))
                } else {
                  text(x = as.Date(as.character(pts[i, "date"])) + (pts[i, "l2x2"] +
                    80), font = font, y = pts[i, "l2y2"], pos = pts[i, "pos"], cex = 0.75,
                    as.character(pts[i, "event"]))
                }
            } else {
                if (pts[i, "l1x2"] > 0) {
                  text(x = as.Date(as.character(pts[i, "date"])) + (pts[i, "l1x2"] -
                    80), font = font, y = pts[i, "l1y2"], pos = pts[i, "pos"], cex = 0.75,
                    as.character(pts[i, "event"]))
                } else {
                  text(x = as.Date(as.character(pts[i, "date"])) + (pts[i, "l1x1"] +
                    80), font = font, y = pts[i, "l1y2"], pos = pts[i, "pos"], cex = 0.75,
                    as.character(pts[i, "event"]))
                }
            }
        } else {
            if (pts[i, "pos"] == 2) {
                text(newsPapers[which(newsPapers$month == as.Date(as.character(pts[i,
                  "date"]))), c("month", label)] + c(50, 0), pos = pts[i, "pos"],
                  cex = 0.75, as.character(pts[i, "event"]), font = font)
            }
            if (pts[i, "pos"] == 3) {
                text(newsPapers[which(newsPapers$month == as.Date(as.character(pts[i,
                  "date"]))), c("month", label)] - c(ifelse(i == 11, -50, 0), 5),
                  pos = pts[i, "pos"], cex = 0.75, gsub("999", "\n", as.character(pts[i,
                    "event"])), font = font)
            }
            if (pts[i, "pos"] == 4) {
                text(newsPapers[which(newsPapers$month == as.Date(as.character(pts[i,
                  "date"]))), c("month", label)] - c(50, 0), pos = pts[i, "pos"],
                  cex = 0.75, as.character(pts[i, "event"]), font = font)
            }
        }
    }

    # add peaks for which no international events have been found
    for (i in 18:nrow(pts)) {
        label <- as.character(pts[i, "keyword"])
        if (pts[i, "keyword"] == "CC") {
            ccol <- colCC
        } else {
            ccol <- colBD
        }
        points(newsPapers[which(newsPapers$month == as.Date(as.character(pts[i, "date"]))),
            c("month", label)], pch = 21, col = ccol, bg = "white", cex = 0.85)
    }

    par(xpd = FALSE)
    points(newsPapers[which(newsPapers$month == "1992-06-15"), c("month", "BD")],
        pch = 19, cex = 0.75)
    points(newsPapers[which(newsPapers$month == "1997-06-15"), c("month", "BD")],
        pch = 19, cex = 0.75)
    points(newsPapers[which(newsPapers$month == "2002-08-15"), c("month", "BD")],
        pch = 19, cex = 0.75)

    xmax <- sum(na.omit(newsPapers$CC))/1000
    xrng <- ifelse(xmax > 100, 40, ifelse(xmax > 50, 20, 10))


    # add inset
    par(new = TRUE, fig = c(0, 0.5, 0.7, 1), mar = c(3, 1, 1.5, 2), mgp = c(2.5,
        0.5, 0))
    graphics::plot(x = c(0, 0), y = c(0.5, 2.5), xlim = c(0, xrng * (floor(xmax/xrng) +
        1)), type = "n", bty = "n", axes = FALSE, ann = FALSE)

    rect(xleft = 0, xright = sum(na.omit(newsPapers$CC))/1000, ybottom = 0.6, ytop = 1.4,
        col = colCC, border = NA)
    rect(xleft = 0, xright = sum(na.omit(newsPapers$BD))/1000, ybottom = 1.6, ytop = 2.4,
        col = colBD, border = NA)

    text(x = c(-3, -3), y = c(0.95, 1.95), labels = c("Changements climatiques", "Biodiversit\u00e9"), pos = 4, col = c("grey10",
        "grey10"), cex = 1.25)

    axis(1, at = seq(0, xrng * (floor(xmax/xrng) + 1), xrng), labels = paste0(seq(0,
        xrng * (floor(xmax/xrng) + 1), xrng), "K"))
    mtext(1, text = paste("Nombre d'articles de presse", sep = ""), line = 1.75,
        cex = 1.34)

    invisible(NULL)
}



underline <- function(x, y, label, ...) {
    text(x, y, label, ...)
    sw <- strwidth(label)
    sh <- strheight(label)
    lines(x + c(-sw/2, sw/2), rep(y - 1.5 * sh/2, 2))
}
