## Resubmission
This is a resubmission. In this version I have:

* Expanded the description of the DESCRIPTION file by providing references to 
  the book "Statistics: Data analysis and modelling" and 
  the R companion, and providing more information about the package 
  functionality.

* Added missing \value fields to the .Rd files for all exported functions.

* Expanded \description fields in the .Rd files for exported functions.

## Test environments
* local install on Ubuntu 20.04, R 4.1.1
* win-builder (devel and release)
* r-hub builder (macOS 10.13.6 High Sierra, R-release, CRAN's setup; Apple Silicon (M1), macOS 11.6 Big Sur, R-release)

## R CMD check results
There were no ERRORs or WARNINGs or NOTEs on the local install or rhub builds

The was 1 NOTE on the win-builder submission (both in release and devel):

`Maintainer: 'Maarten Speekenbrink <m.speekenbrink@ucl.ac.uk>'`

which I believe is due to this being the first package I'm submitting to CRAN.