## sdamr: an R-package to accompany "Statistics: Data analysis and modelling"

Note: the R package has the name `sdamr` but the github repository has the name `sdam-r`. Maybe a little 
confusing, but oh well..

### Installation

The R package can be installed directly from the source on GitHub. 

<!-- , or from
binary packages provided.

#### Installation from binary

Download latest binary for Windows
Download latest binary for Mac
Download latest binary for Linux

-->

#### Installation from source

1. You will need to have R installed and I would also recommend R-studio.
<!-- 2. On MS Windows, you will need (https://cran.r-project.org/bin/windows/Rtools/)[Rtools] -->
2. In R, install the `remotes` package
```
install.packages("remotes")
```
3. Now install the `sdamr` package from GitHub by typing
```
remotes::install_github("mspeekenbrink/sdam-r")
```
4. Test if it works by typing
```
library(sdamr)
```
