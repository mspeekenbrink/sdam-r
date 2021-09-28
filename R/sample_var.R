#' Compute the sample variance
#' 
#' @param x Numeric vector
#' @param na.rm (logical) Should missing values be removed?
#' @description \code{sample_var} computes the sample variance, i.e. the sum of squared deviations of \code{x} from the mean divided by the total number of observations. This is in contrast to \code{var}, which computes an unbiased estimate of the variance (i.e. it divides the sum of squared deviations by n - 1).
#' @return A single numeric value equal to the sample variance 
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