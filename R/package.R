##' Download the example data set from richfitz/datastorr.example
##'  (\url{https://github.com/richfitz/datastorr.example/})
##' @title Download example data set
##'
##' @param version Version number.  The default will load the most
##'   recent version on your computer or the most recent version known
##'   to the package if you have never downloaded the data before.
##'   With \code{mydata_del}, specifying \code{version = NULL} will
##'   delete \emph{all} data sets.
##'
##' @param path Path to store the data at.  If not given,
##'   \code{datastorr} will use \code{rappdirs} to find the best place
##'   to put persistent application data on your system.  You can
##'   delete the persistent data at any time by running
##'   \code{mydata_del(NULL)} (or \code{mydata_del(NULL, path)} if you
##'   use a different path).
##'
##' @export
mydata <- function(version = NULL, path = NULL) {
  datastorr::github_release_get(mydata_info(path), version)
}

##' @export
##' @rdname mydata
##'
##' @param local Logical indicating if local or github versions should
##'   be polled.  With any luck, \code{local = FALSE} is a superset of
##'   \code{local = TRUE}.  For \code{mydata_version_current}, if
##'   \code{TRUE}, but there are no local versions, then we do check
##'   for the most recent github version.
##'
mydata_versions <- function(local = TRUE, path = NULL) {
  datastorr::github_release_versions(mydata_info(path), local)
}

##' @export
##' @rdname mydata
mydata_version_current <- function(local = TRUE, path = NULL) {
  datastorr::github_release_version_current(mydata_info(path), local)
}

##' @export
##' @rdname mydata
mydata_del <- function(version, path = NULL) {
  datastorr::github_release_del(mydata_info(path), version)
}

## Core data:
mydata_info <- function(path) {
  datastorr::github_release_info("richfitz/datastorr.example",
                                 filename = NULL,
                                 read = readRDS,
                                 path = path)
}

##' Maintainer-only function for releasing data.  This will look at
##' the version in the DESCRIPTION file and make a data release if the
##' GitHub repository contains the same version as we have locally.
##' Requires the \code{GITHUB_TOKEN} environment variable to be set.
##'
##' @title Make a data release.
##' @param ... Parameters passed through to \code{\link{github_release_create}}
##' @param path Path to the data (see \code{\link{mydata}}).
##' @export
mydata_release <- function(..., path = NULL) {
  datastorr::github_release_create(mydata_info(path), ...)
}
