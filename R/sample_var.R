#' Compute the sample variance
#' 
#' @param x Numeric vector
#' @param na.rm (logical) Should missing values be removed?
#' @examples
#' data(anchoring)
#' sample_var(anchoring$everest_feet)
#' @export
sample_var <- function(x, na.rm = FALSE) {
  if(NCOL(x) > 1) stop("This function is for single variables only")
  x <- as.vector(x)
  if(na.rm) {
    x <- x[!is.na(x)]
  } else {
    n <- length(x)
  }
  return((n-1)*stats::var(x)/n)
}