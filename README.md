# dfnetter

Researchers often store their collected network data in a tabular data format. However, for most of the network packaages available for the R statistics suite a tabular data format is not suitable and the data need to be transoformed into more common data structures like edge lists, adjacency lists, adjacency matrices, etc. Since this is a repetiitve task thats needs to be performed by many ressearchers, over and over again procedures are provided that simplify this task.

## Details

Storing network data in Excel and SPSS Tables is a common practice in some fields of the social sciences. Although modes for storing the data are possible, thsi is usually done by directly embedding the adjacency matrices of the social matrices into the table. 

Given a network of N participants the resulting table and dataset are required to have at least the dimensions of N rows by N + 1 columns, where the additional column is used to store the participants id. This scheme for data storage is straightforward as long as the dataset consists of only one network. In case of more than one network in the dataset, the matter is getting more complicated. The number of columns to store the networks now has to be set to the maximum possible number of participants in the largest network. In the context of educational research and research conducted in classes 40 columns is usually sufficient. 

## Installation

You can install the developement version of dfnetter from [GitHub](https://CRAN.R-project.org) with:

``` r
devtools::install_github("https://github.com/thorstenhenke/dfnetter")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(dfnetter)
## basic example code
```

