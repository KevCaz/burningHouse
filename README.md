# Our house is burning: discrepancy in climate change vs biodiversity coverage in the media


## Abstract

To be added.



## Why this repository?

This repository reproduces the figures found in XXXXXX.
The form of a standard R package helps sharing the code and this repository
is a good media to discuss any issue regarding the code implementation.


## Installation

We recommend to use the [devtools](https://cran.r-project.org/web/packages/devtools/index.html)
R package. Once installed, you can install the package using the following
commands in your favorite R console:

```r
library(devtools)
install_github('KevCaz/burningHouse')
```

## Figures

```r
data(events); data(monthcan); data(monthusa); data(monthgbr)
grDevices::png(file='inst/fig/ms-figure2.png', width = 8, height = 6, res = 300, unit = 'in')
  figure2(events, monthcan, monthusa, monthgbr)
grDevices::dev.off()
```


## To do

- [ ] add figure 2
