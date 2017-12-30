# burningHouse

## Description

This repository contain all the data, analyses and how to reproduce figures found in the articles *Our house is burning: discrepancy in climate change vs biodiversity coverage in the media* by Legagneux *et al.* DOI: 2BAdded.

We use a standard R package to:

  1- efficiently assess the quality of our code (here we simply use `R CMD check`)

  2- readily share our code (see installation section)

We however acknowledge that despite the form of a standard R package, the code
presented is more a organized script that a package (*i.e.* functions included
are not general).

## Current status

[![Build Status](https://travis-ci.org/KevCaz/burningHouse.svg?branch=master)](https://travis-ci.org/KevCaz/burningHouse)
[![Build status](https://ci.appveyor.com/api/projects/status/qh4ntjow6tcho9oh/branch/master?svg=true)](https://ci.appveyor.com/project/KevCaz/burninghouse/branch/master)


## Abstract of the paper

> Scientists, policy makers and journalists are three key, interconnected players involved in prioritizing and implementing solutions to mitigate the consequences of anthropogenic pressures on the environment. We extensively scrutinized the scientific literature, research funding and press articles from the USA, Canada and United Kingdom addressing climate change and biodiversity issues between 1991 and 2016. We found that media coverage of climate change was up to eight times greater compared to biodiversity. This discrepancy could not be explained by different scientific output between the two issues. Moreover, climate change media coverage was often related to specific events whereas no such indication of a connection was found in the case of biodiversity. An international communication strategy is deeply required to raise public awareness on biodiversity issues, which in turn could provide rewards both in terms of increased research funding and discoveries.




## Installation

The easiest way to install the package in to use the [devtools](https://cran.r-project.org/web/packages/devtools/index.html)
R package. Once installed, you can install the package using the following
commands in your favorite R console:

```r
library(devtools)
install_github('KevCaz/burningHouse')
```




## Data

We collect data and store them as data frame. Below is the list of data frames
available:

- **events**: international events reported on figure 2 (see below).
- **fundingsUSCA**: fundings time series (yearly frequency).
- **newsPaper**: number of articles in newspapers time series (yearly frequency).
- **newsNames**: names of the news papers included in the study.
- **sciPaper**: number of articles in newspapers time series (yearly frequency).
<!-- - **sciNames**: names of the news papers included in the study. -->

To use these datasets you should call `data()` function, for instance:

```r
data(titles)
```

Some details are provided for the data using `?` or `help()`:


```r
?titles
```




## Figures

Creating the figures below required to 1- collect data and 2- do a peaks
detection analysis. Data are available as data frames and the peaks detection
analysis is presented as a example of the `detectPeaks()` function we used.


### Figure 1a

```r
data(sciPapers)
grDevices::png('inst/fig/ms-figure1a.png', height = 5, width = 7, res = 300, unit = 'in')
  figure1a(
    sciPapers$year,
    sciPapers$records_CC,
    sciPapers$records_BD
  )
grDevices::dev.off()
```

![](inst/fig/ms-figure1a.png)


### Figure 1b

```r
data(fundingUSCAN)
grDevices::png("inst/fig/ms-figure1b.png", height = 5, width = 7, res = 300, unit = "in")
  figure1b(
    fundingUSCAN$year,
    fundingUSCAN$CC_CA + fundingUSCAN$CC_US,
    fundingUSCAN$BD_CA + fundingUSCAN$BD_US,
    col1 = "#604a3c", col2 = "#69ab78"
  )
grDevices::dev.off()
```

![](inst/fig/ms-figure1b.png)


### Figure 2

```r
data(events); data(newsPapers);
grDevices::png(file='inst/fig/ms-figure2.png', width = 8, height = 6, res = 300, unit = 'in')
  figure2(events, newsPapers, col1 = "#604a3c", col2 = "#69ab78")
grDevices::dev.off()
```

![](inst/fig/ms-figure2.png)


## To do

- [ ] review documentation (especially for data we should detail what columns' content);
- [ ] add the DOI of the paper.
- [ ] use Zenodo for the repo.
- [X] `newsPapers$CC_GB` should be `newsPapers$CC_UK`.
