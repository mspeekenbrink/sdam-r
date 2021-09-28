#' Compute the sample standard deviation
#' 
#' @param x Numeric vector
#' @param na.rm (logical) Should missing values be removed?
#' @description \code{sample_sd} computes the sample standard deviation, i.e. the square root of the sum of squared deviations of \code{x} from the mean divided by the total number of observations. This is in contrast to \code{sd}, which computes an unbiased estimate of the standard deviation (i.e. it divides the sum of squared deviations by n - 1).
#' @return A single numeric value equal to the sample variance 
#' @examples
#' data(anchoring)
#' sample_sd(anchoring$everest_feet)
#' @export
sample_sd <- function(x, na.rm = FALSE) {
  sqrt(sample_var(x,na.rm=na.rm))
}
