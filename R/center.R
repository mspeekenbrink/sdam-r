#' Mean-center a variable
#' 
#' This is a convenience function equal to scale(x, scale=FALSE)
#' 
#' @param x Numeric vector
#' @examples
#' data(anchoring)
#' center(anchoring$everest_feet)
#' @export
center <- function(x) {
  return(scale(x, scale = FALSE))
}