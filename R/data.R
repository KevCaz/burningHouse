#' Monthly record of newspapers articles dealing with climate change (CC) or
#' biodiversity (BD).
#'
#' Time series of monthly record of newspapers articles dealing with climate
#' change (CC) and/or biodiversity (BD). Articles recorded were extracted from
#' newspapers we assumed to be the most popular in Canada (CA), United states
#' of America (US) and the United Kingdom (see \code{titles} dataset for
#' more details).
#'
#' @docType data
#' @keywords datasets
#' @author Nicolas Casajus and Pierre Legagneux
#' @name newsPapers
#' @usage data(newsPapers)
#' @format A data frame of 324 rows and 7 columns: column \code{month} records
#' the month associated with the number of articles recorded in the 6 other
#' columns, that is articles pertaining to either climate change (CC)
#' and/or biodiversity (BD) found in the most popular journals in the three
#' countries mentioned above (CA, US and UK).
"newsPapers"


#' Newspapers' names.
#'
#' Names of the newspapers included in the study.
#'
#' @docType data
#' @keywords datasets
#' @author Kevin Cazelles
#' @name newsNames
#' @usage data(newsNames)
#' @format A data frame of 12 rows (1 per journal) and 2 columns: \code{country}
#' and \code{name}.
"newsNames"



#' Major events and peaks detected.
#'
#' Significant peaks in the time series of the number of newspapers' articles.
#' Major important international event/conference related to either
#' biodiversity or climate change are added when they match a peak.
#'
#' @docType data
#' @keywords datasets
#' @author Nicolas Casajus and Kevin Cazelles
#' @name events
#' @usage data(events)
#' @format
#' A data frame of 29 rows (i.e. 29 significant peaks detected) and 15 columns:
#' \code{noid} is a unique identifier of the peak, \code{keyword} indicate the
#' theme of the event either climate change (CC) or biodiversity (BD),
#' \code{event} record the names of events, \code{place} the city where the
#' event took place and \code{date} the date when the event took place. Finally
#' the 10 other columns remaining are used to locate events and their labels on figure 2.
"events"


#' Canadian and American fundings allocated to climate change and biodiversity research.
#'
#' Time series with yearly frequency of Canadian and American fundings allocated
#' to climate change (CC) and biodiversity (BD) research.
#'
#' @docType data
#' @keywords datasets
#' @author Pierre Legagneux and Nicolas Casajus
#' @name fundingUSCAN
#' @usage data(fundingUSCAN)
#' @format A data frame of 25 rows and 6 columns: frst column \code{year} is the
#' year for which the research fundings are reported in the 4 following
#' columns (\code{BD_US}, \code{CC_US}, \code{CC_CA} and \code{BD_CA}). Finally,
#' the last column \code{CADtoUSD} gives the times series of exchange rate
#' (yearly average) for the Canadian dollar to US dollar.
"fundingUSCAN"


#' Worldwide scientific papers published in peer-reviewed literature on
#' biodiversity and climate change.
#'
#' Worldwide scientific papers published in peer-reviewed literature dealing with
#' biodiversity (BD) or climate change (CC) retrieved from Web of Science on
#' March 3rd, 2017.
#'
#' @docType data
#' @keywords datasets
#' @author Steve Vissault and Nicolas Casajus
#' @name sciPapers
#' @usage data(sciPapers)
#' @format A data frame of 26 rows and 3 columns: \code{year}, \code{records_BD}
#' and \code{records_CC}.
"sciPapers"
