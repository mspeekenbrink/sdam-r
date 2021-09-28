#' Mean-centered values
#'  
#' @param x Numeric vector
#' @description \code{center} computes mean-centered values. It is a convenience wrapper to \code{scale}, equal to scale(x, scale=FALSE)
#' @return A numeric vector with mean-centered values
#' @examples
#' data(anchoring)
#' center(anchoring$everest_feet)
#' @export
center <- function(x) {
  return(scale(x, scale = FALSE))
}