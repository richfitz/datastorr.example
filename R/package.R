##' Download the example data set from dataverse.example
##' @title Download example data set
##'
##' @param version Version number.  The default will load the most
##'   recent version on your computer or the most recent version known
##'   to the package if you have never downloaded the data before.
##'   With \code{mydata_del}, specifying \code{version=NULL} will
##'   delete \emph{all} data sets.
##'
##' @export
mydata <- function(version=NULL) {
  dataverse::github_release_get(mydata_info(), version)
}

##' @export
##' @rdname mydata
##' @param type Type of version to return: options are "local"
##'   (versions installed locally) or "github" (versions available on
##'   github).  With any luck, "github" is a superset of "local".  For
##'   \code{mydata_version_current}, if "local" is given, but there
##'   are no local versions, then we do check for the most recent
##'   github version.
mydata_versions <- function(type="local") {
  dataverse::github_release_versions(mydata_info(), type)
}

##' @export
##' @rdname mydata
mydata_version_current <- function(type="local") {
  dataverse::github_release_version_current(mydata_info(), type)
}

##' @export
##' @rdname mydata
mydata_version_del <- function(version) {
  dataverse::github_release_del(mydata_info(), version)
}

## Core data:
mydata_info <- function() {
  dataverse::github_release_info("richfitz/dataverse.example", readRDS)
}
