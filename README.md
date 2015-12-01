# dataverse.example

> Example use of dataverse

Example use of dataverse.

## Installation

```r
devtools::install_github(c("richfitz/storr@simplify", "richfitz/dataverse"))
devtools::install_github("richfitz/dataverse.example")
```

## Usage


```r
library(dataverse.example)
```



To start with there is no data present:


```r
mydata_versions()
```

```
## character(0)
```

Though there are versions on github:


```r
mydata_versions(local=FALSE)
```

```
## [1] "0.0.1" "1.0.1"
```

Retrieve the data:


```r
system.time(d <- mydata())
```

```
## Downloading: 590 B     Downloading: 590 B     Downloading: 590 B       |                                                                         |                                                                 |   0%  |                                                                         |=================================================================| 100%
```

```
##    user  system elapsed
##   0.007   0.007   0.702
```

The progress bar looks a bit messed up but should work well interactively.  The relevant time is the elapsed time, rather than user or system time.

The data in all its glory:
```
head(d)
```

Subsequent calls are very fast:


```r
system.time(d <- mydata())
```

```
##    user  system elapsed
##   0.003   0.000   0.003
```

The local versions:


```r
mydata_versions()
```

```
## [1] "1.0.1"
```
