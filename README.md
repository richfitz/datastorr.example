# datastorr.example

> Example use of datastorr

Example use of datastorr.

## Installation

```r
devtools::install_github("richfitz/datastorr")
devtools::install_github("richfitz/datastorr.example")
```

## Usage



To start with there is no data present:


```r
datastorr.example::mydata_versions()
```

```
## character(0)
```

Though there are versions on github:


```r
datastorr.example::mydata_versions(local=FALSE)
```

```
## [1] "1.0.0" "1.0.1" "1.0.2"
```

Retrieve the data:


```r
system.time(d <- mydata())
```

```
## Downloading: 580 B     Downloading: 580 B     Downloading: 580 B       |                                                                         |                                                                 |   0%  |                                                                         |=================================================================| 100%
```

```
##    user  system elapsed
##   0.036   0.005   1.152
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
##   0.001   0.000   0.002
```

The local versions:


```r
datastorr.example::mydata_versions()
```

```
## [1] "1.0.2"
```
