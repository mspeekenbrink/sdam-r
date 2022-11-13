## Test environments
* local install on Ubuntu 20.04, R 4.2.2
* win-builder (devel and release)
* r-hub builder (macOS 10.13.6 High Sierra, R-release, CRAN's setup)

r-hub builder returned 1 NOTE:  
* checking data for non-ASCII characters ... NOTE  
  Note: found 1 marked UTF-8 string
  When I checked https://cloud.r-project.org/web/checks/check_results_sdamr.html, I found the same not for macos and fedora versions. I could not find the string when checking the datafiles on my own system. As this is only a NOTE, I believe it is fine to leave this for now.

## R CMD check results
There were no ERRORs or WARNINGs.

There was 1 NOTE:

* checking for future file timestamps ... NOTE  
  unable to verify current time  
  I believe this is due to to http://worldclockapi.com/ being inaccessible (see https://stackoverflow.com/questions/63613301/r-cmd-check-note-unable-to-verify-current-time)